program ej1;
const
  maxElem = 10;

type
  TV = array[1..maxElem] of real;

procedure leerVector (var v : TV; var n : byte);
var
  i : byte;
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n);
  for i := 1 to n do
      read(archE, v[i]);
  close(archE);
end;

function suma (v : TV; n : byte):real;
var
  i : byte;
  sum : real;
begin
  sum := 0;
  for i := 1 to n do
      sum := sum + v[i];
  suma := sum;
end;

procedure escPosPar (v : TV; n : byte);
var
  i : byte;
begin
  i := 2;
  while i <= n do
  begin
    write(v[i]:4:2, ' ');
    i := i + 2;
  end;
end;

(*
function max (v : TV; n : byte):real;
var
  i : byte;
  maximo : real;
begin
  maximo := v[1];
  for i := 2 to n do
      if v[i] > maximo then
         maximo := v[i];
  max := maximo;
end;

function min (v : TV; n : byte):real;
var
  i : byte;
  minimo : real;
begin
  minimo := v[1];
  for i := 2 to n do
      if v[i] < minimo then
         minimo := v[i];
  min := minimo;
end;

*)

procedure maxMin (v : TV; n : byte);
var
  i : byte;
  max, min : real;
begin
  (*Supongo que n > 1 porque sino deberian ser ciclos secuenciales por si n = 1*)
  max := -99999;
  min := 999999;
  for i := 1 to n do
      if v[i] > max then
         max := v[i]
      else
        if v[i] < min then
           min := v[i];
  writeln('Maximo: ', max:4:2);
  writeln('Minimo: ', min:4:2);
end;

procedure generarB (v : TV; n : byte; var B : TV);
var
  i : byte;
begin
  for i := 1 to n do
      B[i] := v[n - i + 1];
end;

procedure mostrarVector (B : TV; n : byte);
var
  i : byte;
begin
  for i := 1 to n do
      write(B[i]:4:2, ' ');
end;

procedure menu(var op : byte);
begin
  writeln('Menu de opciones para su arreglo');
  writeln('Seleccione una opcion');
  writeln('1 : Calcular suma de los sus elementos');
  writeln('2 : Mostrar los elementos que se encuentren en posiciones pares');
  writeln('3 : Calcular el maximo y el minimo');
  writeln('4 : Generar un arreglo B permutando los elementos de A');
  writeln('5 : Salir');
  repeat
    readln(op);
  until (op > 0) and (op <= 5);
end;

var
  A, B : TV;
  n, op : byte;
begin
  leerVector(A,n);
  repeat
    menu(op);
    case op of
         1 : writeln('Suma de sus elementos: ', suma(A,n):4:2);
         2 : begin
                  writeln('Elementos en posiciones pares');
                  escPosPar(A,n);
              end;
         3 : maxMin(v,n);
         4 : begin
                  generarB(A,n,B);
                  mostrarVector(B,n);
             end;
    end;
    writeln();
  until op = 5;
  readln();
end.

