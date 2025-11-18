program ej7;
Type
  TMInt=array[1..5,1..5] of integer;

Const
  Mat: TMInt = (
    (  3,  5, -2,  0,  7),
    (  1, -1,  4,  8,  2),
    (  6,  0,  9, -3,  5),
    ( -4,  2,  1,  7, -1),
    (  0,  3, -5,  6,  4)
  );

Function Minimo(Matriz:TMInt; i,j,N:byte):integer;
Var
  Aux:integer;
Begin
  If (i=1) and (j=1) then
    Aux:=Matriz[1,1]
  else
    Begin
      If j>1 then
        Aux:=Minimo(Matriz,i,j-1,N)
      else
        Aux:=Minimo(Matriz,i-1,N,N);

      If Matriz[i,j]<Aux then
        Aux:=Matriz[i,j];
    end;
  Minimo:=Aux;
end;

Var
  n:byte;
begin
  n:=5;
  writeln('El elemento minimo de la matriz es: ',Minimo(Mat,N,N,N));
  readln;
end.

