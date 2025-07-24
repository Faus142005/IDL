library verilog;
use verilog.vl_types.all;
entity Registros_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        D0              : in     vl_logic;
        InputEnable     : in     vl_logic;
        OutputEnable    : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Registros_vlg_sample_tst;
