`timescale 1ns/1ps
module ControlUnit_tb;

//	parameter CLK_HALF_PERIOD = 10;
	logic [7:0] opcodeData;
	logic in_clk;
	logic [2:0] f_CU;
	logic [1:0] B_sel_CU;
	logic write_a_CU;
	logic write_b_CU;
	logic write_o_CU;
	logic write_cz_CU;
	logic PC_sel_CU;
	logic write_pc_CU;
	
	ControlUnit DUT (.opcode(opcodeData), .f_CU(f_CU), .B_sel_CU(B_sel_CU), 
							.write_a_CU(write_a_CU), .write_b_CU(write_b_CU), .write_o_CU(write_o_CU), 
								.write_cz_CU(write_cz_CU), .PC_sel_CU(PC_sel_CU), .write_pc_CU(write_pc_CU));


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
		// NOP
			// f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
			// write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b0;
		opcodeData = 8'b00000000;
		#40
		
		
		// aOutputData_ALU = (Operand value = 1);
			// f_CU = 3'b000; B_sel_CU = 2'b01; 
			// write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b01000001;
		#40
		
		
		// aOutputData_ALU = inputSignal;
			// f_CU = 3'b000; B_sel_CU = 2'b11; 
			// write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1
		opcodeData = 8'b01010000;
		#40
		
		
		// y = aInputData_ALU;
			// f_CU = 3'b000; B_sel_CU = 2'bxx; 
			// write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b1;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b01010001;
		#40
		
		
		// bOutputData_ALU = aOutputData_ALU;
			// f_CU = 3'b001; B_sel_CU = 2'bxx; 
			// write_a_CU = 1'b0; write_b_CU = 1'b1; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b01100000;
		#40
		
		// aReg = aReg + 1;
			// f_CU = 3'b010; B_sel_CU = 2'bxx; 
			// write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b10000000;
		#40
		
		// bReg = bReg + 1;
			// f_CU = 3'b011; B_sel_CU = 2'b00; 
			// write_a_CU = 1'b0; write_b_CU = 1'b1; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b10010000;
		#40
		
		// aReg = aReg + bReg;
			// f_CU = 3'b100; B_sel_CU = 2'b00; 
			// write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b10100000;
		#40
		
		// aReg = aReg - bReg;
			// f_CU = 3'b101; B_sel_CU = 2'b00; 
			// write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b10110000;
		#40
		
		// aReg = aReg & bReg;
			// f_CU = 3'b110; B_sel_CU = 2'b00; 
			// write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b11000000;
		#40
		
		// aReg = aReg | bReg;
			// f_CU = 3'b111; B_sel_CU = 2'b00; 
			// write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
			// write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
		opcodeData = 8'b11010000;

						
	end
	
endmodule
