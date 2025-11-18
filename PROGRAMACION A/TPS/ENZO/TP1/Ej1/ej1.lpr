program ej1;
const
     negro = 9.5;
     blanco = 4.5;
var
   n, m : real;
begin
     writeln('Ingrese litros de pintura blanca');
     readln(n);
     writeln('Ingrese litros de pintura negra');
     readln(m);
     writeln('Con ', n:4:2, ' litros de pintura blanca se necesitan ', (negro*n)/blanco:4:2, ' litros de pintura negra');
     writeln('Con ', m:4:2, ' litros de pintura negra se necesitan ', (blanco*m)/negro:4:2, ' litros de pintura blanca');
     readln();
end.

