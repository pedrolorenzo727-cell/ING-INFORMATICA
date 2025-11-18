program Ej1;
var
  car : char;
begin
  writeln('Ingrese un caracter');
  readln(car);
  case car of
       'a'..'z' : writeln('El caracter ingresado es miniscula');
       'A'..'Z' : writeln('El caracter ingresado es mayuscula');
  else
    writeln('El caracter ingresado no es  una letra');
  end;
  readln();
end.

