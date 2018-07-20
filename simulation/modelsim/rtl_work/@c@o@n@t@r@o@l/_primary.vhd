library verilog;
use verilog.vl_types.all;
entity CONTROL is
    port(
        nrst            : in     vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        branch          : out    vl_logic;
        read_mem        : out    vl_logic;
        write_mem       : out    vl_logic;
        write_reg       : out    vl_logic;
        mux_write_rt_rd : out    vl_logic_vector(1 downto 0);
        mux_alu_src_reg_imm: out    vl_logic;
        alu_op          : out    vl_logic_vector(5 downto 0);
        mux_branch_jump : out    vl_logic;
        mux_pc_branch   : out    vl_logic;
        mux_reg_src_alu_mem: out    vl_logic;
        mux_j_type_addr_to_write: out    vl_logic
    );
end CONTROL;
