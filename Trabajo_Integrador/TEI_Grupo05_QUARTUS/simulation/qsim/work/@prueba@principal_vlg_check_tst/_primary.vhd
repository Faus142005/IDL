library verilog;
use verilog.vl_types.all;
entity PruebaPrincipal_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        DATA            : in     vl_logic_vector(11 downto 0);
        ERROR           : in     vl_logic;
        FIN             : in     vl_logic;
        PAUSA           : in     vl_logic;
        XNORR           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end PruebaPrincipal_vlg_check_tst;
