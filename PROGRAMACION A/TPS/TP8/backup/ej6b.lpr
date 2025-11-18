program ej6b;
Const
  MAXVEC=10;
Type
  TVInt=array[1..MAXVEC] of integer;

Const
  VEC: TVInt=(-1,0,4,8,12,15,19,20,21,24);

Function BuscaBinaria(VecInt:TVInt; n,Pri,Ult:byte; X:integer):byte;
Var
  Medio:byte;
Begin
  Medio:=(Pri+Ult) DIV 2;
  If Pri<=Ult then
    If X<VecInt[Medio] then
      BuscaBinaria:=BuscaBinaria(VecInt,n,Pri,Medio-1,X)
    else
      If X>VecInt[Medio] then
        BuscaBinaria:=BuscaBinaria(VecInt,n,Medio+1,Ult,X)
      else
        BuscaBinaria:=Medio
  else
    BuscaBinaria:=0;
end;

Var
  i:byte;
  X:integer;
begin
  writeln('Ingrese un elemento X a buscar');
  readln(X);
  i:=BuscaBinaria(Vec, 1,10, X);
  If i<>0 then
    writeln('El elemento esta en la posicion ',i)
  else
    writeln('El elemento buscado no esta en el arreglo');
  readln;
end.
