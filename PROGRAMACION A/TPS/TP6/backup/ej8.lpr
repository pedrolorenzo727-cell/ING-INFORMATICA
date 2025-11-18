program ej8;
Const
  MAXELEM=10;

Type
  Bool=0..1;
  TVInt=array[1..MAXELEM] of integer;
  TMBool=array[1..MAXELEM,1..MAXELEM] of Bool;

Procedure LeeConjunto(Var A:TVInt; Var N:byte);
Var
  i:byte;
Begin
  writeln('Ingrese la cantidad de elementos del conjunto');
  readln(N);
  for i:=1 to N do
    Begin
      writeln('Ingrese el elemento ',i);
      readln(A[I]);
    end;
End;

Procedure CargaMatriz(Var Mat:TMBool; N:byte; A:TVInt);
Var
  i,j:byte;
Begin
  for i:=1 to N do
    for j:=1 to N do
      If Abs(A[j] Mod A[i]) = 0 then
        Mat[i,j]:=1
      else
        Mat[i,j]:=0;
end;

Procedure MuestraMatriz(Mat:TMBool; N:byte);
Var
  i,j:byte;
Begin
  For i:=1 to N do
    Begin
      For j:=1 to N do
        write(Mat[i,j],' ');
      writeln('');
    end;
end;

Function EsReflex(Mat:TMBool; N:byte):boolean;
Var
  i:byte;
Begin
  i:=1;
  while (i<N) and (Mat[i,i]<>0) do
    i:=i+1;
  If Mat[i,i]=0 then
    EsReflex:=false
  else
    EsReflex:=true;
end;

Function EsSimet(Mat:TMBool; N:byte):boolean;
Var
  i,j:byte;
  Cumple:boolean;
Begin
  i:=2; Cumple:=true;
  while (i<=N) and cumple do
    Begin
      j:=1;
      while (j<i-1) and (Mat[i,j]=Mat[j,i]) do
        j:=j+1;
      If Mat[i,j]<>Mat[j,i] then
        Cumple:=False;
      i:=i+1;
    end;
  EsSimet:=Cumple;
end;

Var
  Mat:TMBool;
  N:byte;
  A:TVInt;
begin
  LeeConjunto(A,N);
  CargaMatriz(Mat, N, A);
  MuestraMatriz(Mat,N);
  If EsReflex(Mat, N) then
    writeln('R es reflexiva')
  else
    writeln('R no es refelxiva');

  If EsSimet(Mat, N) then
    writeln('R es simetrica')
  else
    writeln('R no es simetrica');
  readln;
end.

