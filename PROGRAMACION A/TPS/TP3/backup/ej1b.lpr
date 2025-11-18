program ej1b;
Var
  MinImp,Num:integer;
  N,i,:byte;
  HayMinImp:=Boolean;

begin
  MinImp:=150000;
  Writeln('Ingrese la cantidad de numeros');
  readln(N);
  For i:=1 to N do
    Begin
      writeln('Ingrese un numero');
      readln(Num);
      If Odd(Num) and (Num<MinImp) then
          Begin
            MinImp:=Num;
            HayMinImp:=True;
          end;
    end;
  writeln(
  readln;
end.

