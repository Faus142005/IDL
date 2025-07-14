library verilog;
use verilog.vl_types.all;
entity Registro12_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        DATA            : in     vl_logic_vector(11 downto 0);
        Ie              : in     vl_logic;
        Oe              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Registro12_vlg_sample_tst;
