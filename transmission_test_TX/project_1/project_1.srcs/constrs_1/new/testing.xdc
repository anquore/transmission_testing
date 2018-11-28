#Clocks
#SYSCLK
create_clock -period 5.000 -waveform {0.000 2.500} [get_ports clkp_i]
#set_property IOSTANDARD LVDS [get_ports clkn_i]
#set_property IOSTANDARD LVDS [get_ports clkp_i]
#set_property PACKAGE_PIN AD12 [get_ports clkp_i]
#set_property PACKAGE_PIN AD11 [get_ports clkn_i]


set_property PACKAGE_PIN K25 [get_ports clkn_i]
set_property IOSTANDARD LVDS_25 [get_ports clkn_i]
#set_property DIFF_TERM TRUE [get_ports clkn_i]
set_property PACKAGE_PIN L25 [get_ports clkp_i]
set_property IOSTANDARD LVDS_25 [get_ports clkp_i]
#set_property DIFF_TERM TRUE [get_ports clkp_i]

set_property PACKAGE_PIN G12 [get_ports rst_i] 
set_property IOSTANDARD LVCMOS25 [get_ports rst_i]

set_property PACKAGE_PIN AG5 [get_ports button] 
set_property IOSTANDARD LVCMOS15 [get_ports button]

##la27_p
##la27_n
#set_property PACKAGE_PIN B19 [get_ports rsta_o]

#set_property IOSTANDARD LVCMOS25 [get_ports rsta_o]


##la18
#set_property PACKAGE_PIN E21 [get_ports rstb_o]

#set_property IOSTANDARD LVCMOS25 [get_ports rstb_o]


#SMA MGT RX/TX
#set_property PACKAGE_PIN Y23 [get_ports dataout_p[0]]
#set_property PACKAGE_PIN Y24 [get_ports dataout_n[0]]


##la02_p
##la02_n
#set_property PACKAGE_PIN AF20 [get_ports {dataout_p[0]}]
#set_property PACKAGE_PIN AF21 [get_ports {dataout_n[0]}]
##la00_cc_p
##la00_cc_n
#set_property PACKAGE_PIN AD23 [get_ports {dataout_p[1]}]
#set_property PACKAGE_PIN AE24 [get_ports {dataout_n[1]}]
##la03_p
##la03_n
#set_property PACKAGE_PIN AG20 [get_ports {dataout_p[2]}]
#set_property PACKAGE_PIN AH20 [get_ports {dataout_n[2]}]

##la04_p
##la04_n
#set_property PACKAGE_PIN AH21 [get_ports {dataout_p[3]}]
#set_property PACKAGE_PIN AJ21 [get_ports {dataout_n[3]}]


#la31_p
#la31_n
set_property PACKAGE_PIN AD29 [get_ports {dataout_p[0]}]
set_property PACKAGE_PIN AE29 [get_ports {dataout_n[0]}]
#la29_cc_p
#la29_cc_n
set_property PACKAGE_PIN AE28 [get_ports {dataout_p[1]}]
set_property PACKAGE_PIN AF28 [get_ports {dataout_n[1]}]
#la32_p
#la32_n
set_property PACKAGE_PIN Y30 [get_ports {dataout_p[2]}]
set_property PACKAGE_PIN AA30 [get_ports {dataout_n[2]}]

#la33_p
#la33_n
set_property PACKAGE_PIN AC29 [get_ports {dataout_p[3]}]
set_property PACKAGE_PIN AC30 [get_ports {dataout_n[3]}]


#set_property PACKAGE_PIN H24   [get_ports datain_p[0]]
#set_property PACKAGE_PIN H25    [get_ports datain_n[0]]

#set_property PACKAGE_PIN K25 [get_ports datain_n[0]]
#set_property PACKAGE_PIN L25 [get_ports datain_p[0]]

#la31, lane 0
#set_property PACKAGE_PIN G22    [get_ports datain_p[0]]
#set_property PACKAGE_PIN F22    [get_ports datain_n[0]]

##la32, lane 1
#set_property PACKAGE_PIN D21 [get_ports datain_p[1]]
#set_property PACKAGE_PIN C21 [get_ports datain_n[1]]

##la30, lane 2
#set_property PACKAGE_PIN D22 [get_ports datain_p[2]]
#set_property PACKAGE_PIN C22 [get_ports datain_n[2]]

##la28, lane 3
#set_property PACKAGE_PIN D16 [get_ports datain_p[3]]
#set_property PACKAGE_PIN C16 [get_ports datain_n[3]]


##la21, lane 0
#set_property PACKAGE_PIN A20    [get_ports datain_p[0]]
#set_property PACKAGE_PIN A21    [get_ports datain_n[0]]

##la29, lane 1
#set_property PACKAGE_PIN C17 [get_ports datain_p[1]]
#set_property PACKAGE_PIN B17 [get_ports datain_n[1]]

##la25, lane 2
#set_property PACKAGE_PIN G17 [get_ports datain_p[2]]
#set_property PACKAGE_PIN F17 [get_ports datain_n[2]]

##la22, lane 3
#set_property PACKAGE_PIN C20 [get_ports datain_p[3]]
#set_property PACKAGE_PIN B20 [get_ports datain_n[3]]

##la13_p
##la13_n
#set_property PACKAGE_PIN A25 [get_ports {sda_o}]
#set_property PACKAGE_PIN A26 [get_ports {scl_o}]

##la05_p
##la05_n
#set_property PACKAGE_PIN G29 [get_ports {latch_o}]
#set_property PACKAGE_PIN F30 [get_ports {sdi_i}]


#set_property PACKAGE_PIN K25 [get_ports clkn_o]
#set_property IOSTANDARD LVDS_25 [get_ports clkn_o]
#set_property DIFF_TERM TRUE [get_ports clkn_o]

#set_property PACKAGE_PIN L25 [get_ports clkp_o]
#set_property IOSTANDARD LVDS_25 [get_ports clkp_o]
#set_property DIFF_TERM TRUE [get_ports clkp_o]

#set_property IOSTANDARD LVCMOS25 [get_ports {scl_o}]
#set_property IOSTANDARD LVCMOS25 [get_ports {sda_o}]
#set_property IOSTANDARD LVCMOS25 [get_ports {latch_o}]
#set_property IOSTANDARD LVCMOS25 [get_ports {sdi_i}]

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
#set_property SLEW FAST [get_ports data*]
#set_property IBUF_LOW_PWR FALSE [get_ports datain*]

#create_generated_clock -name clk_160_s [get_pins clk_gen/inst/mmcm_adv_inst/CLKOUT1]
## gen_clock_name is the name of forwarded clock here. It should be used below for defining "fwclk".	

#set fwclk       	clk_160_s;	# forwarded clock name (generated using create_generated_clock at output clock port)
#set fwclk_period 	6.25;	# forwarded clock period
#set bre_skew 		-0.050;			# skew requirement before rising edge
#set are_skew 		0.050;			# skew requirement after rising edge
#set output_ports 	fe_cmd_*;	# list of output ports

## Output Delay Constraints
#set_output_delay -clock $fwclk -max [expr $fwclk_period - $are_skew] [get_ports $output_ports];
#set_output_delay -clock $fwclk -min $bre_skew                        [get_ports $output_ports];


