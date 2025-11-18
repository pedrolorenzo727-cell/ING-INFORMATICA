program ej3;
const
  maxElem = 100;

type
   ST3 = string[3];
   ST15 = string[15];
   TRegExc = record
        cod : ST3;
        descripcion : ST15;
        precioB, precioC : real;
  end;

   TRegBol = record
        cod : ST3;
        numero : word;
        comida : char;
  end;

  TArchExc = file of TRegExc;
  TArchBol = file of TRegBol;

  TV = array[1..maxElem] of TRegExc;

procedure cargaTabla (var excursiones : TArchExc; var tabla : TV);
var
  i : byte;
  reg : TRegExc;
begin
  reset(excursiones);
  i := 0;
  while not eof(excursiones) do
  begin
    read(excursiones, reg);
    i := i + 1;
    tabla[i].cod := reg.cod;
    tabla[i].descripcion:= reg.descripcion;
    tabla[i].precioB:= reg.precioB;
    tabla[i].precioC:= reg.precioC;
  end;
  close(excursiones);
end;

function buscCod (tabla : TV; cod : ST3):byte;
var
  i : byte;
begin
  i := 1;
  while tabla[i].cod <> cod do
        i := i + 1;
  buscCod := i;
end;

procedure procesarArchivo (var boleteria : TArchBol; var excursiones : TArchExc; tabla : TV);
var
  regBol : TRegBol;
  regExc : TRegExc;
  codAct : ST3;
  cantB, cantC, cantT, cantConC, pos : byte;
  montoT : real;
begin
  reset(boleteria);
  reset(excursiones);
  read(boleteria, regBol);
  cantConc := 0;
  cantT := 0;
  writeln('Excursion', 'Cantidad de Boletas':30, 'Cantidad de Comida':30, 'Monto Total':30);
  while not eof(boleteria) do
  begin
       pos := buscCod(tabla,regBol.cod);
       write(tabla[pos].descripcion);
       codAct := regBol.cod;
       cantB := 0;
       cantC := 0;
       montoT := 0;
       while codAct = regBol.cod do
       begin
            cantB := cantB + 1;
            if regBol.comida = 'S' then
            begin
                 cantC := cantC + 1;
                 montoT := montoT + tabla[pos].precioC;
            end;
            montoT := montoT + tabla[pos].precioB;
            read(boleteria, regBol);
       end;
       cantT := cantT + cantB;
       cantConC := cantConC + cantC;
       writeln(cantB:15, cantC:30, montoT:38:2);
  end;
  writeln(cantConC*100/cantT:4:2, '%');
end;

var
  excursiones : TArchExc;
  boleteria : TArchBol;
  tabla : TV;

begin
  assign(excursiones, 'Excursiones.dat');
  assign(boleteria, 'Boleteria.dat');
  cargaTabla(excursiones,tabla);
  procesarArchivo(boleteria,excursiones,tabla);
  readln();
end.

