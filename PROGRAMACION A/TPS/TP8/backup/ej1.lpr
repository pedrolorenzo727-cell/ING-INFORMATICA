program ej1;

Function PotenciaRecursiva(X,n:integer):real;
Begin
  If N=0 then
    PotenciaRecursiva:=1
  else
    If N>0 then
      PotenciaRecursiva:=X*PotenciaRecursiva(X,N-1)
    else
      PotenciaRecursiva:=(1/X)*PotenciaRecursiva(X,N+1);
end;

Var
  X,n:integer;

begin
  writeln('Ingrese Un valor X y un N');
  readln(X,N);
  writeln('La potencia ',N,'-esima de ',X,' es: ',PotenciaRecursiva(X,N):0:10);
  readln
end.

