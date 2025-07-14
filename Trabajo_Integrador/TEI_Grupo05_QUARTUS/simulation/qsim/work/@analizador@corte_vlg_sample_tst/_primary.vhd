library verilog;
use verilog.vl_types.all;
entity AnalizadorCorte_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        Mayor           : in     vl_logic;
        Menor           : in     vl_logic;
        Reset           : in     vl_logic;
        Restar          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end AnalizadorCorte_vlg_sample_tst;
