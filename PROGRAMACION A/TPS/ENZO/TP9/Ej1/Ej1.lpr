program Ej1;

type
  ST15 = string[15];
  TRegPaquetes = record
    cod : word;
    peso, monto : real;
    codDestino : 1..30;
  end;

  TRegDestino = record
    cod : 1..30;
    descripcion : ST15;
  end;

  TV = array[1..30] of byte;

  TArchPaquete = file of TRegPaquetes;
  TArchDestino = file of TRegDestino;

procedure cargaArchPaq (var paq : TArchPaquete);
var
  reg : TRegPaquetes;
  archE : text;
begin
  assign(archE, 'EntradaPaquetes.txt');
  reset(archE);
  rewrite(paq);
  while not eof (archE) do
  begin
    with reg do
         readln(archE, cod, peso, codDestino, monto);
    write(paq,reg);
  end;
  close(archE);
  close(paq);
end;

procedure listarPaquetes (var paq : TArchPaquete);
var
  reg : TRegPaquetes;
begin
  reset(paq);
  while not eof (paq) do
  begin
    read(paq, reg);
    with reg do
         writeln(cod, ' ',peso:4:2, ' ', codDestino, ' ', monto:4:2);
  end;
end;

procedure cargaArchDestino (var destino : TArchDestino);
var
  reg : TRegDestino;
  archE : text;
begin
  assign(archE, 'EntradaDestinos.txt');
  reset(archE);
  rewrite(destino);
  while not eof(archE) do
  begin
    with reg do
         readln(archE, cod, descripcion);
    write(destino, reg);
  end;
  close(archE);
  close(destino);
end;

procedure listarDestinos (var destino : TArchDestino);
var
  reg : TRegDestino;
begin
  reset(destino);
  while not eof (destino) do
  begin
    read(destino, reg);
    with reg do
         writeln(cod, descripcion);
  end;
end;

procedure iniciaVector (var tabla : TV);
var
  i : byte;
begin
  for i := 1 to 30 do
      tabla[i] := 0;
end;

procedure procesarArchivo (var paq : TArchPaquete; var tabla : TV);
var
  reg : TRegPaquetes;
  n : byte;
  pesoTotal, montoTotal : real;
begin
  reset(paq);
  iniciaVector(tabla);
  pesoTotal := 0;
  montoTotal := 0;
  n := 0;
  while not eof (paq) do
  begin
    read(paq, reg);
    pesoTotal := pesoTotal + reg.peso;
    montoTotal := montoTotal + reg.monto;
    n := n + 1;
    tabla[reg.codDestino] := tabla[reg.codDestino]  + 1;
  end;
  writeln('Peso promedio ', pesoTotal/n:4:2);
  writeln('Monto total $', montoTotal:4:2);
  close(paq);
end;

procedure mostrarVector (var destino : TArchDestino; tabla : TV);
var
  reg : TRegDestino;
  total : word;
begin
  reset(destino);
  total := 0;
  writeln('  Descripcion             Cantidad de Paquetes');
  while not eof (destino) do
  begin
    read(destino,reg);
    writeln(reg.descripcion, ' ', tabla[reg.cod]:15);
    total := total + tabla[reg.cod];
  end;
  writeln('Total: ', total);
end;

var
  paq : TArchPaquete;
  destino : TArchDestino;
  tabla : TV;

begin
  assign(paq, 'Paquetes.dat');
  assign(destino, 'Destinos.dat');
  cargaArchPaq(paq);
  cargaArchDestino(destino);
  writeln('Paquetes');
  listarPaquetes(paq);
  writeln();
  writeln('Destinos');
  listarDestinos(destino);
  writeln();
  procesarArchivo(paq,tabla);
  writeln();
  writeln();
  mostrarVector(destino,tabla);
  readln();
end.

