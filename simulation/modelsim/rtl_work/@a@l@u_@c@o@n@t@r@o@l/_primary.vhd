library verilog;
use verilog.vl_types.all;
entity ALU_CONTROL is
    port(
        funct           : in     vl_logic_vector(5 downto 0);
        op              : in     vl_logic_vector(5 downto 0);
        control         : out    vl_logic_vector(3 downto 0)
    );
end ALU_CONTROL;
