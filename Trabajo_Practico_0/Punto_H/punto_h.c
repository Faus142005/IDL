// Standard

#include <stdio.h>
#include <stdint.h>

// Propios

#include "../Funciones/funciones.h"

int main()
{

    char num_m[LONGITUD_16 + 1] = {0};
    int16_t numero_m;
    ingresarPendiente(num_m);
    char codigoResultado_m = strAPuntoFijo_16_M(&numero_m, num_m);

    if (codigoResultado_m)
    {
        printf("Mal ingreso de m\n");
        return codigoResultado_m;
    }

    char num_b[LONGITUD_16 + 1] = {0};
    int16_t numero_b;
    ingresarNumeroDecimal_16(num_b);
    char codigoResultado_b = strAPuntoFijo_16(&numero_b, num_b);

    if (codigoResultado_b)
    {
        printf("Mal ingreso de b\n");
        return codigoResultado_b;
    }

    char num_x[LONGITUD_32 + 1] = {0};
    int32_t numero_x;
    ingresarNumeroDecimal_32(num_x);
    char codigoResultado_x = strAPuntoFijo_32(&numero_x, num_x, 1);

    if (codigoResultado_x)
    {
        printf("Mal ingreso de x\n");
        return codigoResultado_x;
    }

    printf("m en hexadecimal: ");
    printf("%04hx\n", numero_m);

    printf("b en hexadecimal: ");
    printf("%04hx\n", numero_b);

    printf("x en hexadecimal: ");
    printf("%04hx\n", numero_x);

    int32_t y;
    calcularOrdenada(&y, numero_m, numero_b, numero_x);
    imprimirOrdenada(y);
    return 0;
}