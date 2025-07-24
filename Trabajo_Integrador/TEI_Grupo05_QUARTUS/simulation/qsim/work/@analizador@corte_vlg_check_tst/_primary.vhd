library verilog;
use verilog.vl_types.all;
entity AnalizadorCorte_vlg_check_tst is
    port(
        Error           : in     vl_logic;
        Fin             : in     vl_logic;
        INTERMEDIO      : in     vl_logic;
        Q0              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end AnalizadorCorte_vlg_check_tst;
