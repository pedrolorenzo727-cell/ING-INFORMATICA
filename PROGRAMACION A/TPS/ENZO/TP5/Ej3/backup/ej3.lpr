program ej3;
const
  maxElem = 20;
type
  TV = array[1..maxElem] of integer;

procedure leerVector (Var v : TV; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof (archE) do
  begin
    n := n + 1;
    read(archE, v[n]);
  end;
  close(archE);
end;

procedure cambiarK (var v : TV; n : byte; k : integer);
var
  i : byte;
begin
  for i := 1 to n do
      if v[i] = k then
         v[i] := k;
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
  v : TV;
  n : byte;
  k : integer;
begin
  leerVector(v,n);
  mostrarVector(v,n);
  writeln('Ingrese K');
  readln(k);
  cambiarK(v,n,k);
  mostrarVector(v,n);
  readln();
end.

