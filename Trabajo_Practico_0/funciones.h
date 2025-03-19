#pragma once

// Standard

#include <stdio.h>
#include <stdint.h>

/////////////////////////////////////////////

// PuntoF

/*

    Bits representacion: cuantos bits se usa para la representacion del punto fijo
    Bits enteros: cuantos bits se usa para la represe\ntacion de enteros
    Bits decimal: cuantos bits se usa para la representacion de decimal

    Longitud: es la longitud del string que puede ingresar como maximo el usuario
    Por ejemplo: -234.6789 tiene 9 caracteres (el maximo)

    Longitud entero: es la longitud del sector entero

    Longitud decimal: es la longitud del sector decimal
*/
#define BITSREPRESENTACION_16 16
#define BITSENTEROS_16 7
#define BITSDECIMAL_16 8

#define LONGITUD_16 9
#define LONGENTERO_16 3
#define LONGDECIMAL_16 4

int64_t power(int64_t base, int64_t exponent); // SOLO POSITIVOS

/////////////////////////////////////////////

// Punto F

void ingresarNumeroDecimal_16(char entrada_num[LONGITUD_16 + 1]);
char strAPuntoFijo_16(int16_t *numero, char entrada_num[LONGITUD_16 + 1]);

/////////////////////////////////////////////

// Punto G

/////////////////////////////////////////////

#define BITSREPRESENTACION_32 32
#define BITSENTEROS_32 15
#define BITSDECIMAL_32 16

#define LONGITUD_32 13
#define LONGENTERO_32 5
#define LONGDECIMAL_32 6

// Punto H