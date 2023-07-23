library verilog;
use verilog.vl_types.all;
entity yBCD is
    port(
        yBcdIn          : in     vl_logic_vector(7 downto 0);
        yBcdOutHund     : out    vl_logic_vector(6 downto 0);
        yBcdOutTen      : out    vl_logic_vector(6 downto 0);
        yBcdOutOne      : out    vl_logic_vector(6 downto 0)
    );
end yBCD;
