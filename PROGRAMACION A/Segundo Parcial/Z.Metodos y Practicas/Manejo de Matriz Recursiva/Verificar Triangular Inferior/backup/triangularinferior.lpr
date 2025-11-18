program triangularinferior;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;

procedure leerMatriz (var mat : TM; var n, m : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE,n,m);
  for i := 1 to n do
  begin
      for j := 1 to m do
          read(archE, mat[i,j]);
      readln(archE);
  end;
  close(archE);
end;

function verificar (mat : TM; i, j: byte):boolean;
begin
  if i = 1 then
     verificar := true
  else
    if mat[i,j] = 0 then
       if j > 1 then
          verificar := verificar(mat, i, j - 1)
       else
         verificar := verificar(mat, i - 1, i - 2)
    else
         verificar := false;
end;

function max (mat : TM; i, j : byte):integer;
var
  maximo : integer;
begin
  if (i = 2) and (j = 1) then
     max := mat[i,j]
  else
  begin
     if j > 1 then
        maximo := max(mat, i, j - 1)
     else
       maximo := max(mat, i - 1, i - 2);
     if mat[i,j] > maximo then
        max := mat[i,j]
     else
       max := maximo;
  end;

end;

procedure mostrarVector (mat : TM; i, j, m : byte);
begin
  if i > 0 then
     if j > 0 then
     begin
       mostrarVector(mat, i, j - 1, m);
       write(mat[i,j]:4)
     end
     else
         begin
             mostrarVector(mat, i - 1, m , m);
             writeln();
         end;
end;

var
  mat : TM;
  n, m : byte;

begin
  leerMatriz(mat,n,m);
  mostrarVector(mat,n,m,m);
  writeln();
  writeln(verificar(mat,n,m - 1));
  writeln(max(mat,n, n - 1));
  readln();
end.

