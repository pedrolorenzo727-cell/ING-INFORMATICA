program ej4;
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

Procedure CompactaArreglo(Vec:TVInt; N:byte; Var VecComp:TVInt; Var M:byte);
Var
  i:byte;
Begin
  M:=0;
  For i:=1 to N do
    if Vec[i]<>0 then
      Begin
        M:=M+1; VecComp[M]:=Vec[i];
      end;
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
  Vec,VecComp:TVInt;
  N,M:byte;

begin
  CargaArreglo(Vec,N);
  CompactaArreglo(Vec,N,VecComp,M);
  If M>0 then
    MuestraArreglo(VecComp,M)
  else
    writeln('El arreglo ingresado posee todos ceros');
  readln;
end.

begin
end.

