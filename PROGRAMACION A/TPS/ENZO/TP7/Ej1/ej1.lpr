program ej1;
const
  maxElem = 100;

type
  TRegF = record
    dia, mes : byte;
    anio : word;
  end;

  ST10 = string[10];
  TRegPer = record
    nombre : ST10;
    fecha : TRegF;
  end;

  TV = array[1..maxElem] of TRegPer;
  TVByte = array[1..maxElem] of byte;

function estacion (dia, mes : byte):byte;
begin
  case mes of
       1..2 : estacion := 1;
       3 :
         if dia < 21 then
            estacion := 1
         else
           estacion := 2;
       4..5 : estacion := 2;
       6 :
         if dia < 21 then
            estacion := 2
         else
           estacion := 3;
       7..8 : estacion := 3;
       9 :
         if dia < 21 then
            estacion := 3
         else
           estacion := 4;
       10..11 : estacion := 4;
       12 :
         if dia < 21 then
            estacion := 4
         else
           estacion := 1;
  end;
end;

procedure leerVectores (var v : TV; var cumpEst : TVByte; var n, m : byte);
var
  archE : text;
  est : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  m := 4;
  while not eof(archE) do
  begin
    n := n + 1;
    with v[n] do
    begin
      readln(archE,nombre);
      readln(archE,fecha.dia,fecha.mes,fecha.anio);
      est := estacion(fecha.dia,fecha.mes);
      cumpEst[est] := cumpEst[est] + 1;
    end;
  end;
end;

function nombrar (est : byte):string;
begin
  case est of
       1 : nombrar := 'Verano';
       2 : nombrar := 'Otonio';
       3 : nombrar := 'Invierno';
       4 : nombrar := 'Primavera';
  end;
end;

function estMasCump (cumpEst : TVByte; m : byte):string;
var
  i, posMax : byte;
begin
  posMax := 1;
  for i := 2 to m do
      if cumpEst[i] > cumpEst[posMax] then
         posMax := i;
  estMasCump := nombrar(posMax);
end;

var
  v : TV;
  cumpEst : TVByte;
  n, m : byte;

begin
  leerVectores(v,cumpEst,n,m);
  writeln('Estacion del anio con mas cumpleanios: ', estMasCump(cumpEst,m));
  readln();
end.

