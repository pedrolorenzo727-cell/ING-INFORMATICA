#include <stdio.h>
#include <stdlib.h>
#include "fracciones.h"


int main(){
    fraccion f1,f2, fres;
    int num1,num2;

    printf("ingrese el numerador y denominador de una fraccion");
    scanf("%d %d",&num1,&num2);
    f1=crear(num1,num2);
    printf("\ningrese el numerador y denominador de otra fraccion");
    scanf("%d %d",&num1,&num2);
    f2=crear(num1,num2);
    fres=sumar(f1,f2);
    printf("\n La suma entre las fracciones es: %d/%d",numerador(fres),denominador(fres));
    fres=restar(f1,f2);
    printf("\n La resta entre las fracciones es: %d/%d",numerador(fres),denominador(fres));
    fres=multiplicar(f1,f2);
    printf("\n La multiplicacion entre las fracciones es: %d/%d",numerador(fres),denominador(fres));
    fres=dividir(f1,f2);
    printf("\n La division entre las fracciones es: %d/%d",numerador(fres),denominador(fres));

    fres=simplificar(f1);
    printf("\n La primer fraccion simplificada es: %d/%d",numerador(fres),denominador(fres));

    if(iguales(f1,f2))
        printf("\nLas fracciones son iguales");
    else
        printf("\Las fracciones son distintas");

    return 0;
}
