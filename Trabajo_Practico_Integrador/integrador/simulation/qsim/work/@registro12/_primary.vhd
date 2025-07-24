library verilog;
use verilog.vl_types.all;
entity Registro12 is
    port(
        O               : out    vl_logic_vector(11 downto 0);
        Ie              : in     vl_logic;
        DATA            : in     vl_logic_vector(11 downto 0);
        CLK             : in     vl_logic;
        Oe              : in     vl_logic
    );
end Registro12;
