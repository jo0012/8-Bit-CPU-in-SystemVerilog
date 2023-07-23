`timescale 1ns/1ps
module Top_level_tb;
//	parameter CLK_HALF_PERIOD = 10;
	logic in_clk, rstn;
	logic [7:0] inputSignalData; // 8 - bits of input
	logic [6:0] ySegHundData, ySegTenData, ySegOneData;
	logic CF, ZF;
	
	// inputSignal,clk, key0, opcode, ySegHund, ySegTen, ySegOne
	// 

	Top_level DUT 	(.inputSignal(inputSignalData), 
						.rstn(rstn), .clk(in_clk), 
							.ySegHund(ySegHundData), 
								.ySegTen(ySegTenData), 
									.ySegOne(ySegOneData), 
										.CF(CF), .ZF(ZF));
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
		inputSignalData = 8'b10101010;
		rstn = 1'b0;
		#15
		
		rstn = 1'b1;
		
	end
	
endmodule

