library verilog;
use verilog.vl_types.all;
entity Comparador is
    port(
        Ig              : out    vl_logic;
        A               : in     vl_logic_vector(11 downto 0);
        B               : in     vl_logic_vector(11 downto 0);
        Ma              : out    vl_logic;
        Me              : out    vl_logic
    );
end Comparador;
