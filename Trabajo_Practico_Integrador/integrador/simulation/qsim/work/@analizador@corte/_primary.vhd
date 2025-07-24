library verilog;
use verilog.vl_types.all;
entity AnalizadorCorte is
    port(
        Error           : out    vl_logic;
        Q0              : out    vl_logic;
        Reset           : in     vl_logic;
        CLK             : in     vl_logic;
        Restar          : in     vl_logic;
        Menor           : in     vl_logic;
        Mayor           : in     vl_logic;
        Fin             : out    vl_logic;
        INTERMEDIO      : out    vl_logic
    );
end AnalizadorCorte;
