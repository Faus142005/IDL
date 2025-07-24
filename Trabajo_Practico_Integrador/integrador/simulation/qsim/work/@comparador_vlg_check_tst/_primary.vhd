library verilog;
use verilog.vl_types.all;
entity Comparador_vlg_check_tst is
    port(
        Ig              : in     vl_logic;
        Ma              : in     vl_logic;
        Me              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Comparador_vlg_check_tst;
