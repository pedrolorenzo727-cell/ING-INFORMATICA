program diagonalsecundaria;
const
  maxElem = 100;

type
  TM = array[!..maxElem,1..maxElem] of real;

procedure leerMatriz (var mat : TM; var n : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE,n);
  for i := 1 to n do
  begin
      for j := 1 to n do
          read(archE, mat[i,j]);
      readln(archE);
  end;
  close(archE);
end;

function sum (mat : TM; i, j : byte):real;
begin
  if i = 1 then
     sum := mat[i,j]
  else
    sum := mat[i,j] + sum(mat,i - 1, j + 1);
end;

var
  mat : TM;
  n : byte;

begin
  leerMatriz(mat,n);
  writeln(sum(mat,n,1):4:2);
  readln();
end.

