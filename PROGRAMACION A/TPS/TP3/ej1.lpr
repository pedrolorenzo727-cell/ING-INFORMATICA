program ej1;
Var
  Max,Num:integer;
  N,i,PosMax,ContMax:byte;

begin
  Writeln('Ingrese la cantidad de numeros');
  readln(N);
  writeln('Ingrese el primer numero');
  readln(Num);
  Max:=Num;
  PosMax:=1;
  For i:=2 to N do
    Begin
      writeln('Ingrese un numero');
      readln(Num);
      If Num>Max then
        Begin
          Max:=Num;
          PosMax:=i;
          ContMax:=1;
        end
      else
        If Num=Max then
          ContMax:=ContMax+1;
    end;
  writeln('El maximo es ',Max,' la primera aparicion ocupa el lugar ',PosMax,' y aparece ',ContMax,' veces');
  readln;
end.

