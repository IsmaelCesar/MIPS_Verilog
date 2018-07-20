library verilog;
use verilog.vl_types.all;
entity SHIFT_LEFT_2 is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        O               : out    vl_logic_vector(31 downto 0)
    );
end SHIFT_LEFT_2;
