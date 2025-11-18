program ej6a;

Const
  MAXVEC=10;
Type
  TVInt=array[1..MAXVEC] of integer;

Const
  VEC: TVInt=(5,-9,6,3,0,-2,11,1,0,4);

Function BuscaRecur(VecInt:TVInt; n:byte; X:integer):byte;
Begin
  If n=0 then
    BuscaRecur:=0
  else
    If VecInt[N]=X then
      BuscaRecur:=n
    else
      BuscaRecur:=BuscaRecur(VecInt,n-1,X);
end;

//Busqueda ordenada lineal
Function BuscaRecur(VecInt:TVInt; n:byte; X:integer):byte;
Begin
  If n=0 then
    BuscaRecur:=0
  else
    If VecInt[N]=X then
        BuscaRecur:=n
    else
      If VecInt[N]>X then
        BuscaRecur:=BuscaRecur(VecInt,n-1,X)
      else
        BuscaRecur:=0;
end;
Var
  x:integer;
  n,i:byte;

begin
  n:=10;
  writeln('Ingrese un elemento a buscar');
  readln(X);
  i:=BuscaRecur(Vec, n, X);
  If i<>0 then
    writeln('El elemento esta en la posicion ',i)
  else
    writeln('El elemento buscado no esta en el arreglo');
  readln;
end.

