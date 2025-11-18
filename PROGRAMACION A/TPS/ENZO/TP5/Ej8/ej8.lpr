program ej8;
const
  maxElem = 10;

type
  TV = array[1..maxElem] of word;

procedure leerVector (var v1 : TV; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    read(archE, v1[n]);
  end;
  close(archE);
end;

procedure generarW (var w : TV; var k : byte; v1 : TV; n : byte);
var
  i, fr : byte;
begin
     fr := 1;
     k := 0;
     for i := 1 to n - 1 do
         if v1[i] = v1[i + 1] then
            fr := fr + 1
         else
           begin
             k := k + 1;
             w[k] := fr;
             fr := 1;
           end;
     k := k + 1;
     w[k] := fr;
end;

procedure mostrarVector (w : TV; k : byte);
var
  i : byte;
begin
  for i := 1 to k do
      write(w[i], ' ');
  writeln();
end;

var
  v1, w : TV;
  n, k : byte;
begin
  leerVector(v1,n);
  generarW(w,k,v1,n);
  mostrarVector(w,k);
  readln();
end.

