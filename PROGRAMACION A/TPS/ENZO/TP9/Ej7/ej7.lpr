program ej7;
const
  maxElem = 100;
  cantZ = 10;

type
  ST4 = string[4];
  ST3 = string[3];
  TRegCin = record
    cod : ST4;
    zona : 1..cantZ;
    capacidad : word;
  end;

  TArchCin = file of TRegCin;

  TRegVen = record
    cod : ST4;
    codP : ST3;
    locV : word;
  end;

  TArchVen = file of TRegVen;

  TRegPel = record
    cod : ST3;
    locV, cantF : word;
    duracion : byte;
  end;

  TVZona = array[1..cantZ] of word;
  TVPel = array[1..maxElem] of TRegPel;

procedure leerVector (var pel : TVPel; var n : byte);
var
  archE : text;
  car : char;
  nombre : string[25];
begin
  assign(archE, 'Peliculas.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    readln(archE, pel[n].cod, car, nombre, pel[n].duracion);
    pel[n].cantF := 0;
    pel[n].locV := 0;
  end;
  close(archE);
end;

function buscCod (pel : TVPel; cod : ST3; n : byte):byte;
var
  i : byte;
begin
  i := 1;
  while (pel[i].cod <> cod) do
        i := i + 1;
  if i <= n then
     buscCod := i
end;

procedure iniciaVector (var zonas : TVZona);
var
  i : byte;
begin
  for i := 1 to cantZ do
      zonas[i] := 0;
end;

function promMin (pel : TVPel; n : byte):byte;
var
  i, posMin : byte;
  min : real;
begin
  min := 999999;
  for i := 1 to n do
      if pel[i].cantF <> 0 then
         if pel[i].locV/pel[i].cantF < min then
         begin
              posMin := i;
              min := pel[i].locV/pel[i].cantF;
         end;
  promMin := posMin;
end;

procedure procesarArchivos (var cines : TArchCin; var ventas : TArchVen; var zonas : TVZona; pel : TVPel; n : byte);
var
  RC : TRegCin;
  RV : TRegVen;
  cantC, cantP, cantF, pos : byte;
  locTV : word;
  peliAct : ST3;
begin
  reset(cines);
  reset(ventas);
  writeln('Cine', 'Cant. Peliculas':20, 'Cant. Funciones':20, 'Total Loc. Vendidas':30, '%Ocu. Promedio':20);
  cantC := 0;
  read(cines, RC);
  read(ventas, RV);
  while not eof(cines) or not eof(ventas) do
  if RC.cod = RV.cod then
  begin
       cantP := 0;
       cantF := 0;
       locTV := 0;
       write(RC.cod);
       while RC.cod = RV.cod do
       begin
            pos := buscCod(pel,RV.codP,n);
            peliAct := RV.codP;
            cantP := cantP + 1;
            while (RV.codP = peliAct) and (RC.cod = RV.cod) do
            begin
                 pel[pos].cantF := pel[pos].cantF + 1;
                 pel[pos].locV := pel[pos].locV + RV.locV;
                 cantF := cantF + 1;
                 locTV := locTV + RV.locV;
                 zonas[RC.zona] := zonas[RC.zona] + RV.locV;
                 read(ventas, RV);
            end;
       end;
       writeln(cantP:12, cantF:20, locTV:30, locTV/cantF:23:2,'%');
       read(cines,RC);
  end
  else
      if RC.cod < RV.cod then
      begin
           cantC := cantC + 1;
           writeln(RC.cod,'0':12, '0':20, '0':30, '0':23,'%');
           read(cines, RC);
      end
      else
          read(ventas, RV);
  writeln('Cantidad de cines que no proyectaron ninguna pelicula: ', cantC);
  writeln('Pelicula con menor promedio de localidades vendidas por funcion: ', pel[promMin(pel,n)].cod, '(',pel[promMin(pel,n)].duracion,')');
end;

procedure totalZonas (zonas : TVZona);
var
  i : byte;
begin
  writeln('Total de localidades vendidas por zona');
  for i := 1 to cantZ do
      writeln('Zona ', i, zonas[i]:20);
end;

var
  cines : TArchCin;
  ventas : TArchVen;
  zonas : TVZona;
  pel : TVPel;
  n : byte;

begin
  assign(cines, 'Cines.dat');
  assign(ventas, 'Venta.dat');
  leerVector(pel,n);
  iniciaVector(zonas);
  procesarArchivos(cines,ventas,zonas,pel,n);
  writeln();
  totalZonas(zonas);
  readln();
end.

