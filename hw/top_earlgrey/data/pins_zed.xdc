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

# reset signal
set_false_path -from [get_ports IO_RST_N]

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

## Reset
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS25} [get_ports {IO_RST_N}];

## Buttons
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS25} [get_ports {btnu_i}];
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS25} [get_ports {btnr_i}];
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS25} [get_ports {btnd_i}];
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS25} [get_ports {btnl_i}];

## PMOD A
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {pad_jtag_tms}];
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports {pad_jtag_tdi}];
set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports {pad_jtag_tdo}];
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports {pad_jtag_tck}];
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports {IO_URX}]; # pad_uart_rx
set_property -dict {PACKAGE_PIN AB10 IOSTANDARD LVCMOS33} [get_ports {IO_UTX}]; # pad_uart_tx
set_property -dict {PACKAGE_PIN AB9 IOSTANDARD LVCMOS33} [get_ports {pad_uart_rts}];
set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS33} [get_ports {pad_uart_cts}];

## PMOD B
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports {IO_DPS3}];  # spi_device_csb_i and jtag_tms]
set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports {IO_DPS1}]; # spi_device_mosi_i and jtag_tdi]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {IO_DPS2}];  # spi_device_miso_o and jtag_tdo]
set_property -dict {PACKAGE_PIN W8 IOSTANDARD LVCMOS33} [get_ports {IO_DPS0}]; # spi_device_sck_i and jtag_tck]
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
set_property -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS25} [get_ports {IO_GP0}];
set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS25} [get_ports {IO_GP1}];
set_property -dict {PACKAGE_PIN H22 IOSTANDARD LVCMOS25} [get_ports {IO_GP2}];
set_property -dict {PACKAGE_PIN F21 IOSTANDARD LVCMOS25} [get_ports {IO_GP3}];
set_property -dict {PACKAGE_PIN H19 IOSTANDARD LVCMOS25} [get_ports {IO_GP4}];
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS25} [get_ports {IO_GP5}];
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS25} [get_ports {IO_GP6}];
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS25} [get_ports {IO_GP7}];

# constraints
# ad9361

set_property  -dict {PACKAGE_PIN  M19  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_p]        ; ## G6   FMC_LPC_LA00_CC_P
set_property  -dict {PACKAGE_PIN  M20  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_n]        ; ## G7   FMC_LPC_LA00_CC_N
set_property  -dict {PACKAGE_PIN  N19  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_frame_in_p]      ; ## D8   FMC_LPC_LA01_CC_P
set_property  -dict {PACKAGE_PIN  N20  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_frame_in_n]      ; ## D9   FMC_LPC_LA01_CC_N
set_property  -dict {PACKAGE_PIN  P17  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_p[0]]    ; ## H7   FMC_LPC_LA02_P
set_property  -dict {PACKAGE_PIN  P18  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_n[0]]    ; ## H8   FMC_LPC_LA02_N
set_property  -dict {PACKAGE_PIN  N22  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_p[1]]    ; ## G9   FMC_LPC_LA03_P
set_property  -dict {PACKAGE_PIN  P22  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_n[1]]    ; ## G10  FMC_LPC_LA03_N
set_property  -dict {PACKAGE_PIN  M21  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_p[2]]    ; ## H10  FMC_LPC_LA04_P
set_property  -dict {PACKAGE_PIN  M22  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_n[2]]    ; ## H11  FMC_LPC_LA04_N
set_property  -dict {PACKAGE_PIN  J18  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_p[3]]    ; ## D11  FMC_LPC_LA05_P
set_property  -dict {PACKAGE_PIN  K18  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_n[3]]    ; ## D12  FMC_LPC_LA05_N
set_property  -dict {PACKAGE_PIN  L21  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_p[4]]    ; ## C10  FMC_LPC_LA06_P
set_property  -dict {PACKAGE_PIN  L22  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_n[4]]    ; ## C11  FMC_LPC_LA06_N
set_property  -dict {PACKAGE_PIN  T16  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_p[5]]    ; ## H13  FMC_LPC_LA07_P
set_property  -dict {PACKAGE_PIN  T17  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_data_in_n[5]]    ; ## H14  FMC_LPC_LA07_N
set_property  -dict {PACKAGE_PIN  J21  IOSTANDARD LVDS_25} [get_ports tx_clk_out_p]                      ; ## G12  FMC_LPC_LA08_P
set_property  -dict {PACKAGE_PIN  J22  IOSTANDARD LVDS_25} [get_ports tx_clk_out_n]                      ; ## G13  FMC_LPC_LA08_N
set_property  -dict {PACKAGE_PIN  R20  IOSTANDARD LVDS_25} [get_ports tx_frame_out_p]                    ; ## D14  FMC_LPC_LA09_P
set_property  -dict {PACKAGE_PIN  R21  IOSTANDARD LVDS_25} [get_ports tx_frame_out_n]                    ; ## D15  FMC_LPC_LA09_N
set_property  -dict {PACKAGE_PIN  N17  IOSTANDARD LVDS_25} [get_ports tx_data_out_p[0]]                  ; ## H16  FMC_LPC_LA11_P
set_property  -dict {PACKAGE_PIN  N18  IOSTANDARD LVDS_25} [get_ports tx_data_out_n[0]]                  ; ## H17  FMC_LPC_LA11_N
set_property  -dict {PACKAGE_PIN  P20  IOSTANDARD LVDS_25} [get_ports tx_data_out_p[1]]                  ; ## G15  FMC_LPC_LA12_P
set_property  -dict {PACKAGE_PIN  P21  IOSTANDARD LVDS_25} [get_ports tx_data_out_n[1]]                  ; ## G16  FMC_LPC_LA12_N
set_property  -dict {PACKAGE_PIN  L17  IOSTANDARD LVDS_25} [get_ports tx_data_out_p[2]]                  ; ## D17  FMC_LPC_LA13_P
set_property  -dict {PACKAGE_PIN  M17  IOSTANDARD LVDS_25} [get_ports tx_data_out_n[2]]                  ; ## D18  FMC_LPC_LA13_N
set_property  -dict {PACKAGE_PIN  R19  IOSTANDARD LVDS_25} [get_ports tx_data_out_p[3]]                  ; ## C14  FMC_LPC_LA10_P
set_property  -dict {PACKAGE_PIN  T19  IOSTANDARD LVDS_25} [get_ports tx_data_out_n[3]]                  ; ## C15  FMC_LPC_LA10_N
set_property  -dict {PACKAGE_PIN  K19  IOSTANDARD LVDS_25} [get_ports tx_data_out_p[4]]                  ; ## C18  FMC_LPC_LA14_P
set_property  -dict {PACKAGE_PIN  K20  IOSTANDARD LVDS_25} [get_ports tx_data_out_n[4]]                  ; ## C19  FMC_LPC_LA14_N
set_property  -dict {PACKAGE_PIN  J16  IOSTANDARD LVDS_25} [get_ports tx_data_out_p[5]]                  ; ## H19  FMC_LPC_LA15_P
set_property  -dict {PACKAGE_PIN  J17  IOSTANDARD LVDS_25} [get_ports tx_data_out_n[5]]                  ; ## H20  FMC_LPC_LA15_N

set_property  -dict {PACKAGE_PIN  G20  IOSTANDARD LVCMOS25} [get_ports gpio_status[0]]                   ; ## G21  FMC_LPC_LA20_P
set_property  -dict {PACKAGE_PIN  G21  IOSTANDARD LVCMOS25} [get_ports gpio_status[1]]                   ; ## G22  FMC_LPC_LA20_N
set_property  -dict {PACKAGE_PIN  E19  IOSTANDARD LVCMOS25} [get_ports gpio_status[2]]                   ; ## H25  FMC_LPC_LA21_P
set_property  -dict {PACKAGE_PIN  E20  IOSTANDARD LVCMOS25} [get_ports gpio_status[3]]                   ; ## H26  FMC_LPC_LA21_N
set_property  -dict {PACKAGE_PIN  G19  IOSTANDARD LVCMOS25} [get_ports gpio_status[4]]                   ; ## G24  FMC_LPC_LA22_P
set_property  -dict {PACKAGE_PIN  F19  IOSTANDARD LVCMOS25} [get_ports gpio_status[5]]                   ; ## G25  FMC_LPC_LA22_N
set_property  -dict {PACKAGE_PIN  E15  IOSTANDARD LVCMOS25} [get_ports gpio_status[6]]                   ; ## D23  FMC_LPC_LA23_P
set_property  -dict {PACKAGE_PIN  D15  IOSTANDARD LVCMOS25} [get_ports gpio_status[7]]                   ; ## D24  FMC_LPC_LA23_N
set_property  -dict {PACKAGE_PIN  A18  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[0]]                      ; ## H28  FMC_LPC_LA24_P
set_property  -dict {PACKAGE_PIN  A19  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[1]]                      ; ## H29  FMC_LPC_LA24_N
set_property  -dict {PACKAGE_PIN  D22  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[2]]                      ; ## G27  FMC_LPC_LA25_P
set_property  -dict {PACKAGE_PIN  C22  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[3]]                      ; ## G28  FMC_LPC_LA25_N
set_property  -dict {PACKAGE_PIN  G15  IOSTANDARD LVCMOS25} [get_ports gpio_en_agc]                      ; ## H22  FMC_LPC_LA19_P
set_property  -dict {PACKAGE_PIN  G16  IOSTANDARD LVCMOS25} [get_ports gpio_sync]                        ; ## H23  FMC_LPC_LA19_N
set_property  -dict {PACKAGE_PIN  A16  IOSTANDARD LVCMOS25} [get_ports gpio_resetb]                      ; ## H31  FMC_LPC_LA28_P
set_property  -dict {PACKAGE_PIN  J20  IOSTANDARD LVCMOS25} [get_ports enable]                           ; ## G18  FMC_LPC_LA16_P
set_property  -dict {PACKAGE_PIN  K21  IOSTANDARD LVCMOS25} [get_ports txnrx]                            ; ## G19  FMC_LPC_LA16_N

set_property  -dict {PACKAGE_PIN  F18  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn]         ; ## D26  FMC_LPC_LA26_P
set_property  -dict {PACKAGE_PIN  E18  IOSTANDARD LVCMOS25} [get_ports spi_clk]                          ; ## D27  FMC_LPC_LA26_N
set_property  -dict {PACKAGE_PIN  E21  IOSTANDARD LVCMOS25} [get_ports spi_mosi]                         ; ## C26  FMC_LPC_LA27_P
set_property  -dict {PACKAGE_PIN  D21  IOSTANDARD LVCMOS25} [get_ports spi_miso]                         ; ## C27  FMC_LPC_LA27_N

# clocks

create_clock -name rx_clk       -period  8 [get_ports rx_clk_in_p]

