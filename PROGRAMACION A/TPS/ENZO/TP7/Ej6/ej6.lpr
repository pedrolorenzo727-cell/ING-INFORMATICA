program ej6;
const
  maxElem = 10;

type
  TRegInfo = record
    i, j : byte;
    valor : integer;
  end;
  TV = array[1..maxElem] of TRegInfo;

procedure leerVectores (var v1,v2 : TV; var k1,k2 : byte; var n,m : byte);
var
   archE : text;
   i : byte;
begin
     assign(archE, 'Entrada.txt');
     reset(archE);
     readln(archE, n,m);
     readln(archE, k1);
     for i := 1 to k1 do
         with v1[i] do
              readln(archE, i,j,valor);
     readln(archE, k2);
    for i := 1 to k2 do
        with v2[i] do
             readln(archE, i,j,valor);
    close(archE);
end;

function busc (v : TV; k : byte; fil, col : byte):integer;
var
    l: byte;
    aux : integer;
begin
    l := 1;
    while (l <= k ) and ((v[l].i <> fil) or (v[l].j <> col)) do
        l := l + 1;
    if l <= k then
        aux := v[l].valor
    else
        aux := 0;
    busc := aux;
end;

procedure mostrarMatriz (v : TV; k, n, m : byte);
var
    i, j : Byte;
begin
    for i := 1 to n do
    begin
        for j := 1 to m do
            write(busc(v,k,i,j):4);
        writeln();
    end;
end;

procedure sumarMatrices (v1, v2 : TV; k1,k2,n,m : byte);
var
    i, j : byte;
begin
    for i := 1 to n do
    begin
        for j := 1 to m do
            write(busc(v1,k1,i,j) + busc(v2,k2,i,j):4);
        writeln();
    end;
end;

var
    v1, v2 : TV;
    n, m, k1, k2 : byte;
begin
  leerVectores(v1,v2,k1,k2,n,m);
  mostrarMatriz(v1,k1,n,m);
  writeln();
  mostrarMatriz(v2,k2,n,m);
  writeln();
  sumarMatrices(v1,v2,k1,k2,n,m);
  readln();
end.

