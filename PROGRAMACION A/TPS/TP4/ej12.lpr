program ej12;

Procedure Fibonacci(Cota:word);
Var
  N1,N2,N3:word;
Begin
  writeln('La sucesion de Fibonacci hasta ',Cota,' es:');
  N1:=1;
  N2:=1;
  N3:=N1+N2;
  write(N1,' ',N2);
  while N3<=Cota do
    Begin
      N3:=N1+N2;
      write(' ',N3);
      N1:=N2;
      N2:=N3
    end;
end;

Procedure LeeCotas;
Var
  i,N:byte;
  Cota:word;
Begin
  writeln('Ingrese la cantidad de cotas enteras positivas que ingresara');
  readln(N);
  For i:=1 to N do
    Begin
      writeln('Ingrese el valor de la cota');
      readln(Cota);
      Fibonacci(Cota);
    end;
end;

begin
  LeeCotas;
  readln;
end.

