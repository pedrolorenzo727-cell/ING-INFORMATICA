program ej15;
const
  maxElem = 100;
  cantCereal = 4;

type
  st4 = string[4];
  st7 = string[7];
  TV1 = array[1..maxElem] of st4;
  TV2 = array[1..maxElem] of st7;
  TV3 = array[1..maxElem] of byte;
  TV4 = array[1..maxElem] of real;

procedure iniciaVector (var cereales : TV4);
var
  i : byte;
begin
  for i := 1 to cantCereal do
      cereales[i] := 0;
end;

procedure leerVectores (var clientes : TV1; var patentes : TV2; var tipos : TV3; var tns : TV4; var cereales : TV4; var n : byte);
var
  archE : text;
  tipo : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  iniciaVector(cereales);
  while not eof(archE) do
  begin
    n := n + 1;
    readln(archE, clientes[n]);
    readln(archE, patentes[n]);
    readln(archE, tipo);
    tipos[n] := tipo;
    readln(archE, tns[n]);
    cereales[tipo] := cereales[tipo] + tns[n];
  end;
  close(archE);
end;

function nombrar (tipo : byte):string;
begin
  case tipo of
       1 : nombrar := 'Trigo';
       2 : nombrar := 'Girasol';
       3 : nombrar := 'Soja';
       4 : nombrar := 'Maiz';
  end;
end;

function sumar (cereales : TV4):real;
var
  i : byte;
  sum : real;
begin
     sum := 0;
     for i := 1 to cantCereal do
         sum := sum + cereales[i];
     sumar := sum;
end;

procedure porcentaje (cereales : TV4);
var
  i : byte;
  total: real;
begin
  total := sumar(cereales);
  for i := 1 to cantCereal do
      writeln('Porcentaje de ', nombrar(i), ' es ', cereales[i]*100/total:4:2, '%');
end;

procedure buscPatente (clientes : TV1; patentes : TV2; tipos : TV3; tns : TV4; n : byte; patente : st7);
var
  i : byte;
begin
  i := 1;
  while (i <= n) and (patente <> patentes[i]) do
        i := i + 1;
  if i <= n then
  begin
    writeln(clientes[i]);
    writeln(nombrar(tipos[i]));
    writeln(tns[i]:4:2);
  end
  else
      writeln('No se encontro datos del camion');
end;

procedure menu (var op : byte);
begin
  writeln('Menu de opciones');
  writeln('Seleccione una opcion');
  writeln('1 : Porcentaje de toneladas por cereal');
  writeln('2 : Dada una patente, tipo de cereal que transporta, las toneladas y el cliente');
  repeat
    readln(op);
  until (op > 0);
end;

var
  clientes : TV1;
  patentes : TV2;
  tipos : TV3;
  tns : TV4;
  cereales : TV4;
  n, op : byte;
  patente : st7;
begin
  leerVectores(clientes,patentes,tipos,tns,cereales,n);
  repeat
    menu(op);
    writeln();
    case op of
         1 : porcentaje(cereales);
         2 :
           begin
               writeln('Ingrese una patente');
               readln(patente);
               buscPatente(clientes,patentes,tipos,tns,n,patente);
           end;
    end;
    writeln();
  until op = 5;
  readln();
end.

