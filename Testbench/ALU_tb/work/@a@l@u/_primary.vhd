library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        aBusInput_ALU   : in     vl_logic_vector(7 downto 0);
        bBusInput_ALU   : in     vl_logic_vector(7 downto 0);
        clk_ALU         : in     vl_logic;
        f               : in     vl_logic_vector(2 downto 0);
        write_cz        : in     vl_logic;
        rstn_ALU        : in     vl_logic;
        cBus            : out    vl_logic_vector(7 downto 0);
        CF_ALU_out      : out    vl_logic;
        ZF_ALU_out      : out    vl_logic
    );
end ALU;
