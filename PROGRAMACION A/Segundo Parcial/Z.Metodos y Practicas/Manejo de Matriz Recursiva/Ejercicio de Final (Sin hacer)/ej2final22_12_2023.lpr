program ej2final22_12_2023;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of real;

procedure leerMatriz (var mat : TM; var n : byte);
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
          read(archE, mat[i,j]);
      readln(archE);
  end;
  close(archE);
end;

procedure mostrarMatriz (mat : TM; i, j, n : byte);
begin
  if i > 0 then
     if j > 0 then
     begin
       mostrarMatriz(mat, i, j - 1, n);
       write(mat[i,j]:8:1);
     end
     else
         begin
             mostrarMatriz(mat, i - 1, n, n);
             writeln();
             writeln();
         end;
end;

function verificar (mat : TM; i, j, n : byte):boolean;
begin
  if i = 0 then
     verificar := true
  else
    if j > 0 then
       if mat[i,j] > mat[i,i] then
          verificar := verificar(mat, i, j - 1, n)
       else
         verificar := false
    else
        verificar := verificar(mat, i - 1, i - 2, n);
end;

var
  mat : TM;
  n : byte;

begin
  leerMatriz(mat,n);
  mostrarMatriz(mat,n,n,n);
  writeln();
  writeln();
  writeln(verificar(mat,n, n - 1, n));
  readln();
end.

