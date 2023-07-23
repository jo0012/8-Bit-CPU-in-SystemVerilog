library verilog;
use verilog.vl_types.all;
entity Reg_1bit is
    port(
        RegIn           : in     vl_logic;
        clk             : in     vl_logic;
        write_Reg       : in     vl_logic;
        rstn            : in     vl_logic;
        RegOut          : out    vl_logic
    );
end Reg_1bit;
