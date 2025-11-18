program ej1;
Const
  MAXVEC=100;
Type
  TVR= array[1..MAXVEC] of real;

Function SumaElem(Vec:TVR; N:byte):real;
Var
  i:byte; Sum:real;
Begin
  Sum:=0;
  For i:=1 to N do
    Sum:=Sum + Vec[i];
  SumaElem:=Sum;
end;

Procedure MuestraPosPares(Vec:TVR; N:byte);
Var
  i:byte;
Begin
  writeln('Los elementos en las posiciones pares son:');
  i:=2;
  while i<=N do
    Begin
      write(Vec[i]:0:2,' ');
      i:=i+2;
    end;
  writeln('');
end;

Function Maximo(Vec:TVR; N:byte):real;
Var
  Max:real;
  i:byte;
Begin
  Max:=Vec[1];
  For i:=2 to N do
    If Vec[i]>Max then
      Max:=Vec[i];
  Maximo:=Max;
end;

Function Minimo(Vec:TVR; N:byte): real;
Var
  Min:real;
  i:byte;
Begin
  Min:=Vec[1];
  For i:=2 to N do
    If Vec[i]<Min then
      Min:=Vec[i];
  Minimo:=Min;
End;

Procedure GeneraVecInvertido(Vec:TVR; N:byte; Var VecInv:TVR);
Var
  i:byte;
Begin
  For i:=1 to N do
    VecInv[i]:=Vec[N-i+1];
end;

Procedure MuestraArreglo(Vec:TVR; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i]:0:2,' ');
  writeln('');
end;

Procedure CargaArreglo(Var Vec:TVR; Var N:byte);
Var
  i:byte;
Begin
  writeln('Ingrese la cant de elementos del vector (N<=100');
  readln(N);
  For i:=1 to N do
    Begin
      writeln('Ingrese el elemento ',i);
      readln(Vec[i]);
    end;
end;

Var
  Vec,VecInv:TVR;
  N:byte;
begin
  CargaArreglo(Vec,N);
  MuestraPosPares(Vec,N);
  writeln('El elemento maximo del arreglo es ',Maximo(Vec,N):0:2);
  writeln('El elemento minimo del arreglo es ',Minimo(Vec,N):0:2);
  GeneraVecInvertido(Vec,N,VecInv);
  MuestraArreglo(VecInv,M);
  readln;
end.

