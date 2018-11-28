-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
-- Date        : Tue Aug 14 14:30:53 2018
-- Host        : localhost.localdomain running 64-bit CentOS Linux release 7.5.1804 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/dsmith/Desktop/transmission_test/project_1/project_1.srcs/sources_1/ip/clk_gen_1/clk_gen_1_stub.vhdl
-- Design      : clk_gen_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_gen_1 is
  Port ( 
    clk200_i : in STD_LOGIC;
    clkhigh_o : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );

end clk_gen_1;

architecture stub of clk_gen_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk200_i,clkhigh_o,reset,locked";
begin
end;
