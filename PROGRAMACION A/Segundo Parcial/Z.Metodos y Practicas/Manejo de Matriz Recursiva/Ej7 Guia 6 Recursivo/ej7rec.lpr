program ej7rec;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of word;
  TV = array[1..maxElem] of word;

procedure iniciaMatriz (var mat : TM; i, j, m : byte);
begin
  if i > 0 then
  begin
     if j > 1 then
        iniciaMatriz(mat, i, j - 1, m)
     else
       iniciaMatriz(mat, i - 1, m, m);
     mat[i,j] := 0;
  end;
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
  iniciaMatriz(PS,n,m,m);
  iniciaMatriz(PB,n,m,m);
  while not eof(archE) do
  begin
       readln(archE, i,j,cantS,cantB);
       PS[i,j] := PS[i,j] + cantS;
       PB[i,j] := PB[i,j] + cantB;
  end;
  close(archE);
end;

function sumaFila (mat : TM; i, j : byte):word;
begin
  if j = 1 then
     sumaFila := mat[i,j]
  else
    sumaFila := mat[i,j] + sumaFila(mat, i, j - 1);
end;

procedure generarVectores(PS, PB : TM; n, m : byte; var totS, totB : TV);
begin
  if n > 0 then
  begin
     totS[n] := sumaFila(PS, n, m);
     totB[n] := sumaFila(PB, n, m);
     generarVectores(PS, PB, n - 1, m, totS, totB);
  end;
end;

function paradaMaxB (totS : TV; n: byte):byte;
var
  posMax : byte;
begin
  if n = 1 then
     paradaMaxB := n
  else
  begin
    posMax := paradaMaxB(totS, n - 1);
    if totS[n] > totS[posMax] then
       paradaMaxB := n
    else
      paradaMaxB := posMax;
  end;
end;

function sumaColumna (mat : TM; i, j : byte):word;
begin
    if i = 1 then
       sumaColumna := mat[i,j]
    else
        sumaColumna := mat[i,j] + sumaColumna(mat, i - 1, j);
end;

procedure generarVectorLinea(PS : TM; n, m : byte; var totSL : TV);
begin
  if m > 0 then
  begin
     totSL[m] := sumaColumna(PS, n, m);
     generarVectorLinea(PS, n , m - 1, totSL);
  end;
end;

function lineaMinS (totSL : TV; m: byte):byte;
var
  posMin : byte;
begin
  if m = 1 then
     lineaMinS := m
  else
  begin
    posMin := lineaMinS(totSL, m - 1);
    if totSL[m] < totSL[posMin] then
       lineaMinS := m
    else
      lineaMinS := posMin;
  end;
end;

function cantParadas (totS, totB : TV; n : byte):byte;
begin
  if n > 0 then
     if totS[n] < totB[n]*0.4 then
        cantParadas := 1 + cantParadas(totS,totB,n - 1)
     else
         cantParadas := cantParadas(totS, totB, n - 1)
  else
      cantParadas := 0;
end;

function buscCero (PS, PB : TM; n, j : byte):boolean;
begin
  if n = 0 then
     buscCero := false
  else
      if (PS[n,j] = 0) or (PB[n,j] = 0) then
         buscCero := true
      else
          buscCero := buscCero(PS,PB, n - 1, j);

end;

function cantLineas (PS,PB : TM; n, m : byte):byte;
begin
  if m > 0 then
     if buscCero(PS,Pb,n,m) then
        cantLineas := 1 + cantLineas(PS,PB,n, m - 1)
     else
         cantLineas := cantLineas(PS,PB,n, m - 1)
  else
      cantLineas := 0;
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
  totS, totB, totSL : TV;
  n, m : byte;
begin
  leerMatrices(PS,PB,n,m);
  generarVectores(PS,PB,n,m,totS,totB);
  generarVectorLinea(PS,n,m,totSL);
  mostrarMatriz(PS,n,m);
  writeln();
  mostrarMatriz(PB,n,m);
  writeln('Parada con mas pasajeros que bajaron: ', paradaMaxB(totB,n));
  writeln('Linea con menos pasajeros que subieron: ', lineaMinS(totSL,m));
  writeln('Cantidad de paradas en las que subieron menos personas que el 40% de las que bajaron: ', cantParadas(totS,totB,n));
  writeln('Cantidad de lineas que no registraron subida o bajada de pasajeros en alguna parada: ', cantLineas(PS,PB,n,m));
  readln();
end.

