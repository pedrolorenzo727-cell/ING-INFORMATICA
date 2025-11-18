program cargarventas;

type
  ST5 = string[5];
  ST15 = string[15];
  TRegVen = record
    legajo : ST5;
    n : word;
    valor : real;
  end;

  TArchVen = file of TRegVen;

procedure cargarVentas (var ventas : TArchVen);
var
  archE : text;
  reg : TRegVen;
  car : char;
begin
  assign(archE, 'cargaVentas.txt');
  reset(archE);
  rewrite(ventas);
  while not eof(archE) do
  begin
    readln(archE, reg.legajo, reg.n, reg.valor);
    write(ventas, reg);
  end;
  close(archE);
  close(ventas);
end;

procedure listarVentas (var ventas : TArchVen);
var
  reg : TRegVen;
begin
  reset(ventas);
  read(ventas, reg);
  while not eof(ventas) do
  begin
    writeln(reg.legajo);
    writeln(reg.n);
    writeln(reg.valor:4:2);
    read(ventas, reg);
  end;
  close(ventas);
end;

var
  ventas : TArchVen;

begin
  assign(ventas, 'ventas.dat');
  cargarVentas(ventas);
  listarVentas(ventas);
  readln();
end.

