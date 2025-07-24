library verilog;
use verilog.vl_types.all;
entity Registro12_vlg_check_tst is
    port(
        O               : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end Registro12_vlg_check_tst;
