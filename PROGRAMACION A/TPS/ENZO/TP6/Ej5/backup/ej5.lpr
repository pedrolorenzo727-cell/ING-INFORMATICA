program ej5;
const
  maxElem = 100;

type
  ST4 = string[4];
  TM = array[1..maxElem, 1..maxElem] of real;
  TV = array[1..maxElem] of ST4;

function buscCod (NroCli : TV; n : byte; codigo : ST4):byte;
var
  i : byte;
begin
  i := 1;
  while (i <= n) and (NroCli[i] <> codigo) do
        i := i + 1;
  if i <= n then
     buscCod := i
  else
    buscCod := 0;
end;

procedure iniciaMatriz (var compras : TM);
var
  i, j : byte;
begin
  for i := 1 to maxElem do
      for j := 1 to maxElem do
          compras[i,j] := 0;
end;

procedure leerVectorMatriz (var NroCli : TV; var compras : TM; var n, m : byte);
var
  archE : text;
  codigo : ST4;
  tipo, pos : byte;
  monto : real;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  m := 4;
  iniciaMatriz(compras);
  while not eof(archE) do
  begin
    readln(archE, codigo, tipo, monto);
    pos := buscCod(NroCli, n, codigo);
    if pos = 0 then
    begin
      n := n + 1;
      NroCli[n] := codigo;
      compras[n,tipo] := compras[n,tipo] + monto;
    end
       else
           compras[pos,tipo] := compras[pos,tipo] + monto;
  end;
  close(archE);
end;

procedure mostrarVectorMatriz(NroCli : TV; compras : TM; n, m : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
    write(NroCli[i]);
    for j := 1 to m do
        write(compras[i,j]:10:2);
    writeln();
  end;
end;

function nombrar (j : byte):string;
begin
  case j of
       1 : nombrar := 'Supermercado';
       2 : nombrar := 'Combustible';
       3 : nombrar := 'Indumentaria';
       4 : nombrar := 'Otros';
  end;
end;

function suma (compras : TM; n, j : byte):real;
var
  i : byte;
  sum : real;
begin
     sum := 0;
     for i := 1 to n do
         sum := sum + compras[i,j];
     suma := sum;
end;

procedure totalRubro (compras : TM; n, m : byte);
var
  j : byte;
begin
   for j := 1 to m do
       writeln('Total en ', nombrar(j), ': $', suma(compras,n,j):4:2);
end;

procedure generarSupMasInd (var supMasInd : TV; var k : byte; NroCli : TV; compras : TM; n, m : byte);
var
  i, j : byte;
begin
  k := 0;
  for i := 1 to n do
      if compras[i,1] > compras[i,3] then
      begin
        k := k + 1;
        supMasInd[k] := NroCli[i];
      end;
end;

procedure mostrarVector (supMasInd : TV; k : byte);
var
  i : byte;
begin
  for i := 1 to k do
      write(supMasInd[i], ' ');
end;

function totalCliente (compras : TM; i, m : byte):real;
var
  j : byte;
  sum : real;
begin
  sum := 0;
  for j := 1 to m do
      sum := sum + compras[i,j];
  totalCliente := sum;
end;

function promCompra (compras : TM; n, m : byte):real;
var
  i : byte;
  sum : real;
begin
  sum := 0;
  for i := 1 to n do
      sum := sum + totalCliente(compras, i, m);
  promCompra := sum/n;
end;

function cliMasCon (NroCli : TV; compras : TM; n, m : byte):ST4;
var
  i, posMax : byte;
  max, monto : real;
begin
  max := -999999;
  for i := 1 to n do
  begin
       monto := totalCliente(compras,i,m);
       if monto > max then
       begin
          max := monto;
          posMax := i;
       end;
  end;
  cliMasCon := NroCli[posMax];
end;

function noRegCom (compras : TM; i, m):boolean;
var
  j : byte;
begin
  j := 1;
  while (j <= m) and (compras[i,j] <> 0) do
        j := j + 1;
  noRegCom := j <= m;
end;

function cantNoRegCom (compras : TM; n, m):byte;
var
  i, cont : byte;
begin
  cont := 1;
  for i := 1 to n do
      if noRegCom then
         cont := cont + 1;
end;

var
  NroCli, supMasInd : TV;
  compras : TM;
  n , m, k : byte;
begin
     leerVectorMatriz(NroCli,compras,n,m);
     mostrarVectorMatriz(NroCli,compras,n,m);
     writeln();
     writeln('Total en cada rubro');
     totalRubro(compras,n,m);
     generarSupMasInd(supMasInd,k,NroCli,compras,n,m);
     writeln();
     writeln('Clientes que supermercado supero indumentaria');
     mostrarVector(supMasInd,k);
     writeln();
     writeln();
     writeln('Promedio de compra por cliente: $', promCompra(compras,n,m):4:2);
     writeln();
     writeln('Cliente que mas consumio: ', CliMasCon(NroCli, compras, n ,m));
     readln();
end.

