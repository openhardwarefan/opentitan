# This file has been prepared by Digilent and edited for use in this project.
# Upstream source:
# https://github.com/analogdevicesinc/hdl/projects/common/zed/zed_system_constr.xdc
# https://github.com/analogdevicesinc/hdl/blob/master/projects/fmcomms2/zed/system_constr.xdc

# constraints
#######################################
#  _______ _           _              #
# |__   __(_)         (_)             #
#    | |   _ _ __ ___  _ _ __   __ _  #
#    | |  | | '_ ` _ \| | '_ \ / _` | #
#    | |  | | | | | | | | | | | (_| | #
#    |_|  |_|_| |_| |_|_|_| |_|\__, | #
#                               __/ | #
#                              |___/  #
#######################################


#Create constraint for the clock input of the ZedBoard
create_clock -add -name sys_clk_pin -period 10.000  -waveform {0 5} [get_ports IO_CLK]
## JTAG
create_clock -period 100.000 -name tck -waveform {0.000 50.000} [get_ports {IO_DPS0}]
set_input_jitter tck 1.000
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_tck_i]


# minimize routing delay
set_input_delay -clock tck -clock_fall 5.000 [get_ports {IO_DPS1}]
set_input_delay -clock tck -clock_fall 5.000 [get_ports {IO_DPS3}]
set_output_delay -clock tck 5.000 [get_ports {IO_DPS2}]
set_false_path -from [get_ports {IO_DPS4}]

set_max_delay -to [get_ports {IO_DPS2}] 20.000
set_max_delay -from [get_ports {IO_DPS3}] 20.000
set_max_delay -from [get_ports {IO_DPS1}] 20.000
set_max_delay -from [get_ports {IO_DPS4}] 20.000



# reset signal
set_false_path -from [get_ports IO_RST]

#############################################################
#  _____ ____         _____      _   _   _                  #
# |_   _/ __ \       / ____|    | | | | (_)                 #
#   | || |  | |_____| (___   ___| |_| |_ _ _ __   __ _ ___  #
#   | || |  | |______\___ \ / _ \ __| __| | '_ \ / _` / __| #
#  _| || |__| |      ____) |  __/ |_| |_| | | | | (_| \__ \ #
# |_____\____/      |_____/ \___|\__|\__|_|_| |_|\__, |___/ #
#                                                 __/ |     #
#                                                |___/      #
#############################################################

## Sys clock
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports {IO_CLK}];

## Reset on zedboard button's input is high when no press
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS18} [get_ports {IO_RST}];

## Buttons
## set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS18} [get_ports {btnu_i}];
## set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS18} [get_ports {btnr_i}];
## set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS18} [get_ports {btnd_i}];
## set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS18} [get_ports {btnl_i}];

## PMOD A
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {IO_DPS3}];  # spi_device_csb_i and jtag_tms]
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports {IO_DPS1}]; # spi_device_mosi_i and jtag_tdi]
set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports {IO_DPS2}];  # spi_device_miso_o and jtag_tdo]
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports {IO_DPS0}]; # spi_device_sck_i and jtag_tck]
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports {IO_URX}]; # pad_uart_rx
set_property -dict {PACKAGE_PIN AB10 IOSTANDARD LVCMOS33} [get_ports {IO_UTX}]; # pad_uart_tx
## set_property -dict {PACKAGE_PIN AB9 IOSTANDARD LVCMOS33} [get_ports {pad_uart_rts}];
## set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS33} [get_ports {pad_uart_cts}];

## PMOD B
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33 DRIVE 8 SLEW FAST } [get_ports { IO_USB_DP0 }];
set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33 DRIVE 8 SLEW FAST } [get_ports { IO_USB_DN0 }];
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports { IO_USB_PULLUP0 }]; 
set_property -dict {PACKAGE_PIN W8 IOSTANDARD LVCMOS33 } [get_ports { IO_USB_SENSE0 }];
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {IO_DPS4}]; # jtag_TRST_N
set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports {IO_DPS5}]; # jtag_SRST_N
set_property -dict {PACKAGE_PIN V9 IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN} [get_ports {IO_DPS6}]; #Muxed select: 0 = JTAG, 1 = spi_device
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN} [get_ports {IO_DPS7}]; #Bootstrap pin for software

## LEDs
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {IO_GP8}];
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports {IO_GP9}];
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {IO_GP10}];
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {IO_GP11}];
set_property -dict {PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [get_ports {IO_GP12}];
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [get_ports {IO_GP13}];
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {IO_GP14}];
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {IO_GP15}];

## Switches
set_property -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS18} [get_ports {IO_GP0}];
set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS18} [get_ports {IO_GP1}];
set_property -dict {PACKAGE_PIN H22 IOSTANDARD LVCMOS18} [get_ports {IO_GP2}];
set_property -dict {PACKAGE_PIN F21 IOSTANDARD LVCMOS18} [get_ports {IO_GP3}];
set_property -dict {PACKAGE_PIN H19 IOSTANDARD LVCMOS18} [get_ports {IO_GP4}];
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS18} [get_ports {IO_GP5}];
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS18} [get_ports {IO_GP6}];
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS18} [get_ports {IO_GP7}];


## Clock Domain Crossings
create_generated_clock -name clk_50_unbuf -source [get_pin clkgen/pll/CLKIN1] [get_pin clkgen/pll/CLKOUT0]
create_generated_clock -name clk_48_unbuf -source [get_pin clkgen/pll/CLKIN1] [get_pin clkgen/pll/CLKOUT1]
set_clock_groups -group clk_50_unbuf -group clk_48_unbuf -asynchronous
