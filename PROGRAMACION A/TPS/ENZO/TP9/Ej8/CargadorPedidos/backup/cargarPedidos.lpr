program cargarPedidos;

type
  ST4 = string[4];
  TRegPed = record
    cod : ST4;
    talle : char;
    color : 1..4;
    cantidad : byte;
  end;

  TArchPed = file of TRegPed;

procedure cargarPedidos (var pedidos : TArchPed);
var
  archE : text;
  reg : TRegPed;
  car : char;
begin
  assign(archE, 'Pedidos.txt');
  reset(archE);
  rewrite(pedidos);
  while not eof(archE) do
  begin
    readln(archE, reg.cod, car,  reg.talle, reg.color, reg.cantidad);
    write(pedidos, reg);
  end;
  close(archE);
  close(pedidos);
end;

procedure listarPedidos (var pedidos : TArchPed);
var
  reg : TRegPed;
begin
  reset(pedidos);
  read(pedidos, reg);
  while not eof(pedidos) do
  begin
    writeln(reg.cod, ' ', reg.talle, ' ', reg.color, ' ', reg.cantidad);
        read(pedidos, reg);
  end;
  close(pedidos);
end;

var
  pedidos : TArchPed;

begin
  assign(pedidos, 'Pedidos.dat');
  cargarPedidos(pedidos);
  listarPedidos(pedidos);
  readln();
end.

