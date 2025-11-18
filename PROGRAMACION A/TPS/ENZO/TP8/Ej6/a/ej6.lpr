program ej6a;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure leerVector (var V: TV; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof (archE) do
  begin
    n := n + 1;
    read(archE, V[n]);
  end;
end;

function busc (V : TV; n : byte; x : integer):byte;
begin
  if n = 0 then
     busc := 0
  else
    if V[n] = x then
       busc := n
    else
      busc := busc(V,n - 1,x);
end;

var
  V : TV;
  n : byte;
  x : integer;

begin
  leerVector(V,n);
  readln(x);
  writeln(busc(V,n,x));
  readln();
end.

