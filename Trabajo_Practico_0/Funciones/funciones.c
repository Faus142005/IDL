#include "funciones.h"
#include <string.h>
#include <ctype.h>

//#define DEBUG

// Funciones matematicas

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

// Funcionalidades generales

char separarEnteroDecimal(char *str, struct formatoString formato, char *signo, char *parteEntera, char *parteDecimal)
{

    if (str[formato.maxLongitudStr])
    {
        printf("Error: Exceso de caracteres\n");
        return -1;
    }

    *signo = 0;

    // Deteccion de signo
    if (str[0] == '+')
    {
        *signo = 0;
        str++;
    }
    else if (str[0] == '-')
    {
        *signo = 1;
        str++;
    }

    char i = 0;
    char j = 0;

    // Parte entera

    while (j < formato.maxCaracteresParteEntera && str[i] && str[i] != '.')
    {
        parteEntera[j] = str[i];
        i++;
        j++;
    }

    if (str[i] && str[i] != '.') // Se excede con la parte entera
    {
        printf("Error: Mal ingreso en la parte entera\n");
        return -2;
    }
    parteEntera[j] = 0;

    // Parte decimal

    i++;
    j = 0;

    while (j < formato.maxCaracteresParteDecimal && str[i] && str)
    {
        parteDecimal[j] = str[i];
        i++;
        j++;
    }

    if (str[i]) // Se excede con la parte decimal
    {
        printf("Error: Mal ingreso en la parte decimal\n");
        return -3;
    }

    parteDecimal[j] = 0;
    return 0;
}

char stringAInt_8(int8_t *numero, char *str, char base)
{
    if (base < 2 || base > 36)
        return -1;

    char signo = 0;

    if (str[0] == '-')
    {
        signo = 1;
        str++;
    }
    else if (str[1] == '+')
    {
        signo = 0;
        str++;
    }

    char caracter;
    char valor;
    const char upperValue = (~(1 << 5));
    *numero = 0;
    while (caracter = *str)
    {

        if (caracter >= '0' && caracter <= '9')
            valor = caracter - '0';
        else if (((caracter & upperValue) >= 'A') && ((caracter & upperValue) <= 'Z'))
            valor = caracter - 'A' + 10;
        else
            return -2;

        if (valor >= base)
            return -3;

        *numero = *numero * base + valor;
        str++;
    }

    if (signo)
        *numero *= -1;

    return 0;
}

char stringAInt_16(int16_t *numero, char *str, char base)
{
    if (base < 2 || base > 36)
        return -1;

    char signo = 0;

    if (str[0] == '-')
    {
        signo = 1;
        str++;
    }
    else if (str[0] == '+')
    {
        signo = 0;
        str++;
    }

    char caracter;
    char valor;
    const char upperValue = (~(1 << 5));
    *numero = 0;
    while (caracter = *str)
    {

        if (caracter >= '0' && caracter <= '9')
            valor = caracter - '0';
        else if (((caracter & upperValue) >= 'A') && ((caracter & upperValue) <= 'Z'))
            valor = caracter - 'A' + 10;
        else
            return -2;

        if (valor >= base)
            return -3;

        *numero = *numero * base + valor;
        str++;
    }

    if (signo)
        *numero *= -1;

    return 0;
}

char stringAInt_32(int32_t *numero, char *str, char base)
{
    if (base < 2 || base > 36)
        return -1;

    char signo = 0;

    if (str[0] == '-')
    {
        signo = 1;
        str++;
    }
    else if (str[1] == '+')
    {
        signo = 0;
        str++;
    }

    char caracter;
    char valor;
    const char upperValue = (~(1 << 5));
    *numero = 0;
    while (caracter = *str)
    {

        if (caracter >= '0' && caracter <= '9')
            valor = caracter - '0';
        else if (((caracter & upperValue) >= 'A') && ((caracter & upperValue) <= 'Z'))
            valor = caracter - 'A' + 10;
        else
            return -2;

        if (valor >= base)
            return -3;

        *numero = *numero * base + valor;
        str++;
    }

    if (signo)
        *numero *= -1;

    return 0;
}

//////////////////

void ingresarNumeroDecimal_16(char entrada_num[10])
{

    printf("Ingrese un numero con el formato ±eee.ffff: ");
    scanf("%s", entrada_num);
#ifdef DEBUG
    printf("Numero leido: %s\n", entrada_num);
#endif
}

char strAPuntoFijo_16(int16_t *numero, char entrada_num[LONGITUD_16 + 1])
{
    char signo = 0;
    char parte_entera_arreglo[LONGENTERO_16 + 1] = {0};
    char parte_decimal_arreglo[LONGDECIMAL_16 + 1] = {0};

    struct formatoString formato;
    formato.maxLongitudStr = LONGITUD_16;
    formato.maxCaracteresParteEntera = LONGENTERO_16;
    formato.maxCaracteresParteDecimal = LONGDECIMAL_16;

    char codigoFuncion = separarEnteroDecimal(entrada_num, formato, &signo, parte_entera_arreglo, parte_decimal_arreglo);
    if (codigoFuncion)
    {
        printf("Hubo un error al examinar el string. Error: %d\n", codigoFuncion);
        return -1;
    }

    const int16_t MINIMO_VALOR_ENTERO = -power(2, BITSENTEROS_16);
    const int16_t MAXIMO_VALOR_ENTERO = -MINIMO_VALOR_ENTERO - 1;

    const uint32_t MAXIMO_VALOR_FRACCIONARIO = ((power(2, BITSDECIMAL_16) - 1) * power(10, 4)) >> BITSDECIMAL_16;
#ifdef DEBUG
    if (signo)
        printf("Signo: -\n");
    else
        printf("Signo: +\n");
    printf("Parte entera: %s\n", parte_entera_arreglo);
    printf("Parte decimal: %s\n", parte_decimal_arreglo);
#endif

    // Con el signo, parte entera, y decimal separadas formo el numero

    // Manter con el mismo tipo para no olvidarse en las operaciones cambiar el tipo al mas grande

    uint16_t parte_entera = 0;
    uint16_t parte_decimal = 0;
    uint16_t parte_decimal_binario = 0;

    // Pasar string del entero a numero
    codigoFuncion = stringAInt_16(&parte_entera, parte_entera_arreglo, 10);
    if (codigoFuncion)
    {
        printf("Error: Mal ingresada la parte entera. Error: %d\n", codigoFuncion);
        return -2;
    }

    // Ver si esta en el rango
    if ((signo && -parte_entera < MINIMO_VALOR_ENTERO) || (!signo && parte_entera > MAXIMO_VALOR_ENTERO))
    {
        printf("Error: Fuera del rango de numeros en la parte entera\n");
        return -3;
    }

    // Pasar string del decimal a numero
    codigoFuncion = stringAInt_16(&parte_decimal, parte_decimal_arreglo, 10);
    if (codigoFuncion)
    {
        printf("Error: Mal ingresada la parte decimal. Error: %d\n", codigoFuncion);
        return -4;
    }

    if (signo && -parte_entera == MINIMO_VALOR_ENTERO && parte_decimal)
    {
        // Error
        printf("Error: Fuera del rango de numeros en la parte fraccionaria\n");
        return -5;
    }
    if ((!signo && parte_entera == MAXIMO_VALOR_ENTERO))
    {
        uint16_t auxiliarComparacion = parte_decimal;
        if (parte_decimal < power(10, 3))
            auxiliarComparacion *= 10;

        if (MAXIMO_VALOR_FRACCIONARIO < auxiliarComparacion)
        {
            printf("Error: Fuera del rango de numeros en la parte fraccionaria\n");
            return -6;
        }
    }

    /*if (parte_decimal > MAXIMO_VALOR_DECIMAL)
    {
        printf("Error: Fuera del rango de numeros en la parte decimal\n");
        return -5;
    }*/

    // Pasar el decimal a binario

    uint16_t restar = 1;

    while (restar < parte_decimal)
        restar *= 10;

    char i = 0;
    parte_decimal *= 2;

    while (i < BITSDECIMAL_16 && parte_decimal)
    {
        if (restar <= parte_decimal)
        {
            parte_decimal -= restar;
            parte_decimal_binario |= 1 << (BITSDECIMAL_16 - i - 1);
        }

        parte_decimal *= 2;
        i++;
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
    */

    // Ya con los binarios hechos juntarlos

    *numero = ((parte_entera << BITSDECIMAL_16) | parte_decimal_binario);

    // Aplicarle el signo Ca2

    if (signo)
        *numero = (~(*numero)) + 1;

    return 0;
}

char strAPuntoFijo_16_M(int16_t *numero, char entrada_num[LONGITUD_16 + 1])
{
    char signo = 0;
    char parte_entera_arreglo[LONGENTERO_16_M + 1] = {0};
    char parte_decimal_arreglo[LONGDECIMAL_16_M + 1] = {0};

    struct formatoString formato;
    formato.maxLongitudStr = LONGITUD_16;
    formato.maxCaracteresParteEntera = LONGENTERO_16_M;
    formato.maxCaracteresParteDecimal = LONGDECIMAL_16_M;

    char codigoFuncion = separarEnteroDecimal(entrada_num, formato, &signo, parte_entera_arreglo, parte_decimal_arreglo);
    if (codigoFuncion)
    {
        printf("Hubo un error al examinar el string. Error: %d\n", codigoFuncion);
        return -1;
    }

    const int16_t MINIMO_VALOR_ENTERO = -power(2, BITSENTEROS_16_M);
    const int16_t MAXIMO_VALOR_ENTERO = -MINIMO_VALOR_ENTERO - 1;

    const uint32_t MAXIMO_VALOR_FRACCIONARIO = ((power(2, BITSDECIMAL_32) - 1) * power(10, 6)) >> BITSDECIMAL_32;
#ifdef DEBUG
    if (signo)
        printf("Signo: -\n");
    else
        printf("Signo: +\n");
    printf("Parte entera: %s\n", parte_entera_arreglo);
    printf("Parte decimal: %s\n", parte_decimal_arreglo);
#endif

    // Con el signo, parte entera, y decimal separadas formo el numero

    // Manter con el mismo tipo para no olvidarse en las operaciones cambiar el tipo al mas grande

    uint32_t parte_entera = 0;
    uint32_t parte_decimal = 0;
    uint32_t parte_decimal_binario = 0;

    // Pasar string del entero a numero
    codigoFuncion = stringAInt_32(&parte_entera, parte_entera_arreglo, 10);
    if (codigoFuncion)
    {
        printf("Error: Mal ingresada la parte entera. Error: %d\n", codigoFuncion);
        return -2;
    }

    // Ver si esta en el rango
    if ((signo && (int32_t)(-parte_entera) < MINIMO_VALOR_ENTERO) || (!signo && parte_entera > MAXIMO_VALOR_ENTERO))
    {
        printf("Error: Fuera del rango de numeros en la parte entera\n");
        return -3;
    }

    // Pasar string del decimal a numero
    codigoFuncion = stringAInt_32(&parte_decimal, parte_decimal_arreglo, 10);
    if (codigoFuncion)
    {
        printf("Error: Mal ingresada la parte decimal. Error: %d\n", codigoFuncion);
        return -4;
    }

    if (signo && -parte_entera == MINIMO_VALOR_ENTERO && parte_decimal)
    {
        // Error
        printf("Error: Fuera del rango de numeros en la parte fraccionaria\n");
        return -5;
    }
    if ((!signo && parte_entera == MAXIMO_VALOR_ENTERO))
    {
        uint32_t auxiliarComparacion = parte_decimal;
        if (parte_decimal < power(10, 5))
            auxiliarComparacion *= 10;

        if (MAXIMO_VALOR_FRACCIONARIO < auxiliarComparacion)
        {
            printf("Error: Fuera del rango de numeros en la parte fraccionaria\n");
            return -6;
        }
    }

    /*if (parte_decimal > MAXIMO_VALOR_DECIMAL)
    {
        printf("Error: Fuera del rango de numeros en la parte decimal\n");
        return -5;
    }*/

    // Pasar el decimal a binario

    uint32_t restar = 1;

    while (restar < parte_decimal)
        restar *= 10;

    char i = 0;
    parte_decimal *= 2;

    while (i < BITSDECIMAL_16_M && parte_decimal)
    {
        if (restar <= parte_decimal)
        {
            parte_decimal -= restar;
            parte_decimal_binario |= 1 << (BITSDECIMAL_16_M - i - 1);
        }

        parte_decimal *= 2;
        i++;
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
    */

    // Ya con los binarios hechos juntarlos

    *numero = ((parte_entera << BITSDECIMAL_16_M) | parte_decimal_binario);

    // Aplicarle el signo Ca2

    if (signo)
        *numero = (~(*numero)) + 1;

    return 0;
}

void ingresarPendiente(char entrada_num[LONGITUD_16 + 1])
{

    printf("Ingrese un numero con el formato ±.ffffff: ");
    scanf("%s", entrada_num);
#ifdef DEBUG
    printf("Numero leido: %s\n", entrada_num);
#endif
}

void ingresarNumeroDecimal_32(char entrada_num[LONGITUD_32 + 1])
{

    printf("Ingrese un numero con el formato ±eeeee.ffffff: ");
    scanf("%s", entrada_num);
#ifdef DEBUG
    printf("Numero leido: %s\n", entrada_num);
#endif
}

char strAPuntoFijo_32(int32_t *numero, char entrada_num[LONGITUD_32 + 1], char flag)
{
    char signo = 0;
    char parte_entera_arreglo[LONGENTERO_32 + 1] = {0};
    char parte_decimal_arreglo[LONGDECIMAL_32 + 1] = {0};

    struct formatoString formato;
    formato.maxLongitudStr = LONGITUD_32;
    formato.maxCaracteresParteEntera = LONGENTERO_32;
    formato.maxCaracteresParteDecimal = LONGDECIMAL_32;

    char codigoFuncion = separarEnteroDecimal(entrada_num, formato, &signo, parte_entera_arreglo, parte_decimal_arreglo);
    if (codigoFuncion)
    {
        printf("Hubo un error al examinar el string. Error: %d\n", codigoFuncion);
        return -1;
    }
#ifdef DEBUG
    if (signo)
        printf("Signo: -\n");
    else
        printf("Signo: +\n");
    printf("Parte entera: %s\n", parte_entera_arreglo);
    printf("Parte decimal: %s\n", parte_decimal_arreglo);
#endif

    // Con el signo, parte entera, y decimal separadas formo el numero

    // Manter con el mismo tipo para no olvidarse en las operaciones cambiar el tipo al mas grande

    int32_t parte_entera = 0;
    int32_t parte_decimal = 0;
    int32_t parte_decimal_binario = 0;

    // Pasar string del entero a numero
    codigoFuncion = stringAInt_32(&parte_entera, parte_entera_arreglo, 10);
    if (codigoFuncion)
    {
        printf("Error: Mal ingresada la parte entera. Error: %d\n", codigoFuncion);
        return -2;
    }

    // Ver si esta en el rango de enteros

    int32_t MINIMO_VALOR_ENTERO;
    int32_t MAXIMO_VALOR_ENTERO;

    if (flag == 1)
    {
        MINIMO_VALOR_ENTERO = MINIMO_X_32;
        MAXIMO_VALOR_ENTERO = MAXIMO_X_32;
    }
    else
    {
        MINIMO_VALOR_ENTERO = -power(2, BITSENTEROS_32);
        MAXIMO_VALOR_ENTERO = -MINIMO_VALOR_ENTERO - 1;
    }

    if ((signo && -parte_entera < MINIMO_VALOR_ENTERO) || (!signo && parte_entera > MAXIMO_VALOR_ENTERO))
    {
        printf("Error: Fuera del rango de numeros en la parte entera\n");
        return -3;
    }

    // Pasar string del decimal a numero
    codigoFuncion = stringAInt_32(&parte_decimal, parte_decimal_arreglo, 10);
    if (codigoFuncion)
    {
        printf("Error: Mal ingresada la parte decimal. Error: %d\n", codigoFuncion);
        return -4;
    }

    if(!signo && parte_entera == MAXIMO_VALOR_ENTERO && parte_decimal){
        printf("Error: Fuera del rango de numeros en la parte fraccionaria\n");
        return -5;
    }

    if ((signo && -parte_entera == MINIMO_VALOR_ENTERO) && strcmp(parte_decimal_arreglo,MAXIMO_X_FRACCIONARIO) > 0)
    {
        printf("Error: Fuera del rango de numeros en la parte fraccionaria\n");
        return -6;
    }

    /*if (parte_decimal > MAXIMO_VALOR_DECIMAL)
    {
        printf("Error: Fuera del rango de numeros en la parte decimal\n");
        return -5;
    }*/

    // Pasar el decimal a binario

    int32_t restar = 1;

    while (restar < parte_decimal)
        restar *= 10;

    char i = 0;
    parte_decimal *= 2;

    while (i < BITSDECIMAL_32 && parte_decimal)
    {
        if (restar <= parte_decimal)
        {
            parte_decimal -= restar;
            parte_decimal_binario |= 1 << (BITSDECIMAL_32 - i - 1);
        }

        parte_decimal *= 2;
        i++;
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
    */

    // Ya con los binarios hechos juntarlos

    *numero = (parte_entera << BITSDECIMAL_32 | parte_decimal_binario);

    // Aplicarle el signo Ca2

    if (signo)
        *numero = (~(*numero)) + 1;

    return 0;
}

void calcularOrdenada(int32_t *y, int16_t m, int16_t b, int32_t x)
{
    int64_t resultado = (int64_t)m * x; // El casteo a m se hace para no perder precision hasta terminar de operar completamente

    int64_t b_64_bits = b;
    b_64_bits = b_64_bits << (2 * (BITSDECIMAL_32)-BITSDECIMAL_16); // Se alinea la parte fraccionaria de b con la de resultado (m*x lleva a Q(16,30))

    resultado += b_64_bits;
    *y = resultado >> BITSDECIMAL_32; // desplazo los bits de resultado para que se adapte a Q(16,15)
}

void imprimirOrdenada(int32_t y)
{
    int32_t y_parte_entera = y >> BITSDECIMAL_32;

    int32_t y_parte_decimal = y & (power(2, BITSDECIMAL_32) - 1);
    int32_t y_decimal_imprimir = (y_parte_decimal * power(10, LONGDECIMAL_32)) / power(2, BITSDECIMAL_32);

    printf("y en hexadecimal: %x\n", y);
    printf("y en decimal: %d.%d\n", y_parte_entera, y_decimal_imprimir);
}

// Funciones punto G:

int ingresarNumeroHexadecimal_16(char entrada_num[LONGITUD_HEXA + 1])
{
    printf("Ingrese un número con el formato 0xHHHH: ");
    scanf("%7s", entrada_num);
    if (entrada_num[LONGITUD_HEXA])
        return 1;
    entrada_num[1] = tolower(entrada_num[1]);
    entrada_num[2] = toupper(entrada_num[2]);
    entrada_num[3] = toupper(entrada_num[3]);
    entrada_num[4] = toupper(entrada_num[4]);
    entrada_num[5] = toupper(entrada_num[5]);
    return 0;
}

int validarNumeroHexadecimal_16(char entrada_num[LONGITUD_HEXA + 1])
{
    if (entrada_num[0] != '0')
        return 1;
    if (entrada_num[1] != 'x')
        return 1;
    if (!strchr(HEXA, entrada_num[2]))
        return 1;
    if (!strchr(HEXA, entrada_num[3]))
        return 1;
    if (!strchr(HEXA, entrada_num[4]))
        return 1;
    if (!strchr(HEXA, entrada_num[5]))
        return 1;
    return 0;
}

void hexadecimalABinario_16(char entrada_num[LONGITUD_HEXA + 1], uint16_t *nBinario)
{
    // Cada uno representa un Byte del numero binario resultado;
    uint8_t BYTES[4];
    for (int i = 0; i < 4; i++)
    {
        switch (entrada_num[i + 2])
        {
        case '0':
            BYTES[i] = 0b0000;
            break;
        case '1':
            BYTES[i] = 0b0001;
            break;
        case '2':
            BYTES[i] = 0b0010;
            break;
        case '3':
            BYTES[i] = 0b0011;
            break;
        case '4':
            BYTES[i] = 0b0100;
            break;
        case '5':
            BYTES[i] = 0b0101;
            break;
        case '6':
            BYTES[i] = 0b0110;
            break;
        case '7':
            BYTES[i] = 0b0111;
            break;
        case '8':
            BYTES[i] = 0b1000;
            break;
        case '9':
            BYTES[i] = 0b1001;
            break;
        case 'A':
            BYTES[i] = 0b1010;
            break;
        case 'B':
            BYTES[i] = 0b1011;
            break;
        case 'C':
            BYTES[i] = 0b1100;
            break;
        case 'D':
            BYTES[i] = 0b1101;
            break;
        case 'E':
            BYTES[i] = 0b1110;
            break;
        case 'F':
            BYTES[i] = 0b1111;
            break;
        }
    }
    *nBinario = (BYTES[0] << 12) | (BYTES[1] << 8) | (BYTES[2] << 4) | BYTES[3];
}

void binarioADecimal_16(uint16_t nBinario, uint16_t *nEntero, uint16_t *nDecimal, char *signo)
{
    // Compruebo si es negativo, en caso de serlo aplico Ca2;
    if ((nBinario >> 15) & 1)
    {
        *signo = '-';
        nBinario = ~nBinario + 1;
    }

    *nEntero = nBinario >> 8;
    *nDecimal = (nBinario & 0xFF) * 10000 / 256;
}