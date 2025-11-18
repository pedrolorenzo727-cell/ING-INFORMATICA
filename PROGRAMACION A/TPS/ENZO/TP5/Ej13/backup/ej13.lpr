program ej13;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of real;
  TV2 = array[1..maxElem] of byte;

procedure iniciarVectorCabinas (var cabina : TV1);
var
  i : byte;
begin
     for i := 1 to maxElem do
         cabina[i] := 0;
end;

procedure iniciarVectorV (var cantV : TV2);
var
  i : byte;
begin
     for i := 1 to maxElem do
         cantV[i] := 0;
end;

function calcularImporte (tipo, hora : byte):real;
var
  monto : real;
begin
    case tipo of
         1,3 : monto := 300;
         2 : monto := 150;
         4 : monto := 470;
         5 : monto := 390;
    end;
    if (hora >= 10) and (hora < 18) then
       monto := monto*1.1;
    calcularImporte := monto;
end;

procedure leerVector (var cabinas : TV1; var cantV : TV2; var n : byte);
var
  archE : text;
  cabina, hora, tipo : byte;
  importe : real;
begin
     assign(archE, 'Entrada.txt');
     reset(archE);
     iniciarVectorCabinas(cabinas);
     iniciarVectorV(cantV);
     readln(archE, n);
     while not eof(archE) do
     begin
       readln(archE, cabina, tipo, hora);
       cabinas[cabina] := cabinas[cabina] + calcularImporte(tipo,hora);
       cantV[cabina] := cantV[cabina] + 1;
     end;
     close(archE);
end;

procedure cantVPorCabina (cantV : TV2; n : byte);
var
  i : byte;
begin
    for i := 1 to n do
        writeln('La cabina ', i, ' atendio ', cantV[i]);
end;

function posMasRecaudo (cabinas : TV1; n : byte):byte;
var
  i, posMax : byte;
begin
    posMax := 1;
    for i := 2 to n do
        if cabinas[i] > cabinas[posMax] then
           posMax := i;
    posMasRecaudo := posMax;
end;

var
  cabinas : TV1;
  cantV : TV2;
  n, pos : byte;
begin
  leerVector(cabinas,cantV,n);
  cantVPorCabina(cantV,n);
  pos := posMasRecaudo(cabinas,n);
  writeln('La cabina que mas recaudo fue la ',pos, ' y recaudo $',cabinas[pos]:4:2);
  readln();
end.

