program triangularsupeior;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;

procedure leerMatriz (var mat : TM; var n : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE,'Entrada.txt');
  reset(archE);
  readln(archE, n);
  for i := 1 to n do
  begin
      for j := 1 to n do
          read(archE, mat[i,j]);
      readln(archE);
  end;
end;

procedure mostrarTriangularSuperior (mat : TM; i, j, n: byte);
begin
  if i > 0 then
     if j > i then
     begin
       mostrarTriangularSuperior(mat, i, j - 1, n);
       write(mat[i,j]:4);
     end
     else
     begin
         mostrarTriangularSuperior(mat, i - 1, n, n);
         writeln();
     end;
end;

function max (mat : TM; i, j, n : byte):integer;
var
  maximo : integer;
begin
  if (i = 1) and (j = 2) then
     max := mat[i,j]
  else
  begin
    if j > i + 1 then
       maximo := max(mat, i, j - 1, n)
    else
      maximo := max(mat, i - 1, n, n);
    if mat[i,j] > maximo then
       max := mat[i,j]
    else
        max := maximo;
  end;
end;

var
  mat : TM;
  n : byte;

begin
  leerMatriz(mat,n);
  mostrarTriangularSuperior(mat,n - 1, n, n);
  writeln(max(mat, n - 1, n, n));
  readln();
end.

