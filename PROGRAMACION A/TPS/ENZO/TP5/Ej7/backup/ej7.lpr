program ej7;
const
  maxElem = 20;

type
  TV = array[1..maxElem] of word;

procedure leerVectores (var v1, v2 : TV; var n1, n2 : byte);
var
  i : byte;
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n1);
  for i := 1 to n1 do
      read(archE, v1[i]);
  readln(archE);
  readln(archE, n2);
  for i := 1 to n2 do
      read(archE, v2[i]);
  close(archE);
end;

procedure iniciarVector (var v : TV; n : byte);
var
  i : byte;
begin
  for i := 1 to n do
  begin
      v[maxElem - i + 1] := v[n - i + 1];
      v[n - i + 1] := 0; (*Hago esto para que me quede 0 0 0 0 0 100 por ejemplo*)
  end;
end;

procedure sumar (var suma : TV; v1, v2 : TV; n1, n2 : byte);
var
  i : byte;
  resto, extra, sum : word;
begin
  iniciarVector(v1,n1);
  iniciarVector(v2,n2);
  extra := 0;
  for i := maxElem downto 1 do
  begin
      sum := v1[i] + v2[i] + extra; (*Ej tengo 9 y 9 me da 18*)
      resto := sum mod 10; (*Me quedo con el 8*)
      extra := sum div 10; (*Me quedo con el 1*)
      suma[i] := resto      end
  end;
end;

procedure mostrarVector (v : TV);
var
    i : byte;
begin
    for i := 1 to maxElem do
        write(v[i], ' ');
    writeln();
end;

var
  v1, v2, suma : TV;
  n1, n2 : byte;
begin
  leerVectores(v1,v2,n1,n2);
  sumar(suma,v1,v2,n1,n2);
  mostrarVector(suma);
  readln();
end.

