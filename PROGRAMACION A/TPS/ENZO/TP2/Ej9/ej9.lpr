program ej9;
const
  sBasico = 8000;

var
  sueldo, x, ventas : real;
  presentismo: byte;
begin
  writeln('Ingrese monto de ventas');
  readln(ventas);
  sueldo := sBasico + ventas*0.05;
  writeln('Ingrese monto a superar');
  readln(x);

  if ventas > x then
     sueldo := sueldo + ventas*0.03;

  writeln('Ingrese ausentes');
  readln(presentismo);
  if presentismo = 0 then
     if ventas*0.02 > 1000 then
        sueldo := sueldo + ventas*0.02
     else
       sueldo := sueldo + 1000
  else
      if presentismo > 2 then
         sueldo := sueldo*0.93;

  writeln('Sueldo: $', sueldo:4:2);
  readln();
end.

