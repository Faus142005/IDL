#pragma once

// Standard

#include <stdio.h>
#include <stdint.h>

/////////////////////////////////////////////

int64_t power(int64_t base, int64_t exponent); // SOLO POSITIVOS

struct formatoString
{
    char maxLongitudStr;
    char maxCaracteresParteEntera;
    char maxCaracteresParteDecimal;
};

/*
    Se le pasa:
    str: String que contiene el numero
    formato : formato el cual se tiene que respetar
    char *signo: Salida del signo, 0 = + | 1 = -
    char *parteEntera: Salida del string de la parte entera
    char *parteDecimal: Salida del string de la parte decimal
    Retorna 0 si salio bien
*/

char separarEnteroDecimal(char *str, struct formatoString formato, char *signo, char *parteEntera, char *parteDecimal);

/*
    El numero indica los bits que se usaran para representar el numero final
    El 8 representa entre -128 a 127
    El 16 -32768 a 32767
    El -2147483648 a 2147483647
    Retorna 0 si salio bien
*/

char stringAInt_8(int8_t *numero, char *str, char base);   // Base entre 2 y 36
char stringAInt_16(int16_t *numero, char *str, char base); // Base entre 2 y 36
char stringAInt_32(int32_t *numero, char *str, char base); // Base entre 2 y 36

/////////////////////////////////////////////

// Punto F

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

void ingresarNumeroDecimal_16(char entrada_num[10]);
char strAPuntoFijo_16(int16_t *numero, char entrada_num[LONGITUD_16 + 1]); // Retorna 0 si salio bien

/////////////////////////////////////////////

// Punto G

/////////////////////////////////////////////

// Punto H

/* Para la longitud del string de b y m se reutilizara LONGITUD_16.
        Para b, tambien, se utilizara LONGENTERO_16 y LONGDECIMAL_16.

   Para la longitud del string de x se utilizara LONGITUD_32 y para su parte real y decimal se utilizara LONGENTERO_32 y LONGDECIMAL_32.

   Para representar b se utilizará BITSENTEROS_16 y BITSDECIMAL_16.

   Para representar x se utilizará BITSENTEROS_32 y BITSDECIMAL_32.
*/
#define BITSREPRESENTACION_32 32
#define BITSENTEROS_32 16
#define BITSDECIMAL_32 15

#define LONGITUD_32 13
#define LONGENTERO_32 5
#define LONGDECIMAL_32 6

#define BITSENTEROS_16_M 0
#define BITSDECIMAL_16_M 15

#define LONGENTERO_16_M 1
#define LONGDECIMAL_16_M 6

#define MINIMO_X_32 -65408
#define MAXIMO_X_32 65408

char strAPuntoFijo_16_M(int16_t *numero, char entrada_num[LONGITUD_16 + 1]); // Retorna 0 si salio bien
void ingresarPendiente(char entrada_num[LONGITUD_16 + 1]);
void ingresarNumeroDecimal_32(char entrada_num[LONGITUD_32 + 1]);

/*  
    La flag indica si se esta trabajando con x o no, para acotar correctamente su rango a diferencia de un numero normal de 32 bits con signo
*/

char strAPuntoFijo_32(int32_t *numero, char entrada_num[LONGITUD_32 + 1], char flag); // Retorna 0 si salio bien
void calcularOrdenada(int32_t *y, int16_t m, int16_t b, int32_t x);
void imprimirOrdenada(int32_t y);