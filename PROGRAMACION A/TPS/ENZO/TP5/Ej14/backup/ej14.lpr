program ej14;
const
  maxElem = 10;

type
  st7 = string[7];
  TV1 = array[1..maxElem] of st7;
  TV2 = array[1..maxElem] of real;

procedure leerVectores(var patentes : TV1; var recaudado : TV2; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    readln(archE, patentes[n], recaudado[n]);
  end;
  close(archE);
end;

function promedio (recaudado : TV2; n : byte):real;
var
  i : byte;
  sum : real;
begin
  sum := 0;
  for i := 1 to n do
      sum := sum + recaudado[i];
  promedio := sum/n;
end;

procedure patSupX (patentes : TV1; recaudado : TV2;  n : byte; x : real);
var
  i : byte;
begin
  for i := 1 to n do
      if recaudado[i] > x then
         writeln(patentes[i]);
end;

function patenteMenosRecaudo (patentes : TV1; recaudado : TV2; n : byte):st7;
var
  i : byte;
  min : real;
  patenteMin : st7;
begin
  min := 99999;
  for i := 1 to n do
      if recaudado[i] < min then
      begin
        min := recaudado[i];
        patenteMin := patentes[i];
      end;
  patenteMenosRecaudo := patenteMin;
end;

var
  patentes : TV1;
  recaudado : TV2;
  n : byte;
  x : real;
begin
  leerVectores(patentes,recaudado,n);
  writeln('Promedio recaudado: $', promedio(recaudado,n));
  writeln('Ingrese X');
  readln(x);
  writeln('Patentes que superaron ', X:4:2);
  patSupX(patentes,recaudado,n,x);
  writeln('La patente que menos recaudo fue: ', patenteMenosRecaudo(patentes,recaudado,n));
  readln();
end.

