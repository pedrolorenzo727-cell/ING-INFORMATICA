program cargadorinscriptos;

type
  ST7 = string[7];
  TRegIns = record
    matricula : ST7;
    Q2, F2 : byte;
  end;

  TArchIns = file of TRegIns;

procedure cargarInscriptos (var inscriptos : TArchIns);
var
  archE : text;
  reg : TRegIns;
begin
  assign(archE, 'CargaInscriptos.txt');
  reset(archE);
  rewrite(inscriptos);
  while not eof(archE) do
  begin
    readln(archE, reg.matricula);
    readln(archE, reg.Q2);
    readln(archE, reg.F2);
    write(inscriptos, reg);
  end;
  close(archE);
  close(inscriptos);
end;

procedure listarInscriptos (var inscriptos : TArchIns);
var
  reg : TRegIns;
begin
  reset(inscriptos);
  read(inscriptos, reg);
  while not eof(inscriptos) do
  begin
    writeln(reg.matricula);
    writeln(reg.Q2);
    writeln(reg.F2);
    read(inscriptos, reg);
  end;
  close(inscriptos);
end;

var
  inscriptos : TArchIns;

begin
  assign(inscriptos, 'Inscriptos.dat');
  cargarInscriptos(inscriptos);
  listarInscriptos(inscriptos);
  readln();
end.

