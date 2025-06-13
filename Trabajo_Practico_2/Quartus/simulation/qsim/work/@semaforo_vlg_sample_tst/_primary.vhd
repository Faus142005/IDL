library verilog;
use verilog.vl_types.all;
entity Semaforo_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        VCC             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Semaforo_vlg_sample_tst;
