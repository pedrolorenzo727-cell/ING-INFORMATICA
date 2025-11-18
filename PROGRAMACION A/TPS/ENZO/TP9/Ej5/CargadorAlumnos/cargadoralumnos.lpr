program cargadoralumnos;

type
  ST7 = string[7];
  TRegAlu = record
    matricula : ST7;
    notaM, notaF1, notaQ1 : real;
  end;

  TArchAlu = file of TRegAlu;

procedure cargarAlumnos (var alumnos : TArchAlu);
var
  archE : text;
  reg : TRegAlu;
begin
  assign(archE, 'cargaAlumnos.txt');
  reset(archE);
  rewrite(alumnos);
  while not eof(archE) do
  begin
    readln(archE, reg.matricula);
    readln(archE, reg.notaM);
    readln(archE, reg.notaF1);
    readln(archE, reg.notaQ1);
    write(alumnos, reg);
  end;
  close(archE);
  close(alumnos);
end;

procedure listarAlumnos (var alumnos : TArchAlu);
var
  reg : TRegAlu;
begin
  reset(alumnos);
  read(alumnos, reg);
  while not eof(alumnos) do
  begin
    writeln(reg.matricula);
    writeln(reg.notaM:4:2);
    writeln(reg.notaF1:4:2);
    writeln(reg.notaQ1:4:2);
    read(alumnos, reg);
  end;
  close(alumnos);
end;

var
  alumnos : TArchAlu;

begin
  assign(alumnos, 'Alumnos.dat');
  cargarAlumnos(alumnos);
  listarAlumnos(alumnos);
  readln();
end.

