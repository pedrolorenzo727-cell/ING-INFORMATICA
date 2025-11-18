program ej3;
Const
  MAXMAT=50;

Type
  TM=array[1..MAXMAT,1..MAXMAT] of integer;

Procedure CargaMatriz(Var Mat:TM; Var N,M:byte);
Var
  j:byte;
  Arch:text;
Begin
  Assign(Arch,'ej3.txt'); reset(Arch);
  N:=0;
  readln(Arch,M);
  while not eof(Arch) do
    Begin
      N:=N+1;
      For j:=1 to M do
        read(Arch,Mat[N,j]);
      readln(Arch);
      If (Mat[N,M] MOD Mat[N,1])<>0 then
        N:=N-1;
    end;
  Close(Arch);
end;

Procedure MuestraMatriz(Mat:TM; N,M:byte);
Var
  i,j:byte;
Begin
  For i:=1 to N do
    Begin
      For j:=1 to M do
        write(Mat[i,j],' ');
      writeln;
    end;
end;

Var
  N,M:byte;
  Mat:TM;

begin
  CargaMatriz(MAT,N,M);
  MuestraMatriz(Mat, N, M);
  readln;
end.

