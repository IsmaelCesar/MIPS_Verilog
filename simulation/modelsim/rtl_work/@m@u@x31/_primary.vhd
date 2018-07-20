library verilog;
use verilog.vl_types.all;
entity MUX31 is
    generic(
        DATA_WIDTH      : integer := 32;
        SIGNAL_WIDTH    : integer := 2
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        O               : out    vl_logic_vector;
        S               : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SIGNAL_WIDTH : constant is 1;
end MUX31;
