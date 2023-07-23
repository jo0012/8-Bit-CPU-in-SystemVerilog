// Top level module
module Top_level(inputSignal, rstn, clk, ySegHund, ySegTen, ySegOne, CF, ZF);
//(inputSignal,clk, key0, opcode, ySegHund, ySegTen, ySegOne);
	input logic [7:0] inputSignal; // 8 - bits of input
	input logic clk;
	input logic rstn;
	
	//output logic
	output logic [6:0] ySegHund, ySegTen, ySegOne;
	output logic CF, ZF;
	
	// input logics related to PCnMUX
	logic PC_sel_PCnMUX;
	logic [7:0] cBusData_PCnMUX;
	
	// output logic for PCnMUX
	logic [7:0] addr_PC_PCnMUX;
	
	// input logics for ROM
	logic [7:0] addr_ROM_ROM;
	assign addr_ROM_ROM = addr_PC_PCnMUX; // PCnMUX(out) -> ROM (in)
	
	// output logics for ROM
	logic [7:0] opcode;
	
	// logics related to Control unit
	logic [2:0] f_CU;
	logic [1:0] B_sel_CU;
	logic write_a, write_b, write_o;
	logic write_cz, PC_sel, write_pc;
	
	
	// logics related to B_MUX
	logic [1:0] B_sel_MUX;
	logic [7:0] bRegOut_MUX;
	logic [7:0] bBus_MUX;
	
	// input logics to provide inner connections for ALU
	logic [3:0] bit_extended;
	assign bit_extended = opcode [3:0]; // ROM(out) -> bit extend
	
	// output logics for ALU
	logic [7:0] aBusInput_ALU;
	logic [7:0] bBusInput_ALU;
	logic [8:0] cBusOutput_ALU;
	logic [2:0] f_ALU;
	
	
	// logics to provide inner connections for Register A and B
	logic [7:0] aInput_Reg;
	logic [7:0] bInput_Reg;
	logic [7:0] aOutput_Reg;
	logic [7:0] bOutput_Reg;
	
	// logics to provide inner connections for Register Y
	logic [8:0] yRegIn;
	logic [8:0] yRegOut;
	
	// logic to provide inner connection between Register Y and BCD
	logic [8:0] yBcdIn;
	
	// Relate two inner connections
	
	assign f_ALU = f_CU;
	assign B_sel_MUX = B_sel_CU;

	assign aBusInput_ALU = aOutput_Reg; // Connect logic aBusALU to logic aBus for instance
	assign bBusInput_ALU = bBus_MUX;
	assign bRegOut_MUX = bOutput_Reg;
	
	assign aInput_Reg = cBusOutput_ALU;
	assign bInput_Reg = cBusOutput_ALU;
	
	assign yRegIn = cBusOutput_ALU;
	assign yBcdIn = yRegOut;
	assign PC_sel_PCnMUX = PC_sel;
	
	PCnMUX PCxMUX1 (.PC_sel(PC_sel_PCnMUX), .clk_pc(clk), .rstn_pc(rstn), .write_pc(write_pc), 
							.cBusData(cBusOutput_ALU), .addr_PC(addr_PC_PCnMUX));
							
	ROM ROM1 (.addr_ROM(addr_ROM_ROM), .clk_ROM(clk), .rstn_ROM(rstn), .data_out_ROM(opcode));
	
	ControlUnit CU1 (.opcode(opcode), .f_CU(f_CU), .B_sel_CU(B_sel_CU), 
							.write_a_CU(write_a), .write_b_CU(write_b), .write_o_CU(write_o), 
								.write_cz_CU(write_cz), .PC_sel_CU(PC_sel), .write_pc_CU(write_pc));
	
	bMux bMux1 (.B_selMUX(B_sel_MUX), .bData(bRegOut_MUX), .bit_extend(bit_extended), .inSwitch(inputSignal), .bBusMUX(bBus_MUX));
	
	Reg_8bit aReg (.RegIn(aInput_Reg), .clk(clk), .write_Reg(write_a), .rstn(rstn), .RegOut(aOutput_Reg));
	Reg_8bit bReg (.RegIn(bInput_Reg), .clk(clk), .write_Reg(write_b), .rstn(rstn), .RegOut(bOutput_Reg));
	
	
	ALU ALU1 (.aBusInput_ALU(aBusInput_ALU), .bBusInput_ALU(bBusInput_ALU), 
					.clk_ALU(clk), .f(f_ALU), .write_cz(write_cz), .cBus(cBusOutput_ALU), .CF_ALU_out(CF), .ZF_ALU_out(ZF));
	
	Reg_8bit yReg (.RegIn(yRegIn), .clk(clk), .rstn(rstn), .write_Reg(write_o), .RegOut(yRegOut));	
	yBCD yBCD1 (.yBcdIn(yBcdIn), .yBcdOutHund(ySegHund), .yBcdOutTen(ySegTen), .yBcdOutOne(ySegOne));

endmodule
