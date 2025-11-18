program ej13;
Const
  Dolar=120.8;
  Euro=150.1;
  Reales=26.5;
Var
  Pesos:real;
  Moneda:char;

begin
  writeln('Ingrese la cantidad de pesos que desea cambiar');
  readln(Pesos);
  writeln('Ingrerse la moneda a la cual desea cambiarlos (D,E,R)');
  readln(Moneda);
  Case UpCase(Moneda) of
    'D': writeln('Usted puede comprar ',Pesos/Dolar:5:2,' dolares');
    'E': writeln('Usted puede comprar ',Pesos/Euro:5:2,' euros');
    'R': writeln('Usted puede comprar ',Pesos/Reales:5:2,' reales');
  else
    writeln('Ingreso un tipo de moneda erroneo');
  end;
  readln;
end.

