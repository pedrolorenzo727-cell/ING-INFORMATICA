program ej6;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of string;

procedure leerVector (var v1 : TV; var n : byte);
var
  archE : text;
  car : char;
  pal : string;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    read(archE, car);
    pal := '';
    while (car <> ' ') and (car <> '.') and (car <> ',') do
    begin
      pal := pal + car;
      read(archE, car);
    end;
    if pal <> '' then
    begin
      n := n + 1;
      v1[n] := pal;
    end;
  end;
  close(archE);
end;

function palabraMasLarga (v1 : TV; n : byte):byte;
var
  i, max : byte;
begin
     max := 0;
     for i := 1 to n do
         if length(v1[i]) > max then
            max := length(v1[i]);
     palabraMasLarga := max;
end;

function palabraAntes (v1 : TV; n : byte):string;
var
  i : byte;
  min : string;
begin
     min := 'ZZZZZZZZZZZ';
     for i := 1 to n do
         if v1[i] < min then
            min := v1[i];
     palabraAntes := min;
end;

procedure frecLetras (v1 : TV; n : byte);
var
  i, j, frec : byte;
  car : char;
begin
     for car := 'A' to 'Z' do
     begin
       frec := 0;
        for i := 1 to n do
            for j := 1 to length(v1[i]) do
                if upcase(v1[i][j]) = car then
                   frec := frec + 1;
        if frec <> 0 then
           writeln('Frecuencia de ', car, ': ', frec);
     end;
end; (*Si tuviera que almacenar esas frecuencias, utilizo la opcion de Laureano*)

procedure menu (var op : byte);
begin
  writeln('MENU DE OPCIONES PARA SU FRASE');
  writeln('Seleccione una opcion');
  writeln('1 : Numero de palabras');
  writeln('2 : Longitud de palabra mas larga');
  writeln('3 : Palabra que esta antes en el diccionario');
  writeln('4 : Frecuencia de cada letra');
  writeln('5 : Salir');
  repeat
    readln(op);
  until (op > 0) and (op <= 5);
end;

var
  v1 : TV;
  n, op : byte;
begin
  leerVector(v1,n);
  repeat
    menu(op);
    writeln();
    case op of
         1 : writeln('La frase tiene ', n, ' palabras');
         2 : writeln('La longitud de la palabra mas larga es ', palabraMaslarga(v1,n));
         3 : writeln('la palabra que aparece antes en el diccionario es ', palabraAntes(v1,n));
         4 : begin
                  writeln('Frecuncia de cada letra');
                  frecLetras(v1,n);
         end
    end;
  until op = 5;
  readln();
end.

