`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2018 02:55:10 PM
// Design Name: 
// Module Name: loopback_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module loopback_tb();
logic rst_i, clkp_i ,clkn_i;
logic [3:0] datain_p, datain_n, dataout_p , dataout_n;
logic led0_o;
 logic   led0_o    ;       
logic    led1_o     ;     
 logic   led2_o      ;     
 logic   led3_o       ;    
 logic   led4_o        ;   
 logic   led5_o         ;  
 logic   led6_o          ; 
 logic   led7_o           ;
 logic sda_o, scl_o, latch_o, sdi_i;

loopback128gbps dut(
    .rst_i            
    ,.clkp_i           
    ,.clkn_i           
    ,.datain_p        
    ,.datain_n         
    ,.dataout_p        
    ,.dataout_n       
    ,.led0_o           
    ,.led2_o           
    ,.led3_o           
    ,.led4_o           
    ,.led5_o          
    ,.led6_o          
    ,.led7_o
    ,.sda_o     
    ,.scl_o          
    ,.latch_o       
    ,.sdi_i             
  );
  
  logic [23:0] sreg;
  
  always_ff @(posedge scl_o) begin
    sreg[23:1] <= sreg[22:0];
    sreg[0] <= sda_o;
  end
  
  assign sdi_i = sreg[23];
  // Set up the clock
    parameter ClockDelay = 5;
  
    initial begin
        clkp_i <= 0;
        forever #(ClockDelay/2) clkp_i <= ~clkp_i;
    end

    assign clkn_i = ~clkp_i;
    assign datain_p[0] = dataout_p[0];
    assign datain_n[0] = dataout_n[0];
    
    assign datain_p[1] = dataout_p[1];
    assign datain_n[1] = dataout_n[1];
        
    assign datain_p[2] = dataout_p[2];
    assign datain_n[2] = dataout_n[2];
          
    assign datain_p[3] = dataout_p[3];
    assign datain_n[3] = dataout_n[3];
    
  initial begin

        rst_i <= 1'b1;    @(posedge clkp_i);
        @(posedge clkp_i);
        rst_i <= 1'b0; @(posedge clkp_i);
        
        
        repeat (19200) begin @(posedge clkp_i); end
        
        $stop(); // end the simulation
    end

endmodule
