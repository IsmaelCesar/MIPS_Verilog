library verilog;
use verilog.vl_types.all;
entity DMEM is
    generic(
        SIZE            : integer := 3
    );
    port(
        clk             : in     vl_logic;
        write_data      : in     vl_logic_vector(31 downto 0);
        read_data       : out    vl_logic_vector(31 downto 0);
        write           : in     vl_logic;
        read            : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end DMEM;
