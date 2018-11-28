#Clocks
#SYSCLK
create_clock -period 5.000 -name pcie_clk -waveform {0.000 2.500} [get_ports clkp_i]
set_property IOSTANDARD LVDS [get_ports clkn_i]
set_property IOSTANDARD LVDS [get_ports clkp_i]
set_property PACKAGE_PIN AD12 [get_ports clkp_i]
set_property PACKAGE_PIN AD11 [get_ports clkn_i]

#set_property PACKAGE_PIN K25 [get_ports clkn_i]
#set_property IOSTANDARD LVDS_25 [get_ports clkn_i]
#set_property PACKAGE_PIN L25 [get_ports clkp_i]
#set_property IOSTANDARD LVDS_25 [get_ports clkp_i]

set_property PACKAGE_PIN G12 [get_ports rst_i] 
set_property IOSTANDARD LVCMOS25 [get_ports rst_i]

set_property PACKAGE_PIN AG5 [get_ports button] 
set_property IOSTANDARD LVCMOS15 [get_ports button]

#la27_p
#la27_n
set_property PACKAGE_PIN B19 [get_ports rsta_o]

set_property IOSTANDARD LVCMOS25 [get_ports rsta_o]


#la18
set_property PACKAGE_PIN E21 [get_ports rstb_o]

set_property IOSTANDARD LVCMOS25 [get_ports rstb_o]

#la31_p
#la31_n
#set_property PACKAGE_PIN Y23 [get_ports {dataout_p[0]}]
#set_property PACKAGE_PIN Y24 [get_ports {dataout_n[0]}]
#set_property PACKAGE_PIN AD29 [get_ports {dataout_p[0]}]
#set_property PACKAGE_PIN AE29 [get_ports {dataout_n[0]}]
##la29_cc_p
##la29_cc_n
#set_property PACKAGE_PIN AE28 [get_ports {dataout_p[1]}]
#set_property PACKAGE_PIN AF28 [get_ports {dataout_n[1]}]
##la32_p
##la32_n
#set_property PACKAGE_PIN Y30 [get_ports {dataout_p[2]}]
#set_property PACKAGE_PIN AA30 [get_ports {dataout_n[2]}]

##la33_p
##la33_n
#set_property PACKAGE_PIN AC29 [get_ports {dataout_p[3]}]
#set_property PACKAGE_PIN AC30 [get_ports {dataout_n[3]}]



#set_property PACKAGE_PIN H24   [get_ports datain_p[0]]
#set_property PACKAGE_PIN H25    [get_ports datain_n[0]]

#set_property PACKAGE_PIN K25 [get_ports datain_n[0]]
#set_property PACKAGE_PIN L25 [get_ports datain_p[0]]

#la31, lane 0
#set_property PACKAGE_PIN L25    [get_ports datain_p[0]]
#set_property PACKAGE_PIN K25    [get_ports datain_n[0]]

set_property PACKAGE_PIN G22    [get_ports datain_p[0]]
set_property PACKAGE_PIN F22    [get_ports datain_n[0]]

#la32, lane 1
set_property PACKAGE_PIN D21 [get_ports datain_p[1]]
set_property PACKAGE_PIN C21 [get_ports datain_n[1]]

#la30, lane 2
set_property PACKAGE_PIN D22 [get_ports datain_p[2]]
set_property PACKAGE_PIN C22 [get_ports datain_n[2]]

#la28, lane 3
set_property PACKAGE_PIN D16 [get_ports datain_p[3]]
set_property PACKAGE_PIN C16 [get_ports datain_n[3]]




set_property PACKAGE_PIN K25 [get_ports clkn_o]
set_property IOSTANDARD LVDS_25 [get_ports clkn_o]
set_property DIFF_TERM TRUE [get_ports clkn_o]

set_property PACKAGE_PIN L25 [get_ports clkp_o]
set_property IOSTANDARD LVDS_25 [get_ports clkp_o]
set_property DIFF_TERM TRUE [get_ports clkp_o]
###la21, lane 0
#set_property PACKAGE_PIN A20    [get_ports dataout_p[0]]
#set_property PACKAGE_PIN A21    [get_ports dataout_n[0]]

##la29, lane 1
#set_property PACKAGE_PIN C17 [get_ports dataout_p[1]]
#set_property PACKAGE_PIN B17 [get_ports dataout_n[1]]

##la25, lane 2
#set_property PACKAGE_PIN G17 [get_ports dataout_p[2]]
#set_property PACKAGE_PIN F17 [get_ports dataout_n[2]]

##la22, lane 3
#set_property PACKAGE_PIN C20 [get_ports dataout_p[3]]
#set_property PACKAGE_PIN B20 [get_ports dataout_n[3]]

##la02, lane 0
#set_property PACKAGE_PIN H24    [get_ports dataout_p[0]]
#set_property PACKAGE_PIN H25    [get_ports dataout_n[0]]

##la08, lane 1
#set_property PACKAGE_PIN E29 [get_ports dataout_p[1]]
#set_property PACKAGE_PIN E30 [get_ports dataout_n[1]]

##la03, lane 2
#set_property PACKAGE_PIN H26 [get_ports dataout_p[2]]
#set_property PACKAGE_PIN H27 [get_ports dataout_n[2]]

##la00, lane 3
#set_property PACKAGE_PIN C25 [get_ports dataout_p[3]]
#set_property PACKAGE_PIN B25 [get_ports dataout_n[3]]

#la13_p
#la13_n
set_property PACKAGE_PIN A25 [get_ports {sda_o}]
set_property PACKAGE_PIN A26 [get_ports {scl_o}]

#la05_p
#la05_n
set_property PACKAGE_PIN G29 [get_ports {latch_o}]
set_property PACKAGE_PIN F30 [get_ports {sdi_i}]

set_property IOSTANDARD LVCMOS25 [get_ports {scl_o}]
set_property IOSTANDARD LVCMOS25 [get_ports {sda_o}]
set_property IOSTANDARD LVCMOS25 [get_ports {latch_o}]
set_property IOSTANDARD LVCMOS25 [get_ports {sdi_i}]

set_property PACKAGE_PIN AB8 [get_ports led0_o]
set_property IOSTANDARD LVCMOS15 [get_ports led0_o]
set_property PACKAGE_PIN AA8 [get_ports led1_o]
set_property IOSTANDARD LVCMOS15 [get_ports led1_o]
set_property PACKAGE_PIN AC9 [get_ports led2_o]
set_property IOSTANDARD LVCMOS15 [get_ports led2_o]
set_property PACKAGE_PIN AB9 [get_ports led3_o]
set_property IOSTANDARD LVCMOS15 [get_ports led3_o]
set_property PACKAGE_PIN AE26 [get_ports led4_o]
set_property IOSTANDARD LVCMOS25 [get_ports led4_o]
set_property PACKAGE_PIN G19 [get_ports led5_o]
set_property IOSTANDARD LVCMOS25 [get_ports led5_o]
set_property PACKAGE_PIN E18 [get_ports led6_o]
set_property IOSTANDARD LVCMOS25 [get_ports led6_o]
set_property PACKAGE_PIN F16 [get_ports led7_o]
set_property IOSTANDARD LVCMOS25 [get_ports led7_o]

set_property IOSTANDARD LVDS_25 [get_ports data*]
set_property DIFF_TERM TRUE [get_ports data*]
set_property IBUF_LOW_PWR FALSE [get_ports datain*]


