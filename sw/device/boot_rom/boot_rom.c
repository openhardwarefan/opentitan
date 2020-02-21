// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/boot_rom/bootstrap.h"
#include "sw/device/boot_rom/chip_info.h"  // Generated.
#include "sw/device/lib/arch/device.h"
#include "sw/device/lib/base/stdasm.h"
#include "sw/device/lib/common.h"
#include "sw/device/lib/dif/dif_gpio.h"
#include "sw/device/lib/flash_ctrl.h"
#include "sw/device/lib/log.h"
#include "sw/device/lib/pinmux.h"
#include "sw/device/lib/spi_device.h"
#include "sw/device/lib/uart.h"

/**
 * This symbol is defined in sw/device/boot_rom/rom_link.ld,
 * and describes the location of the flash header.
 *
 * The actual contents are not defined by the ROM, but rather
 * by the flash binary: see sw/device/exts/common/flash_link.ld
 * for that.
 */
extern struct {
  void (*entry)(void);
} _flash_header;

inline uint64_t ibex_mcycle_read() {
  uint32_t cycle_low = 0;
  uint32_t cycle_high = 0;
  uint32_t cycle_high_2 = 0;
  asm volatile(
      "read%=:"
      "  csrr %0, mcycleh;"     // Read |mcycleh|.
      "  csrr %1, mcycle;"      // Read |mcycle|.
      "  csrr %2, mcycleh;"     // Read |mcycleh| again.
      "  bne  %0, %2, read%=;"  // Try again if |mcycle| overflowed before
                                // reading |mcycleh|.
      : "+r"(cycle_high), "=r"(cycle_low), "+r"(cycle_high_2)
      :);
  return (uint64_t)cycle_high << 32 | cycle_low;
}

const uint32_t kIbexClockFreqHz_bootrom = 50 * 1000 * 1000;  // 50 MHz


void usleep_bootrom(uint32_t usec) {
  uint64_t cycles = (uint64_t)kIbexClockFreqHz_bootrom * usec / 1000000;
  uint64_t start = ibex_mcycle_read();
  while ((ibex_mcycle_read() - start) < cycles) {
  }
}

inline uint32_t mmio_region_read32_bootrom(uint32_t base, uint32_t offset) {
  return ((volatile uint32_t *)base)[offset / sizeof(uint32_t)];
}

#define GPIO0_BASE_ADDR 0x40010000u

static dif_gpio_t gpio;


void _boot_start(void) {
  pinmux_init();
  uart_init(kUartBaudrate);
  uart_send_str((char *)chip_info);

  int bootstrap_err = bootstrap();
  if (bootstrap_err != 0) {
    LOG_ERROR("Bootstrap failed with status code: %d\n", bootstrap_err);
    // Currently the only way to recover is by a hard reset.
    return;
  }

  LOG_INFO("Boot ROM initialisation has completed, jump into flash!\n");

  // Enable GPIO: 0-7 and 16 is input, 8-15 is output
  dif_gpio_config_t gpio_config = {.base_addr =
                                       mmio_region_from_addr(GPIO0_BASE_ADDR)};
  dif_gpio_init(&gpio_config, &gpio);
  dif_gpio_output_mode_all_set(&gpio, 0xFF00);
  
  // Give a LED pattern as startup indicator for 5 seconds
  dif_gpio_all_write(&gpio, 0xFF00);  // all LEDs on
 
  do 
  {
  // uint32_t uartctrl = mmio_region_read32_bootrom(0x40000000, 0x0c);

      for (int i = 0; i < 32; i++) {
        usleep_bootrom(100 * 1000);  // 100 ms

        dif_gpio_pin_write(&gpio, 8 + (i % 8), (i / 8) % 2);
      }

    // dif_gpio_output_mode_all_set(&gpio, (uartctrl & 0xFF) << 8);  // all LEDs on

    // usleep_bootrom(5000 * 1000);  // 100 ms

    // dif_gpio_output_mode_all_set(&gpio, ((uartctrl >> 8) & 0xFF) << 8);  // all LEDs on

    // usleep_bootrom(5000 * 1000);  // 100 ms

    // dif_gpio_output_mode_all_set(&gpio, ((uartctrl >> 16) & 0xFF) << 8);  // all LEDs on

    // usleep_bootrom(5000 * 1000);  // 100 ms


    // dif_gpio_output_mode_all_set(&gpio, ((uartctrl >> 24) & 0xFF) << 8);  // all LEDs on

    // usleep_bootrom(5000 * 1000);  // 100 ms

    // uart_send_str((char *)chip_info);

  }while(1);

  // while(1);

  // Jump into flash. At this point, the contents of the flash binary have been
  // verified, and we can transfer control directly to it. It is the
  // flash binary's responsibily to set up its own stack, and to never
  // return.
  _flash_header.entry();
}
