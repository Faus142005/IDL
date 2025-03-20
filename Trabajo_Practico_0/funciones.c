#include "funciones.h"

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
    printf("Numero leido: %s\n", entrada_num);
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

    if (signo)
        printf("Signo: -\n");
    else
        printf("Signo: +\n");
    printf("Parte entera: %s\n", parte_entera_arreglo);
    printf("Parte decimal: %s\n", parte_decimal_arreglo);

    // Con el signo, parte entera, y decimal separadas formo el numero

    // Manter con el mismo tipo para no olvidarse en las operaciones cambiar el tipo al mas grande

    uint16_t parte_entera;
    uint16_t parte_decimal;
    uint16_t parte_decimal_binario;

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

    *numero = (parte_entera << BITSDECIMAL_16 | parte_decimal_binario);

    // Aplicarle el signo Ca2

    if (signo)
        *numero = (~(*numero)) + 1;

    return 0;
}