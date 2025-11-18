program ej2;
const
  maxElem = 10;
type
  TV = array[1..maxElem] of integer;

procedure leerVectores (var V, W : TV; var n, m : byte);
var
  archE : text;
  aux : integer;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  m := 0;
  while not eof(archE) do
  begin
      read(archE, aux);
      if aux mod 2 = 0 then
      begin
         if aux <> 0 then
         begin
              m := m + 1;
              V[m] := aux;
         end
      else
          begin
               n := n + 1;
               W[n] := aux;
          end;
  end;
  close(archE);
end;

procedure mostrarVector (t : TV; l : byte);
var
  i : byte;
begin
  for i := 1 to l do
      write(t[i], ' ');
  writeln();
end;

var
  V, W : TV;
  n, m : byte;
begin
  leerVectores(V,W,n,m);
  writeln('Vector pares');
  mostrarVector(V,n);
  writeln('Vector impares');
  mostrarVector(W,m);
  readln();
end.

