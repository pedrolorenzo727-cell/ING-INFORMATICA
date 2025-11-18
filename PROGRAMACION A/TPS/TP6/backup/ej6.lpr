program ej6;
Const
  MAXMAT=100;

Type
  TMB=array[1..MAXMAT,1..MAXMAT] of byte;

Procedure GeneraCuadradoMagico(Var Mat:TMB; N:byte);
Var
  i,j,k:byte;

Begin
  K:=1;
  j:=(N+1) DIV 2;
  i:=1;
  Mat[i,j]:=1;
  while k<N*N do
    Begin
      K:=K+1;
      If ((K-1) mod N) = 0 then
        Begin
          i:=i+1;
          If i>N then
            i:=1;
        end
      else
        Begin
          i:=i-1;
          j:=j+1;
          If i<1 then
            i:=N;
          If J>N then
            J:=1;
        end;
      Mat[i,j]:=K;
    end;
end;

Procedure MuestraCuadrado(Mat:TMB; N:byte);
Var
  i,j:byte;
Begin
  For i:=1 to N do
    Begin
      for j:=1 to N do
        write(Mat[i,j],' ');
      writeln('');
    end;
end;

Function EsCuadrado(Mat:TMB; N:byte):boolean;
Var
  Suma,Refe:integer;
  Cumple:boolean;
  i,j:byte;
Begin
  Suma:=0; Refe:=0; Cumple:=true;
  For i:=1 to N do
    Refe:=Refe+Mat[i,i];

  i:=1;
  while (i<=N) and Cumple do
    Begin
      For j:=1 to N do
        Suma:=Suma+Mat[i,j];
      If Suma<>Refe then
        Cumple:=false;
      i:=i+1;
    end;
  j:=1;
  while (j<=N) and Cumple do
    Begin
      For i:=1 to N do
        Suma:=Suma+ Mat[i,j];
      If Suma<>Refe then
        Cumple:=False;
      j:=j+1;
    end;
  If Cumple then
    Begin
      For i:=1 to N do
        Suma:=Suma+Mat[i,N-i+1];
      If Suma<>Refe then
        Cumple:=False;
    end;

  EsCuadrado:= Cumple;
end;

Var
  Mat:TMB;
  N:byte;
begin
  N:=6;
  GeneraCuadradoMagico(Mat, N);
  MuestraCuadrado(Mat, N);
  If EsCuadrado(Mat,N) then
    writeln('Es cuadrado magico')
  else
    writeln('No es cuadrado Magico');
  readln;
end.

