library verilog;
use verilog.vl_types.all;
entity PruebaPrincipal_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        CONTINUAR       : in     vl_logic;
        DATA            : in     vl_logic_vector(11 downto 0);
        INC             : in     vl_logic_vector(2 downto 0);
        LOAD_F          : in     vl_logic;
        LOAD_I          : in     vl_logic;
        RECARGAR        : in     vl_logic;
        START           : in     vl_logic;
        UD              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PruebaPrincipal_vlg_sample_tst;
