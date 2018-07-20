library verilog;
use verilog.vl_types.all;
entity \REGISTER\ is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        O               : out    vl_logic_vector(31 downto 0)
    );
end \REGISTER\;
