program ej12;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;

procedure leerMatriz (var A : TM; var n : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n);
  for i := 1 to n do
  begin
      for j := 1 to n do
          read(archE,A[i,j]);
      readln(archE);
  end;
  close(archE);
end;

procedure verificarA (A : TM; i,j,n : byte; var sum : integer; var valor : boolean);
begin
  if i = 0 then
     valor := true
  else
    if j = 0 then
       if A[i,i] < sum then
          valor := false
       else
         begin
              sum := 0;
              verificarA(A, i - 1, n, n, sum, valor);
         end
    else
         begin
              if j <> i then
                 sum := sum + A[i,j];
              verificarA(A, i, j - 1, n, sum, valor);
        end;
end;

procedure mostrarMatriz (A : TM; i,j,n : byte);
begin
  if i > 0 then
     if j > 0 then
     begin
          mostrarMatriz(A, i, j - 1, n);
          write(A[i,j]:4);
     end
     else
         begin
             mostrarMatriz(A, i - 1, n, n);
             writeln();
         end;
end;

var
  A : TM;
  n : byte;
  sum : integer;
  valor : boolean;

begin
  leerMatriz(A,n);
  mostrarMatriz(A,n,n,n);
  sum := 0;
  verificarA(A,n,n,n,sum,valor);
  writeln(valor);
  readln();
end.

