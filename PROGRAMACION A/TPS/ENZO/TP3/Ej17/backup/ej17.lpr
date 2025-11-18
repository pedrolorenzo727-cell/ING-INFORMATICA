program ej17;
var
  archE : text;
  nombre, nombreMax : string[20];
  precioB, total, descuento: real;
  promocion : char;
  cantOferMax, cantOfer, cantSoloOfer, i , n : byte;
  soloOferta : boolean;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  cantOferMax := 0;
  cantSoloOfer := 0;
  while not eof(archE) do
  begin
    readln(archE, nombre);
    readln(archE, n);
    total := 0;
    cantOfer := 0;
    descuento := 0;
    soloOferta := true;
    for i := 1 to n do
    begin
      readln(archE, precioB);
      readln(archE, promocion);
      total := total + precioB;
      if upcase(promocion) = 'S' then
      begin
         descuento := descuento + precioB*0.10;
         cantOfer := cantOfer + 1;
      end
      else
          soloOferta := false;
    end;
    writeln(soloOferta);
    writeln(nombre);
    writeln('Monto total: $', total:4:2);
    writeln('Descuento total $', descuento:4:2);
    writeln('Precio a pagar: $', total - descuento:4:2);
    if cantOfer >= cantOferMax then
    begin
       cantOferMax := cantOfer;
       nombreMax := nombre;
    end;

    if soloOferta then
       cantSoloOfer := cantSoloOfer + 1;
    writeln();
  end;
  close(archE);
  if cantOferMax <> 0 then
     writeln('Cliente que compro mas articulos en oferta: ', nombreMax);
  writeln('Cantida de clientes que compraron solo en oferta: ', cantSoloOfer);
  readln();
end.

