library verilog;
use verilog.vl_types.all;
entity CMP_BRANCH is
    port(
        branch          : in     vl_logic;
        Z               : in     vl_logic;
        S               : out    vl_logic
    );
end CMP_BRANCH;
