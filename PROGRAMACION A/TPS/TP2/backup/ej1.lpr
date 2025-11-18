program ej1;
Var
  Car:char;

begin
  writeln('Ingrese un caracter');
  readln(Car);
  Case Car of
       'A'..'Z': writeln('El caracter ingresado es una letra mayuscula');
       'a'..'z': writeln('El caracteringresado es una letra minuscula');
  else
      writeln('El caracter ingresado no es una letra');
  end;
  readln;
end.

