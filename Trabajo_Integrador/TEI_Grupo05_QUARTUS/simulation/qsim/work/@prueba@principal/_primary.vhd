library verilog;
use verilog.vl_types.all;
entity PruebaPrincipal is
    port(
        PAUSA           : out    vl_logic;
        INC             : in     vl_logic_vector(2 downto 0);
        FIN             : out    vl_logic;
        RECARGAR        : in     vl_logic;
        UD              : in     vl_logic;
        START           : in     vl_logic;
        CONTINUAR       : in     vl_logic;
        CLK             : in     vl_logic;
        LOAD_I          : in     vl_logic;
        DATA            : inout  vl_logic_vector(11 downto 0);
        LOAD_F          : in     vl_logic;
        ERROR           : out    vl_logic;
        Cout            : out    vl_logic;
        XNORR           : out    vl_logic
    );
end PruebaPrincipal;
