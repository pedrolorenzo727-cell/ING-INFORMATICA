program ej9;
Function Creciente(X:word):boolean;
Var
  Aux,Resto:word;
Begin
  If X=0 then
    Creciente:=true
  else
    Begin
      Resto:= X MOD 10;
      Aux:=X DIV 10;
      If  Resto>=(Aux MOD 10) then
        Creciente:=Creciente(Aux)
      else
        Creciente:=False;
    end;
end;

Var
  X:word;
begin
  writeln('Ingrese un numero natural'); readln(X);
  If Creciente(X) then
    writeln('El numero ',X,' posee los digitos crecientes
end.

