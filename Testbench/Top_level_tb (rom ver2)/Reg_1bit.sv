module Reg_1bit (RegIn, clk, write_Reg, rstn, RegOut);
	input logic RegIn;
	input logic clk, rstn;
	input logic write_Reg;
	output logic RegOut;
	
	always_ff @ (posedge clk)
	begin
		if (!rstn)
			RegOut <= 1'b0;
		else
			begin
				if (write_Reg)
					RegOut <= RegIn;
				else
					RegOut <= RegOut;
			end

	end
endmodule
