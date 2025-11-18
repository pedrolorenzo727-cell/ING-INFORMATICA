program ej17;

Function EsPrimo(N:byte):boolean;
Var
  i,ContDiv:byte;
Begin
  If N<2 then
    EsPrimo := False // 0 y 1 no son primos
  else
    Begin
      ContDiv:=0;
      i:=1;
      while ContDiv<=2 do
        Begin
          If (N mod i)=0 then
            ContDiv:=ContDiv+1;
          i:=i+1;
        end;
    end;
   EsPrimo:= ContDiv=2;
end;

Var
  N:byte;
begin
  writeln('Ingrese un numero para determinar si es primo');
  readln(N);
  If EsPrimo(N) then
    writeln('El nro ingresado es primo')
  else
    writeln('El nro ingresado no es primo');
  readln;
end.

