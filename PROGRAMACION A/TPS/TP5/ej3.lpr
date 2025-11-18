program ej3;
Const
  MAXVEC=100;
Type
  TVInt= array[1..MAXVEC] of integer;

Procedure CargaArreglo(Var Vec:TVInt; Var N:byte);
Var
  i:byte;
Begin
  writeln('Ingrese la cant de elementos del arreglo(N<=100)');
  readln(N);
  For i:=1 to N do
    Begin
      writeln('Ingrese el elemento ',i);
      readln(Vec[i]);
    end;
end;

Procedure Intercambia(Var Vec:TVInt; N:byte; K:integer);
Var
  i:byte;
Begin
  For i:=1 to N do
    if Vec[i]=K then
      Vec[i]:=0;
end;

Procedure MuestraArreglo(V:TVInt; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(V[i],' ');
  writeln('');
end;

Var
  K:integer;
  Vec:TVInt;
  N:byte;

begin
  CargaArreglo(Vec,N);
  writeln('Ingrese el numero por el cual desea cambiar por 0');
  readln(K);
  Intercambia(Vec,N,K);
  MuestraArreglo(Vec,N);
  readln;
end.

