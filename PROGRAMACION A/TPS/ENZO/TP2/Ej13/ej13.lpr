program ej13;
const
  dolar = 120.80;
  euro = 150.10;
  valorReal = 26.50;

var
  x : real;
  tipo : char;

begin
  writeln('Ingrese monto en pesos');
  readln(x);
  writeln('Ingrese tipo de cambio (D, E, R)');
  readln(tipo);
  case upcase(tipo) of
       'D' : writeln('Puede comprar: ', x/dolar :4:2, ' dolares');
       'E' : writeln('Puede comprar: ', x/euro :4:2, ' euros');
       'R' : writeln('Puede comprar: ', x/valorReal :4:2, ' reales');
  end;
  readln();
end.

