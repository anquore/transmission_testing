`timescale 1ns / 1ps

module RXandTX_tb();
  logic rst_i, clkp_i, clkn_i, datain_n, datain_p, dataout_n, dataout_p;
  logic led0_o, led1_o, led2_o, led3_o, led4_o, led5_o, led6_o, led7_o;
  logic sda_o, scl_o, latch_o, sdi_i;
logic rsta_o, rstb_o;
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
    ,.rsta_o
    ,.rstb_o             
  );
  
  logic [31:0] count1; 
  always_ff @(posedge clkp_i) begin
    if (rst_i) begin
      count1 <= 0;
    end else if (count1 < 1000) begin
      count1 <= count1 + 1;
    end else begin
      count1 <= count1;
    end
  end




  logic [23:0] sreg, sreg1;
  always_ff @(posedge scl_o) begin
    if(count1 < 1000) begin
      sreg <= 0;
    end else begin
      sreg[23:1] <= sreg[22:0];
      sreg[0] <= sda_o;
    end
  end

  always_ff @(posedge latch_o) begin
      sreg1<= sreg;
  end
  
  assign sdi_i = sreg[23];



assign datain_n = dataout_n;
assign datain_p = dataout_p;

//assign emptyTT = rst;

// Set up the clock
parameter ClockDelay = 5.0;

initial begin
    clkp_i <= 0;
    forever #(ClockDelay/2) clkp_i <= ~clkp_i;
end
initial begin
    clkn_i <= 1;
    forever #(ClockDelay/2) clkn_i <= ~clkn_i;
end



initial begin 
  rst_i <= 1'b1;
  @(posedge clkp_i);
  @(posedge clkp_i);
  rst_i <= 1'b0;	
  @(posedge clkp_i);
  repeat(500000) begin               
      @(posedge clkp_i); 
  end
    $stop(); // end the simulation
end
	
endmodule
