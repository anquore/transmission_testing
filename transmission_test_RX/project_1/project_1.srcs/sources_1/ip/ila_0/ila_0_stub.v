// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Fri Aug 10 13:28:37 2018
// Host        : dhcp196-189.ee.washington.edu running 64-bit CentOS Linux release 7.5.1804 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2016.2" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[65:0],probe1[65:0],probe2[31:0],probe3[31:0],probe4[7:0],probe5[7:0],probe6[0:0],probe7[0:0]" */;
  input clk;
  input [65:0]probe0;
  input [65:0]probe1;
  input [31:0]probe2;
  input [31:0]probe3;
  input [7:0]probe4;
  input [7:0]probe5;
  input [0:0]probe6;
  input [0:0]probe7;
endmodule
