library verilog;
use verilog.vl_types.all;
entity MUX21 is
    generic(
        DATA_WIDTH      : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        O               : out    vl_logic_vector;
        S               : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end MUX21;
