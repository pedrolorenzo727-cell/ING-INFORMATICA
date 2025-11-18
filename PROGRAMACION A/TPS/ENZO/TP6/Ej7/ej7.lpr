program ej7;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of word;
  TV = array[1..maxElem] of word;

procedure iniciaMatriz (var mat : TM; n, m : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
      for j := 1 to m do
          mat[i,j] := 0;
end;

procedure leerMatrices (var PS : TM; var PB : TM; var n, m : byte);
var
  archE : text;
  i, j : byte;
  cantS, cantB : word;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n,m);
  iniciaMatriz(PS,n,m);
  iniciaMatriz(PB,n,m);
  while not eof(archE) do
  begin
       readln(archE, i,j,cantS,cantB);
       PS[i,j] := PS[i,j] + cantS;
       PB[i,j] := PB[i,j] + cantB;
  end;
  close(archE);
end;

function sumaFila (mat : TM; i, m : byte):word;
var
  j : byte;
  cant : word;
begin
  cant := 0;
  for j := 1 to m do
      cant := cant + mat[i,j];
  sumaFila := cant;
end;

procedure generarVectores(PS, PB : TM; n, m : byte; var totS, totB : TV);
var
  i : byte;
begin
  for i := 1 to n do
  begin
       totS[i] := sumaFila(PS,i,m);
       totB[i] := sumaFila(PB,i,m);
  end;
end;

function paradaMaxB (PB : TM; totS : TV; n, m : byte):byte;
var
  i, posMax : byte;
  max : word;
begin
  max := 0;
  for i := 1 to n do
       if totS[i] > max then
       begin
            max := totS[i];
            posMax := i;
       end;
  paradaMaxB := posMax;
end;

function sumaColumna (mat : TM; n, j : byte):word;
var
  i : byte;
  cant : word;
begin
  cant := 0;
  for i := 1 to n do
      cant := cant + mat[i,j];
  sumaColumna := cant;
end;

function lineaMinS (PS : TM; n, m : byte):byte;
var
  j, posMax : byte;
  min, totB : word;
begin
  min := 9999;
  for j := 1 to m do
  begin
      totB := sumaColumna(PS,n,j);
      if totB < min then
      begin
           min := totB;
           posMax := j;
      end;
  end;
  lineaMinS := posMax;
end;

function cantParadas (PS, PB : TM; totS, totB : TV; n, m : byte):byte;
var
  i, cant : byte;
begin
  cant := 0;
  for i := 1 to n do
  begin
      if totS[i] < totB[i]*0.4 then
         cant := cant + 1;
  end;
  cantParadas := cant;
end;

function buscCero (PS, PB : TM; n, j : byte):boolean;
var
  i : byte;
begin
  i := 1;
  while (i <= n) and (PS[i,j] <> 0) and (PB[i,j] <> 0) do
        i := i + 1;
  buscCero := i <= n;
end;

function cantLineas (PS, PB : TM; n, m : byte):byte;
var
  j, cant : byte;
begin
  cant := 0;
  for j := 1 to m do
      if buscCero(PS,PB,n,j) then
         cant := cant + 1;
  cantLineas := cant;
end;

procedure mostrarMatriz(mat : TM; n, m : byte);
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

var
  PS, PB : TM;
  totS, totB : TV;
  n, m : byte;
begin
  leerMatrices(PS,PB,n,m);
  generarVectores(PS,PB,n,m,totS,totB);
  mostrarMatriz(PS,n,m);
  writeln();
  mostrarMatriz(PB,n,m);
  writeln('Parada con mas pasajeros que bajaron: ', paradaMaxB(PB,totB,n,m));
  writeln('Linea con menos pasajeros que subieron: ', lineaMinS(PS,n,m));
  writeln('Cantidad de paradas en las que subieron menos personas que el 40% de las que bajaron: ', cantParadas(PS,PB, totS,totB,n,m));
  writeln('Cantidad de lineas que no registraron subida o bajada de pasajeros en alguna parada: ', cantLineas(PS,PB,n,m));
  readln();
end.

