program ej6;
var
  n : integer;
begin
     writeln('Ingrese un numero de mas de 3 cifras');
     readln(n);
     writeln('Numero sin las tres ultimas cifras ', n div 100);
     writeln('Numero en la posicion de las centenas ', (n div 100) mod 10);
     readln();
end.

