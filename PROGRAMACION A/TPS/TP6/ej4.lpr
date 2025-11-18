program ej4;
Const
  MAXMAT=50;

Type
  TMI=array[1..MAXMAT,1..MAXMAT] of integer;

Procedure IniciaMatriz(Var Mat:TMI);
Var
  i,j:byte;
Begin
  For i:=1 to MAXMAT do
    For j:=1 to MAXMAT do
      Mat[i,j]:=0;
end;

Procedure CargaMatriz(Var Mat:TMI; Var N,M:byte);
Var
  Arch:text;
  i,j:byte;
Begin
  N:=0;M:=0;
  Assign(Arch,'ej4.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      read(Arch,i,j); readln(Arch,Mat[i,j]);
      If i>N then
        N:=i;
      If j>M then
        M:=j;
    end;
  Close(Arch);
end;

Procedure MuestraMatriz(Mat:TMI; N,M:byte);
Var
  i,j:byte;
Begin
  writeln('La matriz queda de la siguiente manera: ');
  For i:=1 to N do
    Begin
      For j:=1 to M do
        write(Mat[i,j]:4);
      writeln;
    end;
end;

Function TriangularInf(Mat:TMI; M:byte):boolean;
Var
  i,j:byte;
  Cumple:boolean;
Begin
  Cumple:=true;
  j:=2;
  while (j<M) and Cumple do
    Begin
      i:=1;
      while (i<J-1) and (Mat[i,j]=0) do
        i:=i+1;
      If Mat[i,j]<>0 then
        Cumple:=False
      else
        j:=j+1;
    end;
  TriangularInf:=Cumple;
end;

Var
  Mat:TMI;
  N,M:byte;
begin
  IniciaMatriz(Mat);
  CargaMatriz(Mat,N,M);
  MuestraMatriz(Mat,N,M);
  If N=M then
    If TriangularInf(Mat,M) then
      writeln('Es triangular inferior')
    else
      writeln('No es triangular inferior');
  readln;
end.

