program ej4;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxELem] of integer;

procedure iniciaMatriz (var mat : TM);
var
   i, j : byte;
begin
  for i := 1 to maxElem do
      for j := 1 to maxElem do
          mat[i,j] := 0;
end;

procedure leerMatriz (var mat : TM; var n, m : byte);
var
   archE : text;
   fila, columna: byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  iniciaMatriz(mat);
  n := 0;
  m := 0;
  while not eof(archE) do
  begin
    read(archE, fila, columna);
    readln(archE, mat[fila,columna]);
    if fila > n then
       n := fila;
    if columna > m then
       m := columna;
  end;
end;

procedure mostrarMatriz (mat : TM; n, m : byte);
var
   i, j : byte;
begin
  for i := 1 to n do
  begin
      for j := 1 to m do
          write(mat[i,j]:4);
      writeln();
  end;
end;

function esTriInf (mat : TM; n, m : byte):boolean;
var
   i , j : byte;
begin
  i := 2;
  j := 1;
  while (i <= n) and (mat[i,j] = 0) do
        if j < i - 1 then
           j := j + 1
        else
          begin
            j := 1;
            i := i + 1;
          end;
  esTriInf := i <= n;
end;

var
   mat : TM;
   n, m : byte;

begin
  leerMatriz(mat,n,m);
  mostrarMatriz(mat,n,m);
  if n = m then
     if esTriInf(mat,n,m) then
        writeln('No es triangular inferior')
     else
       writeln('Es triangular inferior')
  else
    writeln('Matriz no cuadrada');
  readln();
end.

