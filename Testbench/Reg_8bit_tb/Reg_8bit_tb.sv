
`timescale 1ns/1ps
module Reg_8bit_tb;
	logic [7:0] RegIn;
	logic in_clk;
	logic rstn;
	logic write_Reg;
	logic [7:0] RegOut;
	
	Reg_8bit DUT (.RegIn(RegIn), .clk(in_clk), .write_Reg(write_Reg),
				.rstn(rstn), .RegOut(RegOut));
	
// clock generation using INITIAL
	initial 
		begin
		  in_clk = 1'b0;
	    forever #10 in_clk = ~in_clk;  
    	 //forever #CLK_HALF_PERIOD in_clk = ~in_clk;
   	end
   	
	initial 
		begin
		  write_Reg = 1'b0;
	    forever #20 write_Reg = ~write_Reg;  
   	end
   	
//Input stimulus
	initial 
		begin
			rstn = 1'b1;
			#20
			
			rstn = 1'b0;
			#20
			
			rstn = 1'b1;
			RegIn = 8'b00000001;
			#20
			
			RegIn = 8'b00000010;
			#20
			
			RegIn = 8'b00000100;
			#20
			
			RegIn = 8'b00001000;
			#20
			
			RegIn = 8'b00010000;
			#20
						
			RegIn = 8'b00100000;
			#20
						
			RegIn = 8'b01000000;
			#20
			
			RegIn = 8'b10000000;
		end
	
endmodule
