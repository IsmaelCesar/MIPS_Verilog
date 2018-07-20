library verilog;
use verilog.vl_types.all;
entity REGISTER_BANK is
    port(
        clk             : in     vl_logic;
        write           : in     vl_logic;
        write_data      : in     vl_logic_vector(31 downto 0);
        write_address   : in     vl_logic_vector(4 downto 0);
        read_address_1  : in     vl_logic_vector(4 downto 0);
        read_address_2  : in     vl_logic_vector(4 downto 0);
        read_data_1     : out    vl_logic_vector(31 downto 0);
        read_data_2     : out    vl_logic_vector(31 downto 0)
    );
end REGISTER_BANK;
