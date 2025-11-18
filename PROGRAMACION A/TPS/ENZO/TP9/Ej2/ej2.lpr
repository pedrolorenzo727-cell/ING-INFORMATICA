program ej2;
const
  maxElem = 100;

type
  ST16 = string[16];
  ST30 = string[30];
  ST3 = string[3];
  TRegTarjeta = record
    numero : ST16;
    nombre : ST30;
    tope, gasto : real;
  end;

  TRegRechazados = record
    numero : ST16;
    cod : ST3;
    monto : real;
  end;

  TArchTarjetas = file of TRegTarjeta;
  TArchRechazados = file of TRegRechazados;
  TV = array[1..maxElem] of ST16;

procedure cargaTarjetas (var tarjetas : TArchTarjetas);
var
  archE : text;
  reg : TRegTarjeta;
begin
  assign(archE, 'cargaTarjetas.txt');
  reset(archE);
  rewrite(tarjetas);
  while not eof(archE) do
  begin
    readln(archE, reg.numero);
    readln(archE, reg.nombre);
    readln(archE, reg.tope);
    readln(archE, reg.gasto);
    write(tarjetas, reg);
  end;
  close(archE);
  close(tarjetas);
end;

procedure listarTarjetas (var tarjetas : TArchTarjetas);
var
  reg : TRegTarjeta;
begin
  reset(tarjetas);
  while not eof(tarjetas) do
  begin
    read(tarjetas, reg);
    writeln(reg.numero);
    writeln(reg.nombre);
    writeln(reg.tope:4:2);
    writeln(reg.gasto:4:2);
    writeln();
  end;
  close(tarjetas);
end;

procedure generarV (var tarjetas : TArchTarjetas; var v : TV; var n : byte);
var
  reg : TRegTarjeta;
begin
  reset(tarjetas);
  n := 0;
  while not eof(tarjetas) do
  begin
    n := n + 1;
    read(tarjetas, reg);
    v[n] := reg.numero;
  end;
  close(tarjetas);
end;

function buscCod (v : TV; numero : ST16; n : byte):byte;
var
  i : byte;
begin
  i := 1;
  while (i <= n) and (v[i] <> numero) do
        i := i + 1;
  if i <= n then
     buscCod := i
  else
    buscCod := 0;
end;

procedure procesarArchivo (var tarjetas : TArchTarjetas; var rechazados : TArchRechazados; v : TV; n : byte);
var
  archE : text;
  regTarjeta : TRegTarjeta;
  reg : TRegRechazados;
  pos : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  reset(tarjetas);
  rewrite(rechazados);
  while not eof (archE) do
  begin
    readln(archE, reg.numero);
    readln(archE, reg.monto);
    readln(archE, reg.cod);
    pos := buscCod(v,reg.numero,n);
    if pos <> 0 then
    begin
      seek(tarjetas,pos - 1);
      read(tarjetas, regTarjeta);
      if regTarjeta.gasto + reg.monto <= regTarjeta.tope then
      begin
         seek(tarjetas,pos - 1);
        regTarjeta.gasto := regTarjeta.gasto + reg.monto;
        write(tarjetas,regTarjeta);
      end
      else
          write(rechazados, reg);
    end;
  end;
  close(archE);
  close(tarjetas);
end;

var
  tarjetas : TArchTarjetas;
  rechazados : TArchRechazados;
  v : TV;
  n : byte;

begin
  assign(tarjetas, 'Tarjetas.dat');
  assign(rechazados, 'Rechazados.dat');
  cargaTarjetas(tarjetas);
  listarTarjetas(tarjetas);
  generarV(tarjetas,v,n);
  procesarArchivo(tarjetas, rechazados,v, n);
  writeln();
  writeln();
  writeln();
  writeln();
  writeln('Actualizaciones');
  listarTarjetas(tarjetas);
  readln();
end.

