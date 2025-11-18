program insertaelementoordenado;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure insertaOrdenado (var V : TV; var n : byte; x : integer);
var
  i : byte;
begin
  i := n;
  while (i > 0) and (V[i] > x) do
  begin
        V[i + 1] := V[i];
        i := i - 1;
  end;
  V[i + 1] := x;
  n := n + 1;
end;

procedure leerVector (var V : TV; var n : byte);
var
  archE : text;
  x : integer;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 1;
  read(archE, V[n]);
  while not eof(archE) do
  begin
        read(archE, x);
        insertaOrdenado(V,n,x);
  end;
  close(archE);
end;

procedure mostrarVector (V : TV; n : byte);
var
  i : byte;
begin
  for i := 1 to n do
      write(V[i], ' ');
end;

var
  V : TV;
  n : byte;
begin
  leerVector(V,n);
  mostrarVector(V,n);
  readln();
end.

