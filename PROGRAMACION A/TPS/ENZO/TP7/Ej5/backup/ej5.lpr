program ej5;
const
  maxElem = 100;

type
  TregInfo = record
    i, j : byte;
    valor : integer;
  end;

  TV = array[1..maxElem] of TRegInfo;

procedure leerVector (var V : TV; var n, m, k : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n, m);
  k := 0;
  while not eof(archE) do
  begin
        k := k + 1;
        with V[k] do
             readln(archE, i,j,valor);
  end;
  close(archE);
end;

function busc (V : TV; k : byte; fil, col : byte):integer;
var
    l: byte;
    aux : integer;
begin
    l := 1;
    while (l <= k ) and ((V[l].i <> fil) or (V[l].j <> col)) do
        l := l + 1;
    if l <= k then
        busc := V[l].valor
    else
        busc := 0;
end;

procedure mostrarMatriz (V : TV; k, n, m : byte);
var
    i, j : Byte;
begin
    for i := 1 to n do
    begin
        for j := 1 to m do
            write(busc(V,k,i,j):4);
        writeln();
    end;
end;
procedure mostrarMatrizTraspuesta (V : TV; k, n, m : byte);
var
    i, j : Byte;
begin
    for i := 1 to n do
    begin
        for j := 1 to m do
            write(busc(V,k,j,i):4);
        writeln();
    end;
end;

var
    V : TV;
    n, m, k : byte;
begin
  leerVector(V,n,m,k);
  mostrarMatriz(V,k,n,m);
  writeln();
  mostrarMatrizTraspuesta(V,k,n,m);
  readln();
end.
