// Standard

#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

// Propios

#include "Grupo05funciones.h"

int main()
{
    char entrada_num[LONGITUD_HEXA + 1] = {0};
    int16_t numero;

    int16_t resultado;

    if ((ingresarNumeroHexadecimal_16(entrada_num) || (validarNumeroHexadecimal_16(entrada_num))))
    {
        printf("Error al ingresar el número. \n");
        return 0;
    }
    printf("Número %s ingresado correctamente.\n", entrada_num);

    uint16_t nBinario = 0;
    hexadecimalABinario_16(entrada_num, &nBinario);

    char signo = '\0';
    uint16_t nEntero = 0;
    uint16_t nDecimal = 0;
    binarioADecimal_16(nBinario, &nEntero, &nDecimal, &signo);
    printf("Número en formato ±eee.ffff: %c%u.%u \n", signo, nEntero, nDecimal);
}