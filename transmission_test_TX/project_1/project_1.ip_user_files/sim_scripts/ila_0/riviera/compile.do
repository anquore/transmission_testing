vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib -v2k5 -sv "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/ila_v6_1_1/hdl/verilog" "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/ila_v6_1_1/hdl/verilog" "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../../project_1.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../project_1.srcs/sources_1/ip/ila_0/sim/ila_0.vhd" \

vlog -work xil_defaultlib "glbl.v"

