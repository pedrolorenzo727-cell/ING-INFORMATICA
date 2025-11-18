program ej3;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;

procedure leerMatriz (var mat : TM; var n, y : byte);
var
  archE : text;
  j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, y);
  n := 0;
  while not eof(archE) do
  begin
       n := n + 1;
       for j := 1 to y do
           read(archE, mat[n,j]);
       readln(archE);
       if mat[n,1] <> 0 then
       begin
          if mat[n,y] mod mat[n,1] <> 0 then
             n := n - 1;
       end
       else
           n := n - 1;
  end;
  close(archE);
end;

procedure mostrarMatriz (mat : TM; n, y : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
       for j := 1 to y do
           write(mat[i,j]:4);
       writeln();
  end;
end;

var
  mat : TM;
  n, y : byte;

begin
  leerMatriz(mat,n,y);
  mostrarMatriz(mat,n,y);
  readln();
end.

