
`timescale 1ns/1ps
module bMux_tb;
	logic in_clk; 
	logic [1:0] B_selMUX;
	logic [3:0] bit_extend;
	logic [7:0] bData, inSwitch;
	logic [7:0] bBusMUX;
	
	bMux DUT (.B_selMUX(B_selMUX), 
				.bData(bData), .bit_extend(bit_extend), 
				.inSwitch(inSwitch), .bBusMUX(bBusMUX));

	
	
// clock generation using INITIAL
	initial 
		begin
		  in_clk = 1'b0;
	    forever #10 in_clk = ~in_clk;  
    	 //forever #CLK_HALF_PERIOD in_clk = ~in_clk;
   	end
   	
   	
//Input stimulus
	initial 
	begin
	     bit_extend = 4'b1111;
		 bData = 8'b10100000;
		 inSwitch = 8'b00000101;
		 B_selMUX = 2'b00;
	  #40
	  
		 B_selMUX = 2'b01;
	  #40
	  
		 B_selMUX = 2'b10;
	  #40
	  
		 B_selMUX = 2'b11;
	end
	
endmodule
