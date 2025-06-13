library verilog;
use verilog.vl_types.all;
entity Semaforo_vlg_check_tst is
    port(
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        A3              : in     vl_logic;
        R1              : in     vl_logic;
        R2              : in     vl_logic;
        R3              : in     vl_logic;
        V1              : in     vl_logic;
        V2              : in     vl_logic;
        V3              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Semaforo_vlg_check_tst;
