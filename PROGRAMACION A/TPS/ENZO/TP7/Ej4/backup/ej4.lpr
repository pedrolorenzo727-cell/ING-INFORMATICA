program ej4;
const
  maxElem = 100;

type
  ST15 = string[15];
  TV1 = array[1..maxElem] of char;

  TRegInfo = record
    nombre : ST15;
    cantP, puntaje : byte;
    partidos : TV1;
  end;

  TV2 = array[1..maxElem] of TRegInfo;
  TV3 = array[1..maxElem] of ST15;

function puntos (res : char):byte;
begin
  case res of
       'P' : puntos := 0;
       'E' : puntos := 1;
       'G' : puntos := 3;
  end;
end;

function buscEquipo (equipos : TV2; n : byte; equipo : ST15):byte;
var
  pri, ult, med : byte;
begin
  pri := 1;
  ult := n;
  med := (pri + ult) div 2;
  while (ult > pri) and (equipos[med].nombre <> equipo) do
  begin
    if equipo > equipos[med].nombre then
      pri := med + 1
    else
      ult := med - 1;
    med := (pri + ult) div 2;
  end;
  if equipo = equipos[med].nombre then
    buscEquipo := med
  else
    buscEquipo := 0;
end;

procedure insertaOrdenado (var equipos : TV2; var n : byte; equipo : ST15; res : char);
var
  i : byte;
begin
  i := n;
  while (i > 0) and (equipos[i].nombre > equipo) do
  begin
    equipos[i + 1] := equipos[i];
    i := i - 1;
  end;
  equipos[i + 1].nombre := equipo;
  equipos[i + 1].cantP := 1;
  equipos[i + 1].partidos[1] := res;
  equipos[i + 1].puntaje := puntos(res);
  n := n + 1;
end;

procedure leerVector (var equipos : TV2; var n : byte);
var
  archE : text;
  equipo : ST15;
  res: char;
  pos : byte;
begin
  assign(archE, 'EntradaDesordenada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    readln(archE, equipo,res);
    pos := buscEquipo(equipos,n,equipo);
    if pos = 0 then (*Si no tengo el equipo guardado, lo guardo de forma ordenada*)
      insertaOrdenado(equipos,n,equipo,res)
    else
      begin
        equipos[pos].cantP:= equipos[pos].cantP + 1; (*Si lo tengo guardado, incremento la cantidad de partidos*)
        equipos[pos].partidos[equipos[pos].cantP] := res; (*Para ese nuevo partido, guardo el resultado*)
        equipos[pos].puntaje := equipos[pos].puntaje + puntos(res);
      end;
  end;
  close(archE);
end;

procedure mostrarTabla (equipos : TV2; n : byte);
var
  i : byte;
begin
  for i := 1 to n do
      writeln(equipos[i].nombre, equipos[i].puntaje:10);
end;

procedure iniciaVector (VPri : TV3);
var
  i : byte;
begin
  for i := 1 to maxElem do
      VPri[i] := '';
end;

procedure generarV (equipos : TV2; n : byte; var VPri : TV3; var m : byte);
var
  i, max: byte;
begin
  max := 0;
  m := 0;
  for i := 2 to n do
      if equipos[i].puntaje > max then
      begin
        max := equipos[i].puntaje;
        iniciaVector(VPri);
        m := 1;
        VPri[m] := equipos[i].nombre;
      end
      else
          if equipos[i].puntaje = max then
          begin
            m := m + 1;
            VPri[m] := equipos[i].nombre;
          end;
end;

function porcNoP (equipos : TV2; n : byte):real;
var
  i, j, cont : byte;
begin
  cont := 0;
  for i := 1 to n do
  begin
      j := 1;
      while (j <= n) and (equipos[i].partidos[j] <> 'P') do
            j := j + 1;
      if j > n then
         cont := cont + 1;
  end;
  if cont <> 0 then
     porcNoP := cont*100/n
  else
    porcNoP := 0;
end;

procedure mostrarVector (VPri : TV3; m : byte);
var
  i : byte;
begin
  for i := 1 to m do
      write(VPri[i]);
end;

var
  equipos : TV2;
  VPri : TV3;
  n, m : byte;
  porc : real;

begin
  leerVector(equipos,n);
  writeln('Equipo               Puntaje');
  mostrarTabla(equipos,n);
  generarV(equipos,n,VPri,m);
  writeln();
  writeln('Punteros de la tabla');
  mostrarVector(VPri,m);
  porc := porcNoP(equipos,n);
  if porc = 0 then
     writeln('No hay equipos que no hayan perdido partidos')
  else
    writeln('Porcentaje de equipos que no perdieron un partido: ', porc:4:2, '%');
  readln();
end.

