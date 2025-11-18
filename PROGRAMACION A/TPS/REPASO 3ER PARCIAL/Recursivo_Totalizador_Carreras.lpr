program Recursivo_Totalizador_Carreras;
Type
  TVA=array[1..10] of char;
  TVB=array[1..4] of char;
Const
  A: TVA=('Z','O','L','H','O','L','A','O','L','A');
  B: TVB=('H','O','L','A');

Function Cumple(A:TVA; B:TVB; i,j,M:byte):boolean;
Begin
  If i=0 then
    Cumple:=false
  else
    If A[i]=B[j] then
      If j=1 then
        Cumple:=true
      else
        Cumple:=Cumple(A,B,i-1,j-1,M)
    else
      If j<M then
        Cumple:=Cumple(A,B,i,M,M)
      else
        If i=M then
          Cumple:=False
        else
          Cumple:=Cumple(A,B,i-1,M,M);
end;
Var
  N,M:byte;
begin
  N:=10; M:=4;
  writeln('La palabra en B se encuentra en A: ',Cumple(A,B,N,M,M));
  readln;
end.

