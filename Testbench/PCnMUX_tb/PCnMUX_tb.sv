
`timescale 1ns/1ps
module PCnMUX_tb;
//	parameter CLK_HALF_PERIOD = 10;


	// input logics
	logic in_clk;  
	logic in_rstn;
	logic write_pc;
	logic PC_sel;
	logic [7:0] cBusData;
	
	// output logics
	logic [7:0] addr_PC;
	
	PCnMUX DUT (.PC_sel(PC_sel), 
					.clk_pc(in_clk), 
						.rstn_pc(in_rstn), 
							.write_pc(write_pc), 
								.cBusData(cBusData), 
									.addr_PC(addr_PC));
	
// clock generation using INITIAL
	initial 
		begin
		  in_clk = 1'b0;
	    forever #10 in_clk = ~in_clk;  
    	 //forever #CLK_HALF_PERIOD in_clk = ~in_clk;
   	end
   	
   	
//Input stimulus
	initial 
	begin
			write_pc = 1'b1;
			PC_sel = 1'b0;
			in_rstn = 1'b0;
			cBusData = 8'd101;
		#20
			in_rstn = 1'b1;
		#225
	
			in_rstn = 1'b0;
		#20
		
			in_rstn = 1'b0;		
		#20
		
			PC_sel = 1'b1;
			
		#20
			in_rstn = 1'b1;		
	end
	
endmodule
