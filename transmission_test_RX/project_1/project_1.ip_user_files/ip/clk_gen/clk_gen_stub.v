// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Wed Nov 28 11:20:29 2018
// Host        : dhcp196-189.ece.uw.edu running 64-bit CentOS Linux release 7.5.1804 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/dsmith/Desktop/transmission_test_split/project_1/project_1.srcs/sources_1/ip/clk_gen/clk_gen_stub.v
// Design      : clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen(clk200_i, clk_out1, clk_o, clk_out2, clk_out4, clk_out5, clkhigh_o, clkidelay_o, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk200_i,clk_out1,clk_o,clk_out2,clk_out4,clk_out5,clkhigh_o,clkidelay_o,reset,locked" */;
  input clk200_i;
  output clk_out1;
  output clk_o;
  output clk_out2;
  output clk_out4;
  output clk_out5;
  output clkhigh_o;
  output clkidelay_o;
  input reset;
  output locked;
endmodule
