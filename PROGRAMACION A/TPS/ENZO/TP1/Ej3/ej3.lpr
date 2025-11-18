program ej3;
const
  hora = 200;
  desc = 11;
  med = 5;

var
  x : byte;
  sueldoBruto : real;
begin
  writeln('Ingrese cantidad de horas trabajadas');
  readln(x);
  sueldoBruto := hora*x;
  writeln('Sueldo Bruto $', sueldoBruto:4:2);
  writeln('Sueldo Neto $', sueldoBruto - sueldoBruto*11/100 - sueldoBruto*med/100:4:2);
  readln();
end.

