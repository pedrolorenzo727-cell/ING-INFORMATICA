program ej12;
Type
  TMI=array[1..10,1..10] of integer;

Function Cumple(Mat:TMI; Suma:integer; i,j,M:byte):boolean;
Begin
  If i=0 then
    Cumple:=true
  else
    Begin
      If i<>j then
        Suma:=Suma+Mat[i,j];
      If j>=1 then
        Cumple:=Cumple(Mat, Suma, i, j-1, M)
      else
        If Mat[i,i]>Suma then
          Cumple:=Cumple(Mat,0,i-1,M,M)
        else
          Cumple:=False;
    end;
end;
Var
  Mat:TMI;
  M,i,j:byte;
begin
  writeln('Ingrese la dimension ');
  readln(M);
  For i:=1 to M do
    For j:=1 to M do
      Begin
        writeln('Ingrese el elemento ',i:2,j:2);
        readln(Mat[i,j]);
      end;
  If Cumple(Mat,0,M,M,M) then
    writeln('La matriz cumple con la condicion')
  else
    writeln('La matriz no cumple con la condicion');
  readln;
end.

