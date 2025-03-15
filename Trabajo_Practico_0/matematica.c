#include "matematica.h"

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