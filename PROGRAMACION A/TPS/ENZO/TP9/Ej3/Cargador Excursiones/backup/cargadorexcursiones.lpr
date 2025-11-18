program cargadorexcursiones;
type
  ST3 = string[3];
  ST15 = string[15];
  TReg = record
    cod : ST3;
    descripcion : ST15;
    precioB, precioC : real;
  end;

  TArch = file of TReg;

procedure cargarExcursiones (var excursiones : TArch);
var
  archE : text;
  reg : TReg;
begin
  assign(archE, 'CargaExcursiones.txt');
  reset(archE);
  rewrite(excursiones);
  while not eof(archE) do
  begin
    readln(archE, reg.cod);
    readln(archE, reg.descripcion);
    readln(archE, reg.precioB);
    readln(archE, reg.precioC);
    write(excursiones, reg);
  end;
  close(archE);
  close(excursiones);
end;

procedure listarExcursiones (var excursiones : TArch);
var
  reg : TReg;
begin
  reset(excursiones);
  while not eof(excursiones) do
  begin
    read(excursiones, reg);
    writeln('Hola');
    writeln(reg.cod);
    writeln(reg.descripcion);
    writeln(reg.precioB:4:2);
    writeln(reg.precioC:4:2);
  end;
  close(excursiones);
end;

var
  excursiones : TArch;

begin
  assign(excursiones, 'Excursiones.dat');
  cargarExcursiones(excursiones);
  listarExcursiones(excursiones);
  readln();
end.

