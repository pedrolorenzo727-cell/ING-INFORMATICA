program ej10;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure leerVector (var A : TV; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    read(archE, A[n]);
  end;
  close(archE);
end;

procedure generarBC (var B, C : TV; var k : byte; A : TV; n : byte);
var
   i, cont : byte;
   sum : integer;
begin
  k := 0;
  i := 1;
  while i <= n do
        if A[i] < 0 then
        begin
             sum := 0;
             cont := 0;
             i := i + 1;
             while (A[i] > 0) and (i <= n) do
             begin
                  sum := sum + A[i];
                  cont := cont + 1;
                  i := i + 1;
             end;
             if i <= n then
             begin
                  k := k + 1;
                  B[k] := sum;
                  C[k] := cont;
             end;
        end
        else
            i := i + 1;
end;

procedure mostrarVector(V : TV; n : byte);
var
   i : byte;
begin
  for i := 1 to n do
      write(V[i], ' ');
  writeln();
end;

var
   A, B, C : TV;
   n, k : byte;

begin
  leerVector(A,n);
  generarBC(B,C,k,A,n);
  mostrarVector(A,n);
  mostrarVector(B,k);
  mostrarVector(C,K);
  readln();
end.

