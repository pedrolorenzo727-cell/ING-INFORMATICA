program ej2;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of string;
  TM = array[1..maxElem, 1..maxElem] of real;

procedure leerVectorMatriz (var Nbre : TV; var notas : TM; var n, k : byte);
var
  archE : text;
  j : byte;
begin
    assign(archE, 'Entrada.txt');
    reset(archE);
    n := 0;
    readln(archE, k);
    while not eof(archE) do
    begin
      n := n + 1;
      readln(archE, Nbre[n]);
      for j := 1 to k do
          read(archE, notas[n,j]);
      readln(archE);
    end;
    close(archE);
end;

function aprob (notas : TM; i, k : byte):boolean;
var
  j : byte;
begin
     j := 1;
     while (j <= k) and (notas[i,j] >= 5) do
           j := j + 1;
     aprob := j > k;
end;

procedure mostrarAprobados (Nbre : TV; notas : TM; n, k : byte);
var
  i, j : byte;
begin
    for i := 1 to n do
        if aprob(notas,i,k) then
           writeln(Nbre[i])
end;

function promedio (notas : TM; i, k : byte):real;
var
  j : byte;
  sum : real;
begin
    sum := 0;
    for j := 1 to k do
        sum := sum + notas[i,j];
    promedio := sum/k
end;

procedure generarVector (Nbre : TV; notas : TM; n, k : byte; var NbreP : TV; var l : byte);
var
  i, j : byte;
  prom: real;
begin
    l := 0;
    for i := 1 to n do
    begin
      prom := promedio(notas,i,k);
      if prom >= 7 then
      begin
        writeln(Nbre[i], ' Promociono');
        l := l + 1;
        NbreP[l] := Nbre[i];
      end
      else
          if (prom >= 5) and (notas[i,k] >= 5) then
             writeln(Nbre[i], ' Habilito')
          else
            writeln(Nbre[i], ' Desaprobo');
    end;
end;

procedure mostrarVector (NbreP : TV; l : byte);
var
  i : byte;
begin
    for i := 1 to l do
        write(NbreP[i], ' ');
    writeln();
end;

var
  Nbre, NbreP : TV;
  notas : TM;
  n, k, l : byte;
begin
  leerVectorMatriz(Nbre,notas,n,k);
  writeln('Alumnos que aprobaon todos los parciales');
  mostrarAprobados(Nbre,notas,n,k);
  writeln();
  writeln('Situacion de cada alumno');
  generarVector(Nbre, notas,n,k,NbreP,l);
  writeln();
  writeln('Alumnos Promocionados');
  mostrarVector(NbreP, l);
  readln();
end.

