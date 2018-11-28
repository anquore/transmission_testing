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
logic rst_i, clkp_i ,clkn_i, datain_p, datain_n, dataout_p , dataout_n ,led0_o;
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
    assign datain_p = dataout_p;
    assign datain_n = dataout_n;
    
  initial begin

        rst_i <= 1'b1;    @(posedge clkp_i);
        @(posedge clkp_i);
        rst_i <= 1'b0; @(posedge clkp_i);
        
        
        repeat (19200) begin @(posedge clkp_i); end
        
        $stop(); // end the simulation
    end

endmodule
