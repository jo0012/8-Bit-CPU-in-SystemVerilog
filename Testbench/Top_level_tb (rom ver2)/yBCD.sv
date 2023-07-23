module yBCD (yBcdIn, yBcdOutHund, yBcdOutTen, yBcdOutOne);

// Input
input logic [7:0] yBcdIn;

// Logics to provide inner connection
logic [3:0] hundDigit;
logic [3:0] tenDigit;
logic [3:0] oneDigit;

// Output
output logic [6:0] yBcdOutHund;
output logic [6:0] yBcdOutTen;
output logic [6:0] yBcdOutOne;

// Inner connection assignments
// Split it out into three digits
assign hundDigit = yBcdIn / 100;
assign tenDigit = (yBcdIn % 100) / 10;
assign oneDigit = yBcdIn % 10;

// Hundread digit output
always @ (hundDigit)
	begin
		case (hundDigit)
			0: yBcdOutHund = 7'b1111110;
			1: yBcdOutHund = 7'b0110000;
			2: yBcdOutHund = 7'b1101101;
			3: yBcdOutHund = 7'b1111000;
			4: yBcdOutHund = 7'b0110011;
			5: yBcdOutHund = 7'b1011011;
			6: yBcdOutHund = 7'b1011111;
			7: yBcdOutHund = 7'b1110000;
			8: yBcdOutHund = 7'b1111111;
			9: yBcdOutHund = 7'b1111011;
			default yBcdOutHund = 7'bx;
		endcase
	end

// Ten digit output
always @ (tenDigit)
	begin
		case (tenDigit)
			0: yBcdOutTen = 7'b1111110;
			1: yBcdOutTen = 7'b0110000;
			2: yBcdOutTen = 7'b1101101;
			3: yBcdOutTen = 7'b1111000;
			4: yBcdOutTen = 7'b0110011;
			5: yBcdOutTen = 7'b1011011;
			6: yBcdOutTen = 7'b1011111;
			7: yBcdOutTen = 7'b1110000;
			8: yBcdOutTen = 7'b1111111;
			9: yBcdOutTen = 7'b1111011;		
			default yBcdOutTen = 7'bx;
		endcase
	end

// One digit output
always @ (oneDigit)
	begin
		case (oneDigit)
			0: yBcdOutOne = 7'b1111110;
			1: yBcdOutOne = 7'b0110000;
			2: yBcdOutOne = 7'b1101101;
			3: yBcdOutOne = 7'b1111000;
			4: yBcdOutOne = 7'b0110011;
			5: yBcdOutOne = 7'b1011011;
			6: yBcdOutOne = 7'b1011111;
			7: yBcdOutOne = 7'b1110000;
			8: yBcdOutOne = 7'b1111111;
			9: yBcdOutOne = 7'b1111011;		
			default yBcdOutOne = 7'bx;			
		endcase
	end
	
endmodule