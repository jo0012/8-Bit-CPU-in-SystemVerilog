library verilog;
use verilog.vl_types.all;
entity Reg is
    port(
        RegIn           : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        write_Reg       : in     vl_logic;
        rstn            : in     vl_logic;
        RegOut          : out    vl_logic_vector(7 downto 0)
    );
end Reg;
