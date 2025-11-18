program ej16;

Function Capicua(N:integer):boolean;
Var
  Cad1,Cad2:string[10];
  i:byte;
Begin
  Str(N,Cad1);
  Cad2:='';
  If N>0 then
    For i:=1 to length(Cad1) do
      Cad2:=Cad1[i]+Cad2
  else
    Begin
      For i:=2 to length(Cad1) do
        Cad2:=Cad1[i]+Cad2;
      Cad2:='-'+Cad2;
    end;

  Capicua:=Cad2=Cad1;

end;

Var
  N:integer;

begin
  writeln('Ingrese un numero entero');
  readln(N);
  If Capicua(N) then
    writeln('El numero ingresado es capicua')
  else
    writeln('El numero ingresado no es capicua');
  readln;
end.

