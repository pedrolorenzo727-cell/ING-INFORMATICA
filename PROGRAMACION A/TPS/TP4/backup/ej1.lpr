program ej1;

Function EsLetra(Car:char):boolean;
  Begin
    If (Car in['A'..'Z']) or (Car in['a'..'z']) then
      EsLetra:=True
    else
      EsLetra:=False;
  end;

Var
  Car:char;
begin
  writeln('Ingrese un caracter');
  readln(Car);
end.

