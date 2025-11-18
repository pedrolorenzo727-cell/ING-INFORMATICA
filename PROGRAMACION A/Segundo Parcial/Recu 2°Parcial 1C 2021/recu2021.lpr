program recu2021;
const
  maxElem = 100;

type
  ST4 = string[4];
  ST10 = string[10];
  TRegC = record
    combustible : ST10;
    importe : real;
  end;
  TVC = array[1..maxElem] of TRegC;
  TVS = array[1..maxElem] of ST4;
  TM = array[1..maxElem, 1..maxElem] of real;
  TRegSupX = record
    codigo : ST4;
    tipo : ST10;
  end;
  TVSupX = array[1..maxElem] of TRegSupX;
  TVReal = array[1..maxElem] of real;

procedure leerVC (var VC : TVC; var m : byte);
var
  archE : text; i : byte;
begin
  assign(archE, 'Combustible.txt');
  reset(archE);
  readln(archE, m);
  for i := 1 to m do
      with VC[i] do
           readln(archE, combustible, importe);
  close(archE);
end;

procedure leerVentas (var ventas : TM; var surtidores : TVS; var n : byte; m : byte);
var
  archE : text; i : byte;
begin
  assign(archE, 'Ventas.txt');
  reset(archE);
  n := 0;
  while not eof (archE) do
  begin
    n := n + 1;
    read(archE, surtidores[n]);
    for i := 1 to m do
        read(archE, ventas[n,i]);
    readln(archE);
  end;
  close(archE);
end;

function buscCod (surtidores : TVS; n : byte; cod : ST4):byte;
begin
  if n = 0 then
     buscCod := 0
  else
    if surtidores[n] = cod then
       buscCod := n
    else
      buscCod := buscCod(surtidores,n - 1,cod);
end;

function posMaxFila (ventas : TM; i, j : byte):byte;
var
  posMax : byte;
begin
  if j = 1 then
     posMaxFila := 1
  else
    begin
      posMax := posMaxFila(ventas, i, j - 1);
      if ventas[i,j] > ventas[i,posMax] then
         posMaxFila := j
      else
        posMaxFila := posMax;
    end;
end;

function totalVendido (ventas : TM; i, j, m : byte):real;
begin
  if (i = 1) and (j = 1) then
     totalVendido := ventas[1,1]
  else
    if j > 1 then
       totalVendido := ventas[i,j] + totalVendido(ventas, i, j - 1, m)
    else
      totalVendido := ventas[i,j] + totalVendido(ventas, i - 1, m, m);
end;

function sumaColumna (ventas : TM; i, j : byte):real;
begin
  if i = 1 then
     sumaColumna := ventas[i,j]
  else
      sumaColumna := ventas[i,j] + sumaColumna(ventas,i - 1,j);
end;

procedure generarTotTipoC (ventas : TM; n, m : byte; VC : TVC; var totTipoC : TVReal);
var
  j : byte;
  total : real;
begin
  for j := 1 to m do
      totTipoC[j] := sumaColumna(ventas,n,j)*VC[j].importe;
end;

procedure porc (totTipoC : TVReal; m : byte; VC : TVC);
var
  j : byte;
  tot : real;
begin
  tot := 0;
  for j := 1 to m do
      tot := tot + totTipoC[j];
  for j := 1 to m do
      writeln(VC[j].combustible, ':', totTipoC[j]*100/tot :4:2);
end;

procedure generarSupX (var supX : TVSupX; var k : byte; surtidores : TVS; VC : TVC; ventas : TM; n, m : byte; x : real);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
    j := 1;
    while (j <= m) and (ventas[i,j] <= x) do
       j := j + 1;
    if j <= m then
    begin
      k := k + 1;
      supX[k].codigo := surtidores[i];
      supX[k].tipo := VC[j].combustible;
    end;
  end;
end;

procedure mostrarVector (supX : TVSupX; k : byte);
var
  i : byte;
begin
  for i := 1 to k do
      writeln(supX[i].codigo, ',', supX[i].tipo);
end;

var
  VC : TVC;
  surtidores : TVS;
  ventas : TM;
  totTipoC : TVReal;
  supX : TVSupx;
  n, m, pos, k : byte;
  cod : ST4;
  x : real;

begin
  leerVC(VC,m);
  leerVentas(ventas,surtidores,n,m);
  writeln('Ingrese un codigo');
  readln(cod);
  pos := buscCod(surtidores,n,cod);
  if pos = 0 then
     writeln('No existe el surtidor')
  else
    writeln('Combustible que mas litros vendio por ', cod, ': ', VC[posMaxFila(ventas,pos,m)].combustible);
  generarTotTipoC(ventas,n,m,VC,totTipoC);
  porc(totTipoC,m,VC);
  writeln('Ingrese X');
  readln(x);
  generarSupX(supX,k,surtidores,VC,ventas,n,m,x);
  mostrarVector(supX, k);
  readln();
end.

