library verilog;
use verilog.vl_types.all;
entity IMEM is
    generic(
        SIZE            : integer := 12;
        MEMORY_FILE     : string  := "memory.bin"
    );
    port(
        address         : in     vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of MEMORY_FILE : constant is 1;
end IMEM;
