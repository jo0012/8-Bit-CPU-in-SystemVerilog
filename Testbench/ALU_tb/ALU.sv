module ALU (aBusInput_ALU, bBusInput_ALU, clk_ALU, f, write_cz, rstn_ALU, cBus, CF_ALU_out, ZF_ALU_out);
	// 8 - bits of input
	input logic clk_ALU, rstn_ALU, write_cz;
	input logic [7:0] aBusInput_ALU;
	input logic [7:0] bBusInput_ALU;
	input [2:0] f; // 3-bits of input
	
	// Inner connection
	logic [8:0] output_ALU;
	logic CF_ALU_in, ZF_ALU_in;
	
	// Output
	output logic [7:0] cBus;
	output logic CF_ALU_out, ZF_ALU_out;
	
	
	// ALU
	always @ (aBusInput_ALU or bBusInput_ALU or f)
	begin
		case(f)
			3'b000: 
				begin
					output_ALU = aBusInput_ALU;	// b = a, y = a
					
				end
				
			3'b001: 
				begin
					output_ALU = bBusInput_ALU;	// NOP , a = inputSig
				end
				
			3'b010: 
				begin
					output_ALU = aBusInput_ALU + 1'b1;	// a++
				end
				
			3'b011:
				begin
					output_ALU = bBusInput_ALU + 1'b1;	// b++
				end
				
			3'b100: 
				begin
					output_ALU = aBusInput_ALU + bBusInput_ALU;	// a+b
				end
			
			3'b101: 
				begin
					output_ALU = aBusInput_ALU - bBusInput_ALU;	// a-b
				end
				
			3'b110: 
				begin
					output_ALU = aBusInput_ALU & bBusInput_ALU;	// a&b
				end
				
			3'b111: 
				begin
					output_ALU = aBusInput_ALU | bBusInput_ALU;	// a|b
				end
			
			default 
				begin
					output_ALU = 9'bx;
				end
		endcase
	end
	
	// Configure the outputs
	assign CF_ALU_in = output_ALU [8];
	assign ZF_ALU_in = !(output_ALU[7] | output_ALU[6] | output_ALU[5] | output_ALU[4] 
							| output_ALU[3] | output_ALU[2] | output_ALU[1] | output_ALU[0]);
	
	// Store the output signals
	Reg_1bit CF (.RegIn(CF_ALU_in), .clk(clk_ALU), .write_Reg(write_cz), .rstn(rstn_ALU), .RegOut(CF_ALU_out));
	Reg_1bit ZF (.RegIn(ZF_ALU_in), .clk(clk_ALU), .write_Reg(write_cz), .rstn(rstn_ALU), .RegOut(ZF_ALU_out));
	
	assign cBus [7:0] = output_ALU [7:0];
	
endmodule
