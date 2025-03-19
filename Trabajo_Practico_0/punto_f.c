// Standard

#include <stdio.h>
#include <stdint.h>

// Propios

#include "funciones.h"

int main()
{

    char entrada_num[LONGITUD_16 + 1] = {0};
    int16_t numero;

    ingresarNumeroDecimal(entrada_num);

    char codigoResultado = strAPuntoFijo16(&numero, entrada_num);

    if (codigoResultado)
    {
        printf("Codigo de error: %d\n", codigoResultado);
        return codigoResultado;
    }
    printf("Numero en hexadecimal: ");
    printf("%04hx\n", numero);
    return 0;
}