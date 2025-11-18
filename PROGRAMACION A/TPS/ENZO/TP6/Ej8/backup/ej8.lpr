program ej8;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of byte;
  TV = array[1..maxElem] of integer;

procedure leerVector (var VConj : TV; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    read(archE, VConj[n]);
  end;
  close(archE);
end;

procedure generarMatriz (var matR : TM; VConj : TV; n : byte);
var
  i, j : byte;
begin
     for i := 1 to n do
         for j := 1 to n do
             if VConj[j] mod VConj[i] = 0 then
                matR[i,j] := 1
             else
                 matR[i,j] := 0;
end;

procedure mostrarMatriz (matR : TM; n : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
      for j := 1 to n do
          write(matR[i,j]:4);
      writeln();
  end;
end;

function esRef (matR : TM; n : byte):boolean;
var
  i: byte;
begin
   i := 1;
   while (i <= n) and (matR[i,i] = 1) do
         i := i + 1;
   esRef := i > n;
end;

function esSim (matR : TM; n : byte):boolean;
var
  i, j, cont: byte;
begin
  cont := 0;
  i := 1;
  j := 1;
  while (i <= n) and (matR[i,j] = matR[j,i]) do
  begin
        if j < n then
           j := j + 1
        else
            begin
              j := i + 1; (*Al hacer esto me ahorro varias pasadas*)
              i := i + 1;
            end;
        cont := cont + 1;
  end;
  writeln(cont);
  esSim := i > n;
end;

var
  VConj : TV;
  matR : TM;
  n, m : byte;

begin
  leerVector(VConj, n);
  generarMatriz(matR,VConj,n);
  mostrarMatriz(matR,n);
  if esRef(matR,n) then
     writeln('Es reflexiva')
  else
      writeln('Es simetrica');
  if esSim(matR,n) then
     writeln('Es simetrica')
  else
      writeln('No es simetrica');
  readln();
end.

