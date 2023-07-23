module ControlUnit (opcode, f_CU, B_sel_CU, 
							write_a_CU, write_b_CU, write_o_CU, 
								write_cz_CU, PC_sel_CU, write_pc_CU);
	// Input
	input logic [7:0] opcode;
	
	logic [3:0] upperCode;
	logic [3:0] bitExtend;
	
	assign upperCode = opcode [7:4];
	assign bitExtend = opcode [3:0];
	
	// Output
	output logic [2:0] f_CU;
	output logic [1:0] B_sel_CU;
	output logic write_a_CU;
	output logic write_b_CU;
	output logic write_o_CU;
	output logic write_cz_CU;
	output logic PC_sel_CU;
	output logic write_pc_CU;
						
	
	always_comb
		begin
		case (upperCode)
			4'b0000: // No operation
				begin
					if (bitExtend == 4'b0000)
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					else
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
				end
			
			// Additional opcode (JMP) to vary the value in PC			
			4'b0001: // Jump to specified address
				begin
					f_CU = 3'b001; B_sel_CU = 2'b01;
					write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
					write_cz_CU = 1'b1; PC_sel_CU = 1'b1; write_pc_CU = 1'b1;
				end
			
			4'b0100: // Save the value of operand into register A
				begin
					f_CU = 3'b001; B_sel_CU = 2'b01; 
					write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
					write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
				end		
				
			4'b0101: 
				begin
					// Load Input into register A
					if (bitExtend == 4'b0000)
						begin
							f_CU = 3'b001; B_sel_CU = 2'b11;
							write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					// Move A register to Output register
					else if (bitExtend == 4'b0001)
						begin
							f_CU = 3'b000; B_sel_CU = 2'bxx;
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b1;
							write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					else
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end					
				end
				
				
			4'b0110: // Move register A into register B
				begin
					if (bitExtend == 4'b0000)
						begin
							f_CU = 3'b000; B_sel_CU = 2'bxx;
							write_a_CU = 1'b0; write_b_CU = 1'b1; write_o_CU = 1'b0;
							write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					else
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
				end
				
			4'b1010: // A = A + B
				begin
					if (bitExtend == 4'b0000)
						begin
							f_CU = 3'b100; B_sel_CU = 2'b00;
							write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					else
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
				end
				
			4'b1011: // A = A - B
				begin
					if (bitExtend == 4'b0000)
						begin
							f_CU = 3'b101; B_sel_CU = 2'b00;
							write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					else
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
				end
				
			4'b1100: // A = A & B
				begin
					if (bitExtend == 4'b0000)
						begin
							f_CU = 3'b110; B_sel_CU = 2'b00;
							write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					else
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
				end
				
			4'b1101: // A = A | B
				begin
					if (bitExtend == 4'b0000)
						begin
							f_CU = 3'b111; B_sel_CU = 2'b00;
							write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end
						
					else
						begin
							f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
							write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
							write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
						end		
				end
				
			default
				begin
					f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
					write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
					write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
				end
			/*
				8'b00000000: // No operation
					begin
						f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
						write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				8'b01000001: // aOutputData_ALU = (Operand value = 1);
					begin
						f_CU = 3'b000; B_sel_CU = 2'b01; 
						write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
						
				8'b01010000: // Load Input into register A
					begin
						f_CU = 3'b001; B_sel_CU = 2'b11; 
						write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end	
					
				8'b01010001: // y = aInputData_ALU;
					begin
						f_CU = 3'b000; B_sel_CU = 2'bxx; 
						write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b1;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
						
				8'b01100000: // bOutputData_ALU = aOutputData_ALU;
					begin
						f_CU = 3'b001; B_sel_CU = 2'bxx; 
						write_a_CU = 1'b0; write_b_CU = 1'b1; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				8'b10000000: // aOutputData_ALU = aInputData_ALU + 1;
					begin
						f_CU = 3'b010; B_sel_CU = 2'bxx; 
						write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				8'b10010000: // bOutputData_ALU = bInputData_ALU + 1;
					begin
						f_CU = 3'b011; B_sel_CU = 2'b00; 
						write_a_CU = 1'b0; write_b_CU = 1'b1; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				8'b10100000: // aOutputData_ALU = aInputData_ALU + bInputData_ALU;
					begin
						f_CU = 3'b100; B_sel_CU = 2'b00; 
						write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				8'b10110000: // aOutputData_ALU = aInputData_ALU - bInputData_ALU;
					begin
						f_CU = 3'b101; B_sel_CU = 2'b00; 
						write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				8'b11000000: // aOutputData_ALU = aInputData_ALU & bInputData_ALU;
					begin
						f_CU = 3'b110; B_sel_CU = 2'b00; 
						write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				8'b11010000: // aOutputData_ALU = aInputData_ALU | bInputData_ALU;
					begin
						f_CU = 3'b111; B_sel_CU = 2'b00; 
						write_a_CU = 1'b1; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b1; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					
				default
					begin
						f_CU = 3'bxxx; B_sel_CU = 2'bxx; 
						write_a_CU = 1'b0; write_b_CU = 1'b0; write_o_CU = 1'b0;
						write_cz_CU = 1'b0; PC_sel_CU = 1'b0; write_pc_CU = 1'b1;
					end
					*/
			endcase
		end
	
endmodule

