program ej5;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure leerVector (var V : TV; var n : byte);
var
  archE : text;
begin
  assign(archE,'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    read(archE, V[n]);
  end;
  close(archE);
end;

function suma (V : TV; n : byte):integer;
begin
  if n = 1 then
     suma := V[n]
  else
    suma := V[n] + suma(V,n - 1);
end;

procedure mostrarVector (V: TV; i, n : byte);
begin
  if i <= n then
  begin
     write(V[i], ' ');
     mostrarVector(V,i + 1, n);
  end;
end;

procedure mostrarVectorInv (V: TV; n : byte);
begin
  if n > 0 then
  begin
     write(V[n], ' ');
     mostrarVectorInv(V,n - 1);
  end;
end;

function max (V : TV; n : byte):integer;
var
  aux : integer;
begin
  if n = 1 then
     max := V[n]
  else
    begin
       aux := max(V,n - 1);
       if V[n] > aux then
          max := V[n]
       else
         max := aux;
    end;
end;

function prom (V : TV; i, n : byte):real;
begin
  if i = n then
     prom := V[i]/n
  else
    prom := V[i]/n + prom(V,i + 1,n);
end;

var
  V : TV;
  n : byte;

begin
  leerVector(V,n);
  writeln('Suma: ', suma(V,n));
  mostrarVector(V,1,n);
  writeln();
  mostrarVectorInv(V,n);
  writeln();
  writeln('Maximo: ', max(V,n));
  writeln('Promedio: ', prom(V,1,n):4:2);
  readln();
end.

