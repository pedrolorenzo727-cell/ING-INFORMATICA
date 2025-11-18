#include <stdio.h>
#include <stdlib.h>

int main()
{
    int *p, a = 4, b = 5;
    p = &b;
    *p *= 2;
    printf("b=%d *p=%d\n", b, *p); //b=10 *p=10
    printf("&b=%p p=%p &p=%p\n", &b, p, &p); //&b=direccion de memoria de b p=direccion de memoria de b &p=direccion de memoria del puntero p
    b = *p *3;
    printf("b=%d *p=%d\n", b, *p); //b=30 *p=30
    printf("&b=%p p=%p\n", &b, p); //misma salida que en el segundo printf
    a = b;
    p = &a;
    (*p)++;
    printf("b=%d a=%d *p=%d\n", b, a, *p); //b=30 a=31 *p=31
    printf("&b=%p &a=%p p=%p &p=%p\n", &b, &a, p, &p); //&b=direccion de memoria de b &a=direccion de memoria de a p=direccion de memoria de a &p=direccion de memoria del puntero p
    return 0;
}
