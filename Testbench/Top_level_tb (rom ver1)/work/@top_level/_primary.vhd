library verilog;
use verilog.vl_types.all;
entity Top_level is
    port(
        inputSignal     : in     vl_logic_vector(7 downto 0);
        rstn            : in     vl_logic;
        clk             : in     vl_logic;
        ySegHund        : out    vl_logic_vector(6 downto 0);
        ySegTen         : out    vl_logic_vector(6 downto 0);
        ySegOne         : out    vl_logic_vector(6 downto 0);
        CF              : out    vl_logic;
        ZF              : out    vl_logic
    );
end Top_level;
