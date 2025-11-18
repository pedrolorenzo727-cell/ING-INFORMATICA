program parcial2020;
const
  maxElem = 100;
  m = 3;

type
  TReg = record
    cantM, cantN : byte;
  end;
  TM = array[1..maxElem, 1..maxElem] of TReg;  // Cambié el límite del segundo índice a 3 porque solo hay 3 promociones
  TVDias = array[1..maxElem] of byte;
  TV = array[1..m] of real;  // Vector de 3 elementos para las 3 promociones

const
  costos: TV = (700, 400, 500);  // Arreglo de costos
procedure iniciaMatriz (var mat : TM; i, j, m : byte);
begin
  if i > 0 then
  begin
     if j > 1 then
        iniciaMatriz(mat, i, j - 1, m)
     else
       iniciaMatriz(mat, i - 1, m, m);
     mat[i,j].cantM := 0;
     mat[i,j].cantN := 0;
  end;
end;

function buscDia (dias : TVDias; n, dia : byte):byte;
begin
  if n = 0 then
     buscDia := 0
  else
    if dias[n] = dia then
       buscDia := n
    else
      buscDia := buscDia(dias,n - 1,dia);
end;

procedure leerMatriz (var mat : TM; var VDias : TVDias; var n: byte; m : byte);
var
  archE : text;
  dia, i, cant, promo, pos : byte;
  turno, car : char;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);

  n := 0;
  iniciaMatriz(mat, maxElem, m, m);
  while not eof(archE) do
  begin
    read(archE,dia, car, turno, cant);
    (*Busco si tengo el dia*)
    pos := buscDia(VDias, n, dia);
    (*Si no lo tengo, lo añado y uso n como fila de la matriz*)
    if pos = 0 then
    begin
       n := n + 1;
       VDias[n] := dia;
       pos := n; (*Hago esto, porque tenga o no el dia, el for se hace igual*)
    end;

    for i := 1 to cant do
    begin
      read(archE, promo);
      if turno = 'M' then
         mat[pos,promo].cantM := mat[pos,promo].cantM + 1
      else
        mat[pos,promo].cantN := mat[pos,promo].cantN + 1;
    end;
    readln(archE);
  end;
  close(archE);
end;

procedure mostrarMatriz (mat : TM; i, j, m: byte);
begin
  if i > 0 then
     if j > 0 then
     begin
        mostrarMatriz(mat, i, j - 1, m);
        write(mat[i,j].cantM, ' ', mat[i,j].cantN);
        write('  ');
     end
     else
         begin
              mostrarMatriz(mat, i - 1, m, m);
              writeln();
         end;
end;

procedure mostrarVector (VDias : TVDias; n : byte);
begin
  if n > 0 then
  begin
     mostrarVector(VDias,n - 1);
     write(VDias[n]:4);
  end;
end;

function recDia (mat : TM; dia : byte; j : byte):real;
begin
  if j = 1 then
     recDia := mat[dia,j].cantM*costos[j] + mat[dia,j].cantN*costos[j]*1.1
  else
      recDia := mat[dia,j].cantM*costos[j] + mat[dia,j].cantN*costos[j]*1.1 + recDia(mat, dia, j - 1);
end;

function totProm (mat : TM; n, j : byte):real;
var
  i: byte;
  total: real;
begin
  total := 0;
  for i := 1 to n do
  begin
    total := total + mat[i,j].cantM*costos[j] + mat[i,j].cantN*costos[j]*1.1;
  end;
  totProm := total;
end;

procedure generarV (var V : TV; mat : TM; n, m : byte);
var
  j : byte;
begin
  for j := 1 to m do
  begin
    V[j] := totProm(mat,n,j);
  end;
end;

procedure mostrarVectorTot (V : TV; m : byte);
var
  i : byte;
begin
  for i := 1 to m do
      writeln('Promo ',i, ' ',V[i]:4:2)
end;

var
  mat : TM;
  VDias : TVDias;
  V : TV;
  n, dia, pos : byte;
begin
  leerMatriz(mat,VDias,n,m);
  writeln('Dias que registraron alguna compra');
  mostrarVector(VDias, n);
  writeln();
  mostrarMatriz(mat,n,m,m);
  writeln();
  writeln();

  writeln('Ingrese dia');
  readln(dia);
  pos := buscDia(VDias,n,dia);
  if pos = 0 then
     writeln('El dia no existe')
  else
    writeln('$',recDia(mat,pos,m):4:2);  // Aquí se usa la versión recursiva
  writeln();
  generarV(V,mat,n,m);
  mostrarVectorTot(V, m);
  readln();
end.

