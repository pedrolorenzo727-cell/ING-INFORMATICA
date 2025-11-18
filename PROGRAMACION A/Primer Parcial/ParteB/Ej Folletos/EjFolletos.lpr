program EjFolletos;
const
  maxElem = 100;

type
  TVCos = array[1..maxElem] of real;
  TVCan = array[1..maxElem] of byte;

function costo (tipo : char; tamanio, cant : byte):real;
var
  monto : real;
begin
     monto := 1*cant;
     case tipo of
          'A' : monto := monto*2;
          'B' : monto := monto*3;
          'C' : monto := monto*5;
     end;
     if tamanio = 2 then
        monto := monto*1.5;
     costo := monto;
end;

procedure leerVectores (var Vcant, VMasL : TVCan; var VCosto : TVCos; var n : byte);
var
  archE : text;
  tipo, car: char;
  tamanio, contLet: byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    VMasL[n] := 0;
    Vcant[n] := 0;
    VCosto[n] := 0;
    read(archE, tipo, car, tamanio);
    while car <> '.' do
    begin
         contLet := 0;
         repeat
               read(archE, car);
         until car <> ' ';
         while (car <> ' ') and (car <> '.') do
         begin
              contLet := contLet + 1;
              read(archE, car);
         end;
         if contLet > VMasL[n] then
            VMasL[n] := contLet;
         Vcant[n] := Vcant[n] + 1;
    end;
    VCosto[n] := costo(tipo,tamanio, Vcant[n]);
    readln(archE);
  end;
  close(archE);
end;

function costoMasLarga (VMasL : TVCan; VCosto : TVCos; n : byte):real;
var
  i : byte;
  masLarga, cont : byte;
  prom: real;
begin
  masLarga := 0;
  for i := 1 to n do
      if VMasL[i] > masLarga then
      begin
         masLarga := VMasL[i];
         prom := VCosto[i];
         cont := 1;
      end
      else
          if VMasL[i] = masLarga then
          begin
              prom := prom + VCosto[i];
              cont := cont + 1;
          end;
  prom := prom/cont;
  costoMasLarga := prom;
end;

function buscFolleto (Vcant : TVcan; n, m : byte):byte;
var
  i : byte;
begin
  i := 1;
  while (i <= n) and (Vcant[i] <> m) do
        i := i + 1;
  if i <= n then
     buscFolleto := i
  else
      buscFolleto := 0;
end;

var
  Vcant, VMasL : TVCan;
  VCosto : TVCos;
  n, m, pos : byte;

begin
  leerVectores(Vcant, VMasL, VCosto, n);
  writeln('Costo del folleto con la palabra mas larga $', costoMasLarga(VMasL,VCosto,n):4:2);
  writeln('Ingrese m');
  readln(m);
  pos := buscFolleto(Vcant,n, m);
  if pos <> 0 then
      writeln(VCosto[pos]:4:2)
  else
      writeln('No se encontro un folleto con exactamente ', m, ' palabras');
  readln();
end.

