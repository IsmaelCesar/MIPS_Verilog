library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        S               : out    vl_logic_vector(31 downto 0);
        OP              : in     vl_logic_vector(3 downto 0);
        Z               : out    vl_logic
    );
end ULA;
