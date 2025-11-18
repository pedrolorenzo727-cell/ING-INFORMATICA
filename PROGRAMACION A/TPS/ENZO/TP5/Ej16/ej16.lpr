program ej16;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure leerVector (var v : TV; var n : byte);
var
  archE : text;
begin
  assign(archE,'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    read(archE, v[n]);
  end;
  close(archE);
end;

procedure Elimina(var v: TV; var n: byte; pos: byte);
var
  i: byte;
begin
  for i := pos to n - 1 do
    v[i] := v[i + 1];
  n := n - 1;
end;

procedure compactarVector(var v: TV; var n: byte);
var
  i: byte;
begin
  i := 1;
  while i <= n do
  begin
    if v[i] = 0 then
      Elimina(v, n, i)
    else
      i := i + 1;
  end;
end;

procedure mostrarVector(v : TV; n : byte);
var
  i : byte;
begin
  for i := 1 to n do
      write(v[i], ' ');
  writeln();
end;

var
  v : TV;
  n : byte;
begin
  leerVector(v,n);
  mostrarVector(v,n);
  compactarVector(v,n);
  mostrarVector(v,n);
  readln();
end.

