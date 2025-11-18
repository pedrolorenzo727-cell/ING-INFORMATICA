program ej5;
uses math;
const
     ancho = 10;
     largo = 30;
     bal = 0.25;
var
  n, m, sup: real;
begin
  writeln('Ingrese ancho y largo de la superficie a embaldosar');
  readln(n,m);
  sup := n*m;
  writeln('La superficie ingresada representa ', sup*100/(ancho*largo):4:2, '%');
  writeln('Se necesitan ', ceil(sup/(bal*bal)), ' baldosas');
  readln();
end.

