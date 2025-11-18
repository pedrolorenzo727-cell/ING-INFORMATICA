program ej4;
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

procedure procesarArchivo (var stock : TArch);
var
  reg : TReg;
  codAct : ST4;
  talleAct : char;
  cant, cantT, cantN : byte;
  monto : real;
begin
  reset(stock);
  writeln('Stock de prendas':45);
  read(stock, reg);
  cantT := 0;
  cantN := 0;
  while not eof(stock) do
  begin
    writeln('Codigo: ', reg.cod);
    writeln('Talle', 'Cantidad':40, 'Precio Costo':40);
    codAct := reg.cod;
    while codAct = reg.cod do
    begin
      cant := 0;
      monto := 0;
      talleAct := reg.talle;
      while (talleAct = reg.talle) and (codAct = reg.cod) do
      begin
        if reg.color = 1 then
           cantN := cantN + reg.prendas;
        cant := cant + reg.prendas;
        monto := monto + reg.precio*reg.prendas;
        read(stock, reg);
      end;
      cantT := cantT + cant;
      writeln(talleAct,cant:40,monto:40:2);
    end;
    writeln();
  end;
  writeln('Cantidad total: ', cantT);
  writeln('Porcentaje de prendas negras: ', cantN*100/cantT:4:2, '%');
  close(stock);
end;

var
  stock : TArch;

begin
  assign(stock, 'stock.dat');
  procesarArchivo(stock);
  readln();
end.

