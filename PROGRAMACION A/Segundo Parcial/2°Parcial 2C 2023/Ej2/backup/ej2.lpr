program ej2;
const
     maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of word;
  TV = array[1..maxElem] of word;

procedure leerMatrizVector (var mat : TM; var vec : TV; var n, m : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n, m);
  while not eof(archE) do
  begin
      for i := 1 to n do
          read(archE, vec[i]);
      readln(archE);
      for i := 1 to n do
      begin
          for j := 1 to m do
              read(archE, mat[i,j]);
          readln(archE);
      end;
  end;
  close(archE);
end;

function verifica (mat : TM; vec : TV; i, j : byte):boolean;
begin
  if j = 0 then
     verifica := true
  else
    if mat[i,j] mod vec[i] then
       verifica := verifica(mat,vec,i, j - 1)
    else
      verifica := false;
end;

function fila (mat : TM; vec : TV; n, m : byte):byte;
begin
  if n > 0 then
     if verifica(mat,vec,n,m) then
        fila := 1 + fila(mat,vec,n - 1, m)
     else
       fila := fila(mat,vec,n - 1, m)
  else
       fila := 0;
end;

var
  mat : TM;
  vec : TV;
  n, m : byte;
begin
  leerMatrizVector(mat,vec,n,m);
  writeln(fila(mat,vec,n,m));
  readln();
end.

