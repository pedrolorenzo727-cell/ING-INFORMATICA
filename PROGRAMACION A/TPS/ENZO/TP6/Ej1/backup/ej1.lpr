program ej1;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;
  TV = array[1..maxElem] of integer;

procedure leerMatriz (Var mat : TM; var n, m : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n, m);
  for i := 1 to n do
  begin
      for j := 1 to m do
          read(archE, mat[i,j]);
      readln(archE);
  end;
  close(archE);
end;

function maxFila (mat : TM; i : byte; m : byte):integer;
var
  j : byte;
  max : integer;
begin
  max := -9999;
  for j := 1 to m do
      if mat[i,j] > max then
         max := mat[i,j];
  maxFila := max;
end;

procedure generarVMaxFila (var VMaxFila : TV; mat : TM; n, m : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
      VMaxFila[i] := maxFila(mat,i,m);
end;

procedure mostrarVector(V : TV; n : byte);
var
  i : byte;
begin
  for i := 1 to n do
      write(V[i], ' ');
  writeln();
end;

function sumaImpares (mat : TM; n, j : byte):integer;
var
  i : byte;
  sum : integer;
begin
  sum := 0;
  for i := 1 to n do
      if mat[i,j] mod 2 <> 0 then
         sum := sum + mat[i,j];
  sumaImpares := sum;
end;

procedure generarVSumImp (var VSumImp : TV; var k : byte; mat : TM; n, m : byte);
var
  j : byte;
  sum : integer;
begin
  k := 0;
  sum := 0;
  for j := 1 to m do
  begin
      sum := sumaImpares(mat,n,j);
      if sum <> 0 then
      begin
        k := k + 1;
        VSumImp[k] := sum;
      end;
  end;
end;

function promC (mat : TM; n, x : byte):real;
var
  i : byte;
  sum : integer;
begin
  sum := 0;
  for i := 1 to n do
      sum := sum + mat[i,x];
  promC := sum/n;
end;

var
  mat : TM;
  VMaxFila, VSumImp : TV;
  n, m, k, x : byte;
begin
  leerMatriz(mat,n,m);
  generarVMaxFila(VMaxFila,mat,n,m);
  mostrarVector(VMaxFila, n);
  generarVSumImp(VSumImp, k, mat, n, m);
  mostrarVector(VSumImp,k);
  writeln('Ingrese X');
  readln(x);
  writeln(promC(mat,n,x):4:2);
  writeln((5 <= 5));
  readln();
end.

