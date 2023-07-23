library verilog;
use verilog.vl_types.all;
entity ROM is
    port(
        addr_ROM        : in     vl_logic_vector(7 downto 0);
        clk_ROM         : in     vl_logic;
        rstn_ROM        : in     vl_logic;
        data_out_ROM    : out    vl_logic_vector(7 downto 0)
    );
end ROM;
