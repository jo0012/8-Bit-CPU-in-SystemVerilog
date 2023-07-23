library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        opcode          : in     vl_logic_vector(7 downto 0);
        f_CU            : out    vl_logic_vector(2 downto 0);
        B_sel_CU        : out    vl_logic_vector(1 downto 0);
        write_a_CU      : out    vl_logic;
        write_b_CU      : out    vl_logic;
        write_o_CU      : out    vl_logic;
        write_cz_CU     : out    vl_logic;
        PC_sel_CU       : out    vl_logic;
        write_pc_CU     : out    vl_logic
    );
end ControlUnit;
