module ROM(addr_ROM, clk_ROM, rstn_ROM, data_out_ROM);

	input clk_ROM, rstn_ROM;
	input logic [7:0] addr_ROM;
	output logic [7:0] data_out_ROM;
	
	reg [7:0] data_ROM [0:255];

	initial $readmemh("rom_data", data_ROM);

	always_ff @ (posedge clk_ROM) // , negedge rstn_ROM
		if (!rstn_ROM)
			data_out_ROM <= 7'b0;
		else
			data_out_ROM <= data_ROM [addr_ROM];
		
endmodule
