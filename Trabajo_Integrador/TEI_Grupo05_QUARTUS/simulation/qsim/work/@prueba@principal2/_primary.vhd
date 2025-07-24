library verilog;
use verilog.vl_types.all;
entity PruebaPrincipal2 is
    port(
        PAUSA           : out    vl_logic;
        INC             : in     vl_logic_vector(2 downto 0);
        FIN             : out    vl_logic;
        START           : in     vl_logic;
        UD              : in     vl_logic;
        DATA            : inout  vl_logic_vector(11 downto 0);
        RECARGAR        : in     vl_logic;
        LOAD_F          : in     vl_logic;
        CLK             : in     vl_logic;
        ERROR           : out    vl_logic;
        CONTINUAR       : in     vl_logic;
        LOAD_I          : in     vl_logic
    );
end PruebaPrincipal2;
