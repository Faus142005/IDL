library verilog;
use verilog.vl_types.all;
entity Semaforo is
    port(
        V1              : out    vl_logic;
        VCC             : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        A1              : out    vl_logic;
        R1              : out    vl_logic;
        V2              : out    vl_logic;
        A2              : out    vl_logic;
        R2              : out    vl_logic;
        V3              : out    vl_logic;
        A3              : out    vl_logic;
        R3              : out    vl_logic
    );
end Semaforo;
