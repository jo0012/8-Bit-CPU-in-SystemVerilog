`timescale 1ns/1ps
module ALU_tb;
//	parameter CLK_HALF_PERIOD = 10;
	logic in_clk, rstn_ALU, write_cz;  
	// 8 - bits of input
	logic [7:0] aBusIn, bBusIn;
	logic [2:0] fData;
	logic [7:0] cBusOut;
	logic CF_ALU, ZF_ALU;
	ALU DUT (.aBusInput_ALU(aBusIn), .bBusInput_ALU(bBusIn), .clk_ALU(in_clk), .write_cz(write_cz),
					.f(fData), .cBus(cBusOut), .CF_ALU_out(CF_ALU), .ZF_ALU_out(ZF_ALU));

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
		rstn_ALU = 1'b0;
		#20
		// NOP;
		rstn_ALU = 1'b1;
		write_cz = 1'b0;
		fData = 3'b000; aBusIn = 8'b11111111; bBusIn = 8'b00000010;
		#40
		
		// aReg = inputSignal;
		write_cz = 1'b1;
		fData = 3'b000; 
		#40
		
		// y = aReg;
		fData = 3'b000;
		#40
		
		// bReg = aReg;
		fData = 3'b001;
		#40
		
		// aReg = aReg + 1;
		fData = 3'b010;
		#40
		
		// bReg = bReg + 1;
		fData = 3'b011;
		#40
		
		// aReg = aReg + bReg;
		fData = 3'b100;
		#40
		
		// aReg = aReg - bReg;
		fData = 3'b101;
		#40
		
		// aReg = aReg & bReg;
		fData = 3'b110;
		#40
		
		// aReg = aReg | bReg;
		fData = 3'b111;
		#40
		
		// aReg = aReg - bReg;
		fData = 3'b101;
		aBusIn = 8'b00000001;
		bBusIn = 8'b00000010;
		#40
		
		// aReg = inputSignal;
		bBusIn = 8'b00000000;
		fData = 3'b000;
		
	end
	
endmodule