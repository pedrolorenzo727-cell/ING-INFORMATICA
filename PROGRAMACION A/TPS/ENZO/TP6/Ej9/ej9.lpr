program ej9;
const
  maxElem = 100;

type
    TM1 = array[1..maxElem, 1..maxElem] of char;
    TM2 = array[1..maxElem, 1..maxElem] of byte;

procedure leerMatrices (var T1 : TM1; var T2 : TM2; var n : byte);
var
  archE : text;
  i, j : byte;
  car : char;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n);
  for i := 1 to n do
  begin
    for j := 1 to n do
        read(archE, T1[i,j], T2[i,j], car);
    readln(archE);
  end;
end;

function comparar (contA, contR : byte):char;
begin
    if contA > contR then
     comparar := 'A'
  else
    if contR > contA then
       comparar := 'R'
    else
      comparar := 'I';
end;

function colorPredom (T1 : TM1; n : byte):char;
var
  i, j, contR, contA : byte;
begin
  contR := 0;
  contA := 0;
  for i := 1 to n do
      for j := 1 to n do
          if T1[i,j] = 'R' then
             contR := contR + 1
          else
            contA := contA + 1;
  colorPredom := comparar(contA,contR);
end;

function colorMasFi (T1 : TM1; T2 : TM2; n : byte):char;
var
  i, j, contR, contA : byte;
begin
  contR := 0;
  contA := 0;
  for i := 1 to n do
      for j := 1 to n do
          if T1[i,j] = 'R' then
             contR := contR + T2[i,j]
          else
            contA := contA + T2[i,j];
  colorMasFi := comparar(contA,contR);
end;

function soloColor (T1 : TM1; n, j : byte):boolean;
var
   i : byte;
   color : char;
begin
  color := T1[1,j];
  i := 2;
  while (i <= n) and (T1[i,j] = color) do
        i := i + 1;
  soloColor := i > n;
end;

function cantColum (T1 : TM1; n : byte):byte;
var
  j, cont : byte;
begin
  cont := 0;
  for j := 1 to n do
      if soloColor(T1,n,j) then
         cont := cont + 1;
  cantColum := cont;
end;

procedure mostrarMatriz1 (T1 : TM1; n : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
      for j := 1 to n do
          write(T1[i,j]:4);
      writeln();
  end;
end;

procedure mostrarMatriz2 (T2 : TM2; n : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
      for j := 1 to n do
          write(T2[i,j]:4);
      writeln();
  end;
end;

var
  T1 : TM1;
  T2 : TM2;
  n : byte;
  colorP, colorM : char;

begin
  leerMatrices(T1,T2,n);
  mostrarMatriz1(T1, n);
  writeln();
  mostrarMatriz2(T2,n);
  colorP := colorPredom(T1,n);
  if colorP = 'I' then
     writeln('Ambas fichas tienen la misma cantidad de casillas')
  else
    writeln('Color con mas casillas: ', colorP);
  colorM := colorMasFi(T1,T2,n);
  if colorM = 'I' then
     writeln('Ambas fichas tienen la misma cantidad de fichas')
  else
    writeln('Color con mas casillas: ', colorM);
  writeln('Cantidad de columnas con un solo color: ', cantColum(T1,n));
  readln();
end.
