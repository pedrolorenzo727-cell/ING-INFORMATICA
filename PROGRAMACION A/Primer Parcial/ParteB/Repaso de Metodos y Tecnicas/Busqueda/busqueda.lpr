program busqueda;

uses unit1;

const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure leerVector (var v : TV; var n : byte);
var
  i : byte;
begin
     readln(n);
     for i := 1 to n do
         readln(v[i])
end;

function buscPos (v : TV; n : byte; x : integer):byte;
var
  i : byte;
begin
  i := 1;
  while (i <= n) and (v[i] <> x) do
        i := i + 1;
  if i <= n then
     buscPos := i
  else
    buscPos := 0;
end;

var
  v : TV;
  n, pos : byte;
  x : integer;
begin
  leerVector(v,n);
  readln(x);
  pos := buscPos(v,n, x);
  if pos = 0 then
     writeln('Elemento no escontrado en el arreglo')
  else
    writeln('Elemento encontrado');
  readln();
end.

