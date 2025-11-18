program ej5;
const
  maxElem = 20;

type
  TV = array[1..maxElem] of integer;

procedure leerVector (var v : TV; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    read(archE, v[n]);
  end;
  close(archE);
end;

function max (v : TV; n : byte):integer;
var
  i : byte;
  maximo : integer;
begin
     maximo := -32000;
     for i := 1 to n do
         if v[i] > maximo then
            maximo := v[i];
     max := maximo;
end;

procedure generar (var B : TV; var k : byte; v : TV; n : byte);
var
  i : byte;
  maximo : integer;
begin
     k := 0;
     maximo := max(v,n);
     for i := 1 to n do
         if (v[i] <> 0) and (maximo mod v[i] = 0) then
         begin
             k := k + 1;
             B[k] := v[i];
         end;
end;

function prom (B : TV; k : byte):real;
var
  i : byte;
  sum : real;
begin
     sum := 0;
     for i := 1 to k do
         sum := sum + B[i];
     prom := sum/k
end;

procedure mostrarVector (v : TV; n : byte);
var
  i : byte;
begin
  for i := 1 to n do
      write(v[i], ' ');
  writeln();
end;

var
  v, B : TV;
  k, n : byte;
begin
  leerVector(v,n);
  mostrarVector(v,n);
  generar(B,k,v,n);
  mostrarVector(B,k);
  writeln('Promedio del vector ', prom(B,k):4:2);
  readln();
end.

