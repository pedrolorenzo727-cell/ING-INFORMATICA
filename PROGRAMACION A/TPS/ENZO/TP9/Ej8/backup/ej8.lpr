program ej8;

type
  ST4 = string[4];
  TReg = record
       cod : ST4;
       talle : char;
       color : byte;
       prendas : word;
       precio : real;
  end;

  TArch = file of TReg;

   TRegPed = record
    cod : ST4;
    talle : char;
    color : 1..4;
    cantidad : byte;
  end;

  TArchPed = file of TRegPed;

procedure actualizarStock (var stock : TArch; var stockAct : TArch; var pedidos : TArchPed);
var
  RS : TReg;
  RP : TRegPed;
  cant : byte;
begin
  reset(stock);
  reset(pedidos);
  rewrite(stockAct);
  read(stock, RS);
  read(pedidos, RP);
  while not eof(stock) or not eof(pedidos) do
        if (RS.cod = RP.cod) then
           if RS.talle = RP.talle then
              if RS.color = RP.color then
              begin
                   if RS.prendas - RP.cantidad < 0 then
                   begin
                        cant := RP.cantidad - RS.prendas;
                        RS.prendas := 0;
                        writeln('La prenda ', RP.cod, ' de talle ', RP.talle, ' de color ', RP.color, ' adeuda ', cant, ' prendas');
                   end
                   else
                       RS.prendas := RS.prendas - RP.cantidad;
                   write(stockAct, RS);
                   read(stock, RS);
                   read(pedidos, RP);
              end
              else
                  if RS.color < RP.color then (* si tengo 1 2 y 1 4, al evaluar 2 con 4, significa que tengo que leer RS hasta ver si tengo ese color*)
                  begin
                       write(stockAct, RS);
                       read(stock, RS);
                  end
                  else
                      begin (* si tengo 1 4 y 1 2, al evaluar 4 y 2, significa que no tengo color 2. Pongo que falta eso y leo RP*)
                             writeln('La prenda ', RP.cod, ' de talle ', RP.talle, ' de color ', RP.color, ' adeuda ', cant, ' prendas');
                             read(pedidos, RP);
                      end
           else
               if RS.talle < RP.talle then (*Si tengo L M y L X, al evaluar M y X, significa que tengo que leer el stock hasta encontrar ese talle*)
               begin
                    write(stockAct, RS);
                    read(stock, RS);
               end
               else
                   begin (* si tengo L X y L M, al evaluar X y M, significa que no tengo talle M. Pongo que falta eso y leo RP*)
                         writeln('La prenda ', RP.cod, ' de talle ', RP.talle, ' de color ', RP.color, ' adeuda ', RP.cantidad, ' prendas');
                         read(pedidos, RP);
                   end
        else
            if RS.cod < RP.cod then (* si tengo AAAA BBBB y BBBB CCCC, al evaluar AAAA y BBBB, significa que tengo que seguir leyendo el stock hasta encontrar el articulo*)
            begin
                 write(stockAct, RS);
                 read(stock, RS);
            end
            else
                begin (* si tengo BBBB CCCC y AAAA BBBB, al evaluar BBBB y AAAA, significa que no tengo articulo AAAA. Pongo que falta eso y leo RP*)
                      writeln('La prenda ', RP.cod, ' de talle ', RP.talle, ' de color ', RP.color, ' adeuda ', cant, ' prendas');
                      read(pedidos, RP);
                end;

  close(stock);
  close(stockAct);
  close(pedidos);
end;

var
  stock, stockAct : TArch;
  pedidos : TArchPed;

begin
  assign(stock, 'Stock.dat');
  assign(pedidos, 'Pedidos.dat');
  assign(stockAct, 'stockAct.dat');
  actualizarStock(stock, stockAct, pedidos);
  readln();
end.

