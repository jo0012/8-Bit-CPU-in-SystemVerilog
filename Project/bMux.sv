module bMux (B_selMUX, bData, bit_extend, inSwitch, bBusMUX);
	input logic [1:0] B_selMUX;
	input logic [3:0] bit_extend;
	input logic [7:0] bData, inSwitch;

	output logic [7:0] bBusMUX;
	
	
	
	
	assign bBusMUX = (B_selMUX == 2'b00) ? bData :
						  (B_selMUX == 2'b01) ? bit_extend :
						  (B_selMUX == 2'b10) ? 8'bx : 
  						  (B_selMUX == 2'b11) ? inSwitch :
						  8'bx;
	
	/*
	always @(B_selMUX, bit_extend, bData, inSwitch)
		begin
			case (B_selMUX)
				2'b00: bBusMUX = bData;
				2'b01: bBusMUX = bit_extend;
				2'b10: bBusMUX = 8'bx;
				2'b11: bBusMUX = inSwitch;
				default bBusMUX = 8'bx;
			endcase
		end
	*/
endmodule
