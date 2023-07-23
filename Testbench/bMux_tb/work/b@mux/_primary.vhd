library verilog;
use verilog.vl_types.all;
entity bMux is
    port(
        B_selMUX        : in     vl_logic_vector(1 downto 0);
        bData           : in     vl_logic_vector(7 downto 0);
        bit_extend      : in     vl_logic_vector(3 downto 0);
        inSwitch        : in     vl_logic_vector(7 downto 0);
        bBusMUX         : out    vl_logic_vector(7 downto 0)
    );
end bMux;
