program ej4;
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

procedure generarB (var B : tv; var k : byte; v : TV; n : byte);
var
  i : byte;
begin
  k := 0;
  for i := 1 to n do
      if v[i] <> 0 then
      begin
        k := k + 1;
        B[k] := v[i]
      end;
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
   n, k : byte;
begin
  leerVector(v,n);
  mostrarVector(v,n);
  generarB(B,k,v,n);
  mostrarVector(B,k);
  readln();
end.

