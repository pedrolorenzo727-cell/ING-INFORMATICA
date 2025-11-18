program ej5;

type
   ST7 = string[7];
   TRegAlu = record
    matricula : ST7;
    notaM, notaF1, notaQ1 : real;
  end;

  TRegIns = record
    matricula : ST7;
    Q2, F2 : byte;
  end;

  TArchIns = file of TRegIns;
  TArchAlu = file of TRegAlu;

procedure procesarArchivos (var alumnos : TArchAlu; var inscriptos : TArchIns);
var
  RA : TRegAlu;
  RI : TRegIns;
begin
  reset(alumnos);
  reset(inscriptos);
  read(alumnos, RA);
  read(inscriptos, RI);
  writeln('Listado de alumnos':25);
  writeln('Matricula', 'Situacion':40);
  while not eof(alumnos) or not eof(inscriptos) do
  if RA.matricula = RI.matricula then
  begin
    if RI.Q2 = 1 then
       if RA.notaQ1 < 4 then
          writeln(RA.matricula, 'No cumple con los requisitos para Quimica II':60);
    if RI.F2 = 1 then
      if (RA.notaM < 4) or (RA.notaF1 < 4) then
        writeln(RA.matricula, 'No cumple con los requisitos para Fisica II':60);
    read(alumnos, RA);
    read(inscriptos, RI);
  end
  else
      if RA.matricula < RI.matricula then
         read(alumnos, RA)
      else
        begin
             writeln(RI.matricula, 'No hay registro de sus notas':60);
             read(inscriptos, RI);
        end;
  close(alumnos);
  close(inscriptos);
end;

var
  alumnos : TArchAlu;
  inscriptos : TArchIns;

begin
  assign(alumnos, 'Alumnos.dat');
  assign(inscriptos, 'Inscriptos.dat');
  procesarArchivos(alumnos,inscriptos);
  readln();
end.

