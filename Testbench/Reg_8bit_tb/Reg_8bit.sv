module Reg_8bit (RegIn, clk, write_Reg, rstn, RegOut);
	input logic [7:0] RegIn;
	input logic clk, rstn;
	input logic write_Reg;
	output logic [7:0] RegOut;
	
	always_ff @ (posedge clk)
	begin
		if (!rstn)
			RegOut <= 8'b0;
		else
			begin
				if (write_Reg)
					RegOut <= RegIn;
				else
					RegOut <= RegOut;
			end

	end
endmodule
