program ej6;
Var
  N:integer;

begin
  writeln('Ingrese un numero entero de mas de 3 cifras');
  readln(N);
  //INCISO A
  writeln('El numero sin las ultimas 3 cifras es: ',Trunc(N/1000));

  //INCISO B
  writeln('La cifra en la posicion de las centenas es: ',(N DIV 100) MOD 10);
  readln;
end.

