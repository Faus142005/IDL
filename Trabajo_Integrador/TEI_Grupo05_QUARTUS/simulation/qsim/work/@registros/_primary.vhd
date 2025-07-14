library verilog;
use verilog.vl_types.all;
entity Registros is
    port(
        Output          : out    vl_logic;
        CLK             : in     vl_logic;
        InputEnable     : in     vl_logic;
        D0              : in     vl_logic;
        OutputEnable    : in     vl_logic
    );
end Registros;
