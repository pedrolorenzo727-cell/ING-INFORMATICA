program ej1;

CONST
  PBlanca=4.5;
  PNegra=9.5;
Var
  N,M:real;

begin
  //inciso a
  writeln('Ingrese cuantos litros de pintura blanca posee');
  readln(N);
  writeln('Usted debe comprar ',N*PNegra/PBlanca:3:1,' litros de pintura negra');
  readln;
end.

