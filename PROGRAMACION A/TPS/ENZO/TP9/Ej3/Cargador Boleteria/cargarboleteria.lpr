program cargarboleteria;
type
  ST3 = string[3];
  TReg = record
    cod : ST3;
    numero : word;
    comida : char;
  end;

  TArch = file of TReg;

procedure cargarBoleteria (var boleteria : TArch);
var
  archE : text;
  reg : TReg;
begin
  assign(archE, 'cargaBoleteria.txt');
  reset(archE);
  rewrite(boleteria);
  while not eof(archE) do
  begin
    readln(archE, reg.cod);
    readln(archE, reg.numero);
    readln(archE, reg.comida);
    write(boleteria, reg);
  end;
  close(archE);
  close(boleteria);
end;

procedure listarBoleteria (var boleteria : TArch);
var
  reg : TReg;
begin
  reset(boleteria);
  read(boleteria, reg);
  while not eof(boleteria) do
  begin
    writeln(reg.cod);
    writeln(reg.numero);
    writeln(reg.comida);
    read(boleteria, reg);
  end;
  close(boleteria);
end;

var
  boleteria : TArch;

begin
  assign(boleteria, 'Boleteria.dat');
  cargarBoleteria(boleteria);
  listarBoleteria(boleteria);
  readln();
end.

