program ej2;
Function Factorial(N:byte):word;
Var
  Aux,i:byte;
Begin
  Aux:=1;
  For i:=1 to N do
    Aux:=Aux*i;

  Factorial:=Aux;
end;

Var
  N:byte;
begin
  writeln('Ingrese un numero >=0 para calcular su factorial');
  readln(N);

  writeln('El factorial de ',N,' es ',Factorial(N));
  readln;
end.

