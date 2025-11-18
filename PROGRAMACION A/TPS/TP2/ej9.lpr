program ej9;
Const
  Basico=8000;
  Comision=0.05;
  SuperaX=1.03;
  Faltas=0.93;

Var
  Ventas,Sueldo,MontoASuperar:real;
  DiasFalto:byte;

begin
  writeln('Ingrese el total de las ventas, cuantos dias falto en el mes y el monto a superar');
  readln(Ventas,DiasFalto,MontoASuperar);

  Sueldo:=Basico+Ventas*Comision;

  If Ventas>MontoASuperar then
    Sueldo:=Sueldo*SuperaX;

  If DiasFalto<2 then
    If Ventas*0.02>1000 then
      Sueldo:=Sueldo + Ventas*0.02
    else
      Sueldo:=Sueldo+1000
  else
      Sueldo:=Sueldo*Faltas;

  writeln('Lo que debe cobrar el vendedor es $',Sueldo:4:2);
  readln;
end.

