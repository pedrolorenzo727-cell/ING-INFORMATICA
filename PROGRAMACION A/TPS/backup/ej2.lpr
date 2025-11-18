program ej2;

CONST
  A1=1;

VAR
  k,Tk,Tk1:real;

begin
  writeln('Ingrese un valor para la sucesion');
  readln(K);

  Tk:= A1 + 3*(K-1);

  writeln('El termino ',K,'-esimo es ',Tk:3:2);

  Tk1:= A1 + 3*K;

  writeln('La diferencia entre los terminos ',K,' y ',K+1,' es ',Tk1-Tk:3:2);
  readln;
end.

