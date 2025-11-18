program ej4;
Var
  N1,N2,MaxDif:integer;
  i,N,Par:byte;

begin
  MaxDif:=0;
  writeln('Cantidad de numeros a ingresar');
  readln(N);
  writeln('Ingrese el primer numero, los siguientes en forma descendente');
  readln(N1);
  For i:=2 to N do
    Begin
      writeln('Ingrese un numero');
      readln(N2);
      If(N1-N2)>MaxDif then
        Begin
          MaxDif:=N1-N2;
          Par:=i-1;
        end;
      N1:=N2;
    end;
  writeln('La maxima diferencia entre dos numeros consecutivos es ',Abs(MaxDif),' y corresponde al par ',Par);
  readln;
end.

