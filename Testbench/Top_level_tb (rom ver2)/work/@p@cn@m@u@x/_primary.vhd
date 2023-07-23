library verilog;
use verilog.vl_types.all;
entity PCnMUX is
    port(
        PC_sel          : in     vl_logic;
        clk_pc          : in     vl_logic;
        rstn_pc         : in     vl_logic;
        write_pc        : in     vl_logic;
        cBusData        : in     vl_logic_vector(7 downto 0);
        addr_PC         : out    vl_logic_vector(7 downto 0)
    );
end PCnMUX;
