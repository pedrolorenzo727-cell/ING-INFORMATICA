program ej7;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;

procedure leerMatriz (var mat : TM; var n: byte);
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
end;

function min (mat : TM; i, j, n : byte):integer;
var
  aux : integer;
begin
  if (i = 1) and (j = 1) then
     min := mat[i,j]
  else
     if j > 1 then
     begin
       aux := min(mat, i, j - 1, n);
       if mat[i,j] < aux then
          min := mat[i,j]
       else
          min := aux;
     end
     else
     begin
         aux := min(mat,i - 1, n, n);
         if mat[i,j] < aux then
            min := mat[i,j]
         else
             min := aux;
     end;
end;

(*Metodo mas eficiente?*)
function min (mat : TM; i, j, n : byte):integer;
var
  aux : integer;
begin
  if (i = 1) and (j = 1) then
     min := mat[i,j]
  else
      begin
      if j > 1 then
         aux := min(mat,i, j - 1, n)
      else
          aux := min(mat, i - 1, n, n);
      if mat[i,j] < aux then
         min := mat[i,j]
      else
          min := aux;
      end;
end;

procedure mostrarMatriz (mat : TM; n : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
      for j := 1 to n do
          write(mat[i,j]:4);
      writeln();
  end;
end;

var
  mat : TM;
  n: byte;
begin
  leerMatriz(mat,n);
  mostrarMatriz(mat,n);
  writeln();
  writeln(min(mat,n,n,n));
  readln();
end.

