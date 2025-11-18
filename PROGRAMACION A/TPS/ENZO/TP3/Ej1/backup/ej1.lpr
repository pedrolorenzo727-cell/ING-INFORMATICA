program ej1;
var
  num, max, min : integer;
  n, i, posMax, ocurrencias : byte;

begin
  writeln('Ingrese n');
  readln(n);
  max := -9999;
  min := 9999;
  for i := 1 to n do
  begin
      writeln('Ingrese un numero');
      readln(num);
      if num > max then
      begin
        max := num;
        posMax := i;
        ocurrencias := 1;
      end
      else
          if num = max then
             ocurrencias := ocurrencias + 1;

      (*Es secuencial ya que en el caso que venga n = 1, el maximo y minimo es el unico*)
      if (num < min) and (num mod 2 <> 0) then
          min := num;
  end;
  writeln('El maximo es: ', max);
  writeln('Posicion: ', posMax);
  writeln('Ocurrencias: ', ocurrencias);
  if min <> 9999 then
     writeln('Minimo de impares: ', min)
  else
      writeln('No existe minimo impar');
  readln();
end.

