#include "funciones.h"

int64_t power(int64_t base, int64_t exponent)
{
    int64_t result = 1;

    while (exponent > 0)
    {

        if (exponent % 2)
            result *= base;
        base *= base;
        exponent /= 2;
    }

    return result;
}

void ingresarNumeroDecimal_16(char entrada_num[LONGITUD_16 + 1])
{

    printf("Ingrese un numero con el formato ±eee.ffff: ");
    scanf("%s", entrada_num);
    printf("Numero leido: %s\n", entrada_num);
}

char strAPuntoFijo_16(int16_t *numero, char entrada_num[LONGITUD_16 + 1])
{

    if (entrada_num[LONGITUD_16]) // Si se pasa de la LONGITUD + 1 maxima del numero
    {
        printf("Error: Exceso de caracteres\n");
        return -1;
    }

    const int16_t MINIMO_VALOR_ENTERO = -power(2, BITSENTEROS_16);
    const int16_t MAXIMO_VALOR_ENTERO = -MINIMO_VALOR_ENTERO - 1;

    char signo;
    char *numero_sin_signo = entrada_num;
    char parte_entera_arreglo[LONGENTERO_16 + 1] = {0};
    char parte_decimal_arreglo[LONGDECIMAL_16 + 1] = {0};

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

    while (j < LONGENTERO_16 && numero_sin_signo[i] && numero_sin_signo[i] != '.')
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

    while (j < LONGDECIMAL_16 && numero_sin_signo[i] && numero_sin_signo)
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
            printf("Error: Mal ingresado el numero\n");
            return -4;
        }

        parte_entera *= 10;
        parte_entera += parte_entera_arreglo[i] - '0'; // Pasar del valor del caracter al numerico

        i++;
    }

    // Ver si esta en el rango

    if ((signo && -parte_entera < MINIMO_VALOR_ENTERO) || (!signo && parte_entera > MAXIMO_VALOR_ENTERO))
    {
        printf("Error: Fuera del rango de numeros en la parte entera\n");
        return -5;
    }

    // Pasar string del decimal a numero

    i = 0;

    while (parte_decimal_arreglo[i])
    {

        if (parte_decimal_arreglo[i] - '0' < 0 || parte_decimal_arreglo[i] - '0' > 9)
        {
            printf("Error: Mal ingresado el numero\n");
            return -6;
        }

        parte_decimal *= 10;
        parte_decimal += parte_decimal_arreglo[i] - '0'; // Pasar del valor del caracter al numerico

        i++;
    }

    // Pasar el decimal a binario

    uint16_t restar = power(10, i);

    j = 0;

    parte_decimal *= 2;

    while (j < BITSDECIMAL_16 && parte_decimal)
    {
        printf("Restando %d a %d\n", restar, parte_decimal);
        if (restar <= parte_decimal)
        {
            parte_decimal -= restar;
            parte_decimal_binario |= 1 << (BITSDECIMAL_16 - j - 1);
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

    if (restar < parte_decimal)
    {
        if ((uint8_t)(parte_decimal_binario + (uint8_t)(1)))
        {
            parte_decimal_binario += 1;
            printf("Hola");
        }
        else if ((uint8_t)(parte_entera + (uint8_t)(1)))
        {
            parte_decimal_binario += 1;
            parte_entera += 1;
        }
    }

    // Ya con los binarios hechos juntarlos
    *numero = 0;
    *numero = (parte_entera << (BITSDECIMAL_16)) | parte_decimal_binario;

    // Aplicarle el signo Ca2

    for (int i = sizeof(int16_t) * 8 - 1; i >= 0; i--)
    {
        printf("%d", (*numero >> i) & 1);
    }
    printf("\n");
    if (signo)
        *numero = (~(*numero)) + 1;

    return 0;
}