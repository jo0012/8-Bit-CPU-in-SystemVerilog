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
			4'b0000: yBcdOutHund = 7'b0000001;
			4'b0001: yBcdOutHund = 7'b1001111;
			4'b0010: yBcdOutHund = 7'b0010010;
			4'b0011: yBcdOutHund = 7'b0000110;
			4'b0100: yBcdOutHund = 7'b1001100;
			4'b0101: yBcdOutHund = 7'b0100100;
			4'b0110: yBcdOutHund = 7'b0100000;
			4'b0111: yBcdOutHund = 7'b0001111;
			4'b1000: yBcdOutHund = 7'b0000000;
			4'b1001: yBcdOutHund = 7'b0000100;
			default yBcdOutHund = 7'bx;
		endcase
	end

// Ten digit output
always @ (tenDigit)
	begin
		case (tenDigit)
			4'b0000: yBcdOutTen = 7'b0000001;
			4'b0001: yBcdOutTen = 7'b1001111;
			4'b0010: yBcdOutTen = 7'b0010010;
			4'b0011: yBcdOutTen = 7'b0000110;
			4'b0100: yBcdOutTen = 7'b1001100;
			4'b0101: yBcdOutTen = 7'b0100100;
			4'b0110: yBcdOutTen = 7'b0100000;
			4'b0111: yBcdOutTen = 7'b0001111;
			4'b1000: yBcdOutTen = 7'b0000000;
			4'b1001: yBcdOutTen = 7'b0000100;		
			default yBcdOutTen = 7'bx;
		endcase
	end

// One digit output
always @ (oneDigit)
	begin
		case (oneDigit)
			4'b0000: yBcdOutOne = 7'b0000001;
			4'b0001: yBcdOutOne = 7'b1001111;
			4'b0010: yBcdOutOne = 7'b0010010;
			4'b0011: yBcdOutOne = 7'b0000110;
			4'b0100: yBcdOutOne = 7'b1001100;
			4'b0101: yBcdOutOne = 7'b0100100;
			4'b0110: yBcdOutOne = 7'b0100000;
			4'b0111: yBcdOutOne = 7'b0001111;
			4'b1000: yBcdOutOne = 7'b0000000;
			4'b1001: yBcdOutOne = 7'b0000100;
			default yBcdOutOne = 7'bx;			
		endcase
	end
	
endmodule