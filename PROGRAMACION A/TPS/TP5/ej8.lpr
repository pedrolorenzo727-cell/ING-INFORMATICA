program ej8;
Const
  MAXVEC=100;
Type
  TVB= array[1..MAXVEC] of byte;

Procedure CargaArreglo(Var V:TVB; Var N:byte);
Var
  i:byte;
begin
  writeln('Ingrese la cantidad de elementos del arreglo');
  readln(N);
  writeln('A continuacion ingrese los elementos en forma ordenada y ascendente');
  For i:=1 to N do
    readln(V[i]);
end;

Procedure GeneraVecFrecuencias(V:TVB; N:byte; Var W:TVB; Var M:byte);
Var
  i,Control:byte;
Begin
  M:=0;
  Control:=0;
  For i:=1 to N do
    If V[i]=Control then
      W[M]:=W[M]+1
    else
      Begin
        Control:=V[i];
        M:=M+1;
        W[M]:=1;
      end;
End;

Procedure MuestraVector(Vec:TVB; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i],' ')
end;

Var
  V,W:TVB;
  N,M:byte;

begin
  CargaArreglo(V, N);
  GeneraVecFrecuencias(V,N,W,M);
  writeln('El vector frecuencias queda: ');
  MuestraVector(W,M);
  readln;
end.

