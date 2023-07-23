
`timescale 1ns/1ps
module ROM_tb;
//	parameter CLK_HALF_PERIOD = 10;
	logic in_clk;  
	logic in_rstn; 
	// 8 - bits of input
	logic [7:0] addr_ROM;
	logic [7:0] data_out_ROM;
	
	ROM DUT (.addr_ROM(addr_ROM), 
	           .clk_ROM(in_clk), 
	             .rstn_ROM(in_rstn), 
	               .data_out_ROM(data_out_ROM));
	
	
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
	     in_rstn = 1'b0;
	  #20
	  
	     in_rstn = 1'b1;
	     addr_ROM = 8'd0;
	  #20

	     addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	  #20
	  
	  	  addr_ROM = addr_ROM + 1'd1;
	end
	
endmodule
