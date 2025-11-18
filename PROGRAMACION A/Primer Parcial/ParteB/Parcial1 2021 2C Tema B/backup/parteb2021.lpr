program parteb2021;
const
  maxElem = 100;
  NEscuderias = 4;

type
  ST16 = string[16];
  TVNom = array[1..maxElem] of ST16;
  TV1 = array[1..maxElem] of byte;
  TV2 = array[1..maxElem] of real;

procedure iniciaVectorByte (var VVueltasE : TV1);
var
  i : byte;
begin
    for i := 1 to NEscuderias do
        VVueltasE[i] := 0;
end;

procedure iniciaVectorReal (var VTiempoE : TV2);
var
  i : byte;
begin
    for i := 1 to NEscuderias do
        VTiempoE[i] := 0;
end;

function buscCorredor (nombres : TVNom; n : byte; nombre : ST16):byte;
var
  i : byte;
begin
    i := 1;
    while (i <= n) and (nombres[i] <> nombre) do
          i := i + 1;
    if i <= n then
       buscCorredor := i
    else
       buscCorredor := 0;
end;

procedure leerVectores (var nombres : TVNom; var tiempoP, VTiempoE : TV2; var escuderia, cantV, VVueltasE: TV1; var n : byte);
var
  archE : text;
  nombre : ST16;
  e, pos : byte;
  tiempo : real;
begin
    assign(archE, 'Entrada.txt');
    reset(archE);
    iniciaVectorByte(VVueltasE);
    iniciaVectorReal(VTiempoE);
    n := 1;
    readln(archE, nombres[n], e , tiempo);
    escuderia[n] := e;
    tiempoP[n] := tiempo;
    cantV[n] := 1;
    VTiempoE[e] := tiempo;
    VVueltasE[e] := 1;
    while not eof(archE) do
    begin
      readln(archE, nombre, e, tiempo);
      pos := buscCorredor(nombres,n,nombre);
      if pos = 0 then
      begin
        n := n + 1;
        nombres[n] := nombre;
        tiempoP[n] := tiempo;
        escuderia[n] := e;
        cantV[n] := 1;
      end
      else
          begin
            tiempoP[pos] := tiempoP[pos] + tiempo;
            cantV[pos] := cantV[pos] + 1;
          end;
      VTiempoE[e] := VTiempoE[e] + tiempo;
      VVueltasE[e] := VVueltasE[e] + 1;
    end;
    close(archE);
end;

procedure almacenarProm (var v : TV2; A : TV1; n : byte);
var
  i : byte;
begin
    for i := 1 to n do
        v[i] := v[i]/A[i];
end;

function nombrar (escuderia : byte):string;
begin
    case escuderia of
         1 : nombrar := 'Mercedes';
         2 : nombrar := 'McLaren';
         3 : nombrar := 'Ferrari';
         4 : nombrar := 'Williams';
    end;
end;

procedure mostrartiempoEscuderia (VtiempoE : TV2; NEscuderias : byte);
var
  i : byte;
begin
    for i := 1 to NEscuderias do
        writeln(nombrar(i), ' ', VtiempoE[i]);
end;

var
  nombres : TVNom;
  escuderia, cantV, VVueltaE : TV1;
  tiempoP, VTiempoE : TV2;
  n : byte;
begin
  leerVectores(nombres,tiempoP, VTiempoE, escuderia, cantV, VVueltaE, n);
  almacenarProm(tiempoP, cantV, n);
  almacenarProm(VTiempoE, VVueltaE, NEscuderias);
  mostrartiempoEscuderia(VTiempoE,NEscuderias);
  readln();

end.

