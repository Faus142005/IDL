// Standard

#include <stdio.h>
#include <stdint.h>

// Propios

#include "matematica.h"

/*

    Bits representacion: cuantos bits se usa para la representacion del punto fijo
    Bits enteros: cuantos bits se usa para la representacion de enteros
    Bits decimal: cuantos bits se usa para la representacion de decimal

    Longitud: es la longitud del string que puede ingresar como maximo el usuario
    Por ejemplo: -234.6789 tiene 9 caracteres (el maximo)

    Longitud entero: es la longitud del sector entero

    Longitud decimal: es la longitud del sector decimal
*/
#define BITSREPRESENTACION 16
#define BITSENTEROS 7
#define BITSDECIMAL 8

#define LONGITUD 9
#define LONGENTERO 3
#define LONGDECIMAL 4

void printBinary(int16_t num)
{
    for (int i = sizeof(int16_t) * 8 - 1; i >= 0; i--)
    {
        printf("%d", (num >> i) & 1);
    }
    printf("\n");
}


void ingresarNumero(char entrada_num[LONGITUD + 1]);
char strToFixedPoint(int16_t *numero, char entrada_num[LONGITUD + 1]);

int main()
{

    char entrada_num[LONGITUD + 1] = {0};
    int16_t numero;

    ingresarNumero(entrada_num);

    char exitoso = strToFixedPoint(&numero, entrada_num);

    if (exitoso)
    {
        printf("Codigo de error: %d\n", exitoso);
        return exitoso;
    }
    printf("Numero en hexadecimal: ");
    printf("%04hx\n", numero);

    return 0;
}

void ingresarNumero(char entrada_num[LONGITUD + 1])
{

    printf("Ingrese un numero con el formato ±eee.ffff: ");
    scanf("%s", entrada_num);
    printf("Numero leido: %s\n", entrada_num);
}

char strToFixedPoint(int16_t *numero, char entrada_num[LONGITUD + 1])
{

    if (entrada_num[LONGITUD]) // Si se pasa de la LONGITUD + 1 maxima del numero
    {
        printf("Error: Exceso de caracteres\n");
        return -1;
    }

    const int16_t MINIMO_VALOR_ENTERO = -power(2, BITSENTEROS);
    const int16_t MAXIMO_VALOR_ENTERO = -MINIMO_VALOR_ENTERO - 1;

    char signo;
    char *numero_sin_signo = entrada_num;
    char parte_entera_arreglo[LONGENTERO + 1] = {0};
    char parte_decimal_arreglo[LONGDECIMAL + 1] = {0};

    int i = 0;
    int j = 0;

    // Detectar signo

    if (entrada_num[0] == '+')
    {
        signo = 0;
        numero_sin_signo++;
    }

    else if (entrada_num[0] == '-')
    {
        signo = 1;
        numero_sin_signo++;
    }

    // Ya sin el signo separar en entero y decimal

    while (j < LONGENTERO && numero_sin_signo[i] && numero_sin_signo[i] != '.')
    {
        parte_entera_arreglo[j] = numero_sin_signo[i];
        i++;
        j++;
    }

    if (numero_sin_signo[i] && numero_sin_signo[i] != '.') // Se excede con la parte entera
    {
        printf("Error: Mal ingreso en la parte entera\n");
        return -2;
    }

    i++;
    j = 0;

    while (j < LONGDECIMAL && numero_sin_signo[i] && numero_sin_signo)
    {
        parte_decimal_arreglo[j] = numero_sin_signo[i];
        i++;
        j++;
    }

    if (numero_sin_signo[i]) // Se excede con la parte decimal
    {
        printf("Error: Mal ingreso en la parte decimal\n");
        return -3;
    }

    if (signo)
        printf("Signo: -\n");
    else
        printf("Signo: +\n");
    printf("Parte entera: %s\n", parte_entera_arreglo);
    printf("Parte decimal: %s\n", parte_decimal_arreglo);

    // Con el signo, parte entera, y decimal separadas formo el numero

    // Manter con el mismo tipo para no olvidarse en las operaciones cambiar el tipo al mas grande

    uint16_t parte_entera = 0;
    uint16_t parte_decimal = 0;
    uint16_t parte_decimal_binario = 0;

    // Pasar string del entero a numero

    i = 0;

    while (parte_entera_arreglo[i])
    {

        if (parte_entera_arreglo[i] - '0' < 0 || parte_entera_arreglo[i] - '0' > 9)
        {
            printf("Error: Mal ingresado el numero");
            return -4;
        }

        parte_entera *= 10;
        parte_entera += parte_entera_arreglo[i] - '0'; // Pasar del valor del caracter al numerico

        i++;
    }

    // Ver si esta en el rango

    if ((signo && -parte_entera < MINIMO_VALOR_ENTERO) || (!signo && parte_entera > MAXIMO_VALOR_ENTERO))
    {
        printf("Error: Fuera del rango de numeros en la parte entera");
        return -5;
    }

    // Pasar string del decimal a numero

    i = 0;

    while (parte_decimal_arreglo[i])
    {

        if (parte_decimal_arreglo[i] - '0' < 0 || parte_decimal_arreglo[i] - '0' > 9)
        {
            printf("Error: Mal ingresado el numero");
            return -6;
        }

        parte_decimal *= 10;
        parte_decimal += parte_decimal_arreglo[i] - '0'; // Pasar del valor del caracter al numerico

        i++;
    }

    // Pasar el decimal a binario

    uint16_t restar = power(10, i);

    j = 0;

    while (j <= BITSDECIMAL && parte_decimal)
    {
        if (restar <= parte_decimal)
        {
            parte_decimal -= restar;
            parte_decimal_binario |= 1 << (BITSDECIMAL - j);
        }

        parte_decimal *= 2;
        j++;
    }

    /*
        Para lograr acercarse al maximo al valor hay que ver si esta mas cerca ahora o 
        con el siguiente bit (que no existe) encendido para aproximarse lo mejor posible.

        Para esto hay que ver cual si es mayor la diferencia ahora o con el bit encendido
        Si esta mas cerca ahora se deja asi
        Si esta mas cerca con el bit encendido entonces como no puedo encenderlo
        ya que no tengo espacio hago un + 1 / 2^maxBit ya que estaria mas cerca

        Ej:

        Si estoy en 0.296875 y quiero representar el 0.3 estaria en esta situacion:
        0100110 y si le hago un + 1 me paso asi que tengo que ver como redondeo

        Si el siguiente bit (que no lo dispongo) se pone en 1 eso significa que estoy
        igual o mas cerca haciendole al 0100110 + 1 que no haciendolo

        Por este motivo se le hace el + 1 o no, para mejorar la precision
    */

    if (parte_decimal && restar < parte_decimal)
    {
        parte_decimal_binario += 1;
    }

    // Ya con los binarios hechos juntarlos
    *numero = 0;
    *numero = (parte_entera << (BITSDECIMAL)) | parte_decimal_binario;

    // Aplicarle el signo Ca2

    if (signo)
        *numero = (~(*numero)) + 1;

    return 0;
}