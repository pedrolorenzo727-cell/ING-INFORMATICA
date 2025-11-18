program ej5;
Function Determinante(a,b,d,e:integer):integer;
Begin
  Determinante:=a*e-d*b;
End;

Function DeterminanteX(c,b,f,e:integer):integer;
Begin
  DeterminanteX:=c*b-f*e;
end;

Var
  a,b,c,d,e,f:integer;
begin
  writeln('Ingrese de forma ordenada a,b,c,d,e,f (Ej: 2x+3y=5 y 3x-2y=1 : a:2,b:3,c:5,d:3,...)');
  readln(a,b,c,d,e,f);
  writeln('El valor de X es ',DeterminanteX(c,b,f,e)/Determinante(a,b,d,e));
  readln;
end.

