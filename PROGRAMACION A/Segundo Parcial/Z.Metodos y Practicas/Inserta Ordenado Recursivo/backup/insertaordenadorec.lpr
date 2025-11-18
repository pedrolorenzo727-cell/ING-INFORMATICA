program insertaordenadorec;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure insertaOrdenadoRec (var V : TV; var n : byte; i : byte; x : integer);
begin
  if i > 0 then
     if V[i] > x then
     begin
       V[i + 1] := V[i];
       insertaOrdenadoRec(V, n, i - 1, x);
     end
     else
     begin
         V[i + 1] := X;
         n := n + 1;
     end
  else
      begin
           V[i + 1] := x;
           n := n + 1;
      end;
end;

procedure leerVector (var V: TV; var n : byte);
var
  archE : text;
  x : integer;
  cont : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  while not eof (archE) do
  begin
    read(archE, x);
    insertaOrdenadoRec(V, n, cont, n, x);
  end;
end;

procedure mostrarVector (V : TV; n : byte);
begin
     if n > 0 then
     begin
          mostrarVector(V, n - 1);
          write(V[n], ' ');
     end;
end;

var
  V : TV;
  n : byte;
  x : integer;

begin
  leerVector(V,n);
  mostrarVector(V,n);
  readln();
end.

