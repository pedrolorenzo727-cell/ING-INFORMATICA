#include <stdio.h>
#include "fracciones.h"

fraccion crear(int numerador, int denominador){
    fraccion f;

    f.num=numerador;
    f.den=denominador;
    return f;
}

int numerador(fraccion f){
    return f.num;
}

int denominador(fraccion f){
    return f.den;
}

fraccion sumar(fraccion f1, fraccion f2){
    fraccion f;

    if (f1.den==f2.den){
      f.num=f1.num+f2.num;
      f.den=f1.den;
    }
    else{
        f.num=f1.num*f2.den+f2.num*f1.den;
        f.den=f1.den*f2.den;
    }
    return f;

}

fraccion restar(fraccion f1, fraccion f2){
    fraccion f;

    if (f1.den==f2.den){
      f.num=f1.num-f2.num;
      f.den=f1.den;
    }
    else{
        f.num=f1.num*f2.den-f2.num*f1.den;
        f.den=f1.den*f2.den;
    }
    return f;

}

fraccion multiplicar(fraccion f1, fraccion f2){
    fraccion f;

    f.den=f1.den*f2.den;
    f.num=f1.num*f2.num;
    return f;
}

fraccion dividir(fraccion f1, fraccion f2){
    int aux;
      aux=f2.num;
      f2.num=f2.den;
      f2.den=aux;
    return multiplicar(f1,f2);
}

int mcd(int a, int b){
  int aux;
  while(b != 0){
    aux=b;
    b= a%b;
    a=aux;
  }
  return a;
}

fraccion simplificar(fraccion f){
    int divisor;

    divisor= mcd(f.num,f.den);
    f.num /= divisor;
    f.den /= divisor;
    return f;
}

int iguales(fraccion f1, fraccion f2){
    return f1.num==f2.num && f1.den==f2.den;
}

