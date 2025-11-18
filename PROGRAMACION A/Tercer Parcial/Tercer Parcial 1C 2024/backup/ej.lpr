program ej;
const
  maxElem = 100;

type
  ST6 = string[6];
  ST30 = string[30];
  TRegCan = record
    Id : ST6;
    genero : 1..5;
    nombre : ST30;
    disponible : char;
    duracion : word;
  end;
  TRegInt = record
    Id : ST6;
    nombre : ST30;
    contrato : char;
  end;
  TArchCan = file of TRegCan;
  TArchInt = file of TRegInt;
  TV = array[1..maxElem] of TRegInt;

procedure leerVector (var interpretes : TArchInt; var V : TV; var n : byte);
var
  reg : TRegInt;
begin
  reset(interpretes);
  n := 0;
  read(interpretes, reg);
  while not eof(interpretes) do
  begin
    n := n + 1;
    V[n] := reg;
    read(interpretes, reg);
  end;
  close(interpretes);
end;

function buscCod (V : TV; n : byte; cod : ST6):byte;
var
  i : byte;
begin
  i := 1;
  while V[i].Id <> cod do
        i := i + 1;
  buscCod := i;
end;

procedure generarListado (var canciones : TArchCar; var V : TV; n : byte; x : byte);
var
  reg : TRegCan;
  i, cantD, cantND : byte;
  interpreteAct : ST6;
  generoAct : 1..5;
  total : word;
begin
  reset(canciones);
  total := 0;
  read(canciones, reg);
  while not eof(canciones) do
  begin
    interpreteAct := reg.Id;
    i := buscCod(V,n,reg.Id);
    if V[i].contrato = 'S' then
    begin
         writeln(V[i].nombre);
         cantD := 0;
         cantND := 0;
         while interpreteAct = reg.Id do
         begin
              generoAct := reg.genero;
              while (generoAct = reg.genero) and (interpreteAct = reg.Id) do
              begin
                   if reg.disponible = 'S' then
                   begin
                        cantD := cantD + 1;
                        if reg.genero = x then
                        begin
                             writeln(reg.nombre);
                             total := total + reg.duracion;
                        end;
                   end
                   else
                       cantND := cantND + 1;
                   read(canciones, reg);
              end;
         end;
         writeln(cantD);
         writeln(cantND);
    end
    else
        begin
          while interpreteAct = reg.Id do
          begin
            if reg.genero = x then
               total := total + reg.duracion;
            read(canciones, reg);
          end;
        end;
  end;
  writeln(total);
  close(canciones);
end;

var
  canciones : TArchCan;
  interpretes : TArchInt;
  V : TV;
  n, x : byte;

begin
     assign(canciones, 'Canciones.dat');
     assign(interpretes, 'Interpretes.dat');
     leerVector(interpretes, V, n);
     readln(x);
     generarListado(canciones, V, n, x);
     readln();
end.

