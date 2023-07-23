module PCnMUX (PC_sel, clk_pc, rstn_pc, write_pc, cBusData, addr_PC);
	// input and output for PCnMUX
	input logic PC_sel;
	input logic [7:0] cBusData;
	input logic write_pc;
	input logic clk_pc;
	input logic rstn_pc;
	output logic [7:0] addr_PC;
	
	
	// Inner input of a 2:1 MUX
	logic [7:0] Incremented_PC;
	
	// Inner output of a 2:1 MUX
	logic [7:0] MUX_out;
	
	
	// If PC_sel is true, the output of MUX shall be cBusData
	// If not, the output would be Incremented_PC
	assign MUX_out = (PC_sel == 0) ? Incremented_PC :
					 (PC_sel == 1) ? cBusData : Incremented_PC;

	
	// Load an instantiated register named PC
	Reg_8bit PC (.RegIn(MUX_out), 
				.clk(clk_pc), 
					.write_Reg(write_pc), 
						.rstn(rstn_pc), 
							.RegOut(addr_PC));
	
	assign Incremented_PC = addr_PC + 1'b1;
	
endmodule