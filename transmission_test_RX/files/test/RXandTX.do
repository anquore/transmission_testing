vlib work

vcom -work work ../../project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_sim_netlist.vhdl 
vcom -work work ../../project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1_sim_netlist.vhdl
vcom -work work ../../project_1/project_1.srcs/sources_1/ip/clk_wiz_3/clk_wiz_3_sim_netlist.vhdl 
vcom -work work ../../project_1/project_1.srcs/sources_1/ip/ila_0/ila_0_sim_netlist.vhdl
vcom -work work ../../project_1/project_1.srcs/sources_1/ip/ila_1/ila_1_sim_netlist.vhdl

vcom -work work ../comparator.vhd
vcom -work work ../generator.vhd
vcom -work work ../loopback128gbps.vhd
vcom -work work ../aurora_rx_lane.vhd
vlog -work work ../descrambler.v
vcom -work work ../gearbox32to66.vhd
vcom -work work ../aurora_rx_lane.vhd
vcom -work work ../delay_controller_wrap.vhd
vcom -work work ../serdes_1_to_468_idelay_ddr.vhd
vcom -work work ../aurora_tx_lane128.vhd
vcom -work work ../gearbox66to32.vhd
vlog -work work ../scrambler.v
vcom -work work ../serdes8to1.vhd
vcom -work work ../serdes32to8.vhd

vlog -work work ./RXandTX_tb.sv

vsim -t 1ps -novopt work.RXandTX_tb -L unisim

view signals
view wave

do wave_RXandTX.do

run 10 ms
