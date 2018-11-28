// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Tue Aug 14 14:30:53 2018
// Host        : localhost.localdomain running 64-bit CentOS Linux release 7.5.1804 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1_stub.v
// Design      : clk_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen_1(clk200_i, clkhigh_o, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk200_i,clkhigh_o,reset,locked" */;
  input clk200_i;
  output clkhigh_o;
  input reset;
  output locked;
endmodule
