typedef struct{
    int num,den;
} fraccion;

fraccion crear(int numerador, int denominador);
int numerador(fraccion f);
int denominador(fraccion f);
fraccion sumar(fraccion f1, fraccion f2);
fraccion restar(fraccion f1, fraccion f2);
fraccion multiplicar(fraccion f1, fraccion f2);
fraccion dividir(fraccion f1, fraccion f2);
int mcd(int a, int b);
fraccion simplificar(fraccion f);
int iguales(fraccion f1, fraccion f2);
