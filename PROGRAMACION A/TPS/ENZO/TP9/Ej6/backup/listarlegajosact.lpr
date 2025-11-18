program listarlegajosact;

type
  ST5 = string[5];
  ST15 = string[15];
  TRegLeg = record
    legajo : ST5;
    nombre : ST15;
    total, mayorV : real;
    nMayorV : byte;
  end;

  TArchLeg = file of TRegLeg;

procedure listarLegajos (var legajos : TArchLeg);
var
  reg : TRegLeg;
begin
  reset(legajos);
  read(legajos, reg);
  while not eof(legajos) do
  begin
    writeln(reg.legajo);
    writeln(reg.nombre);
    writeln(reg.total:4:2);
    writeln(reg.mayorV:4:2);
    writeln(reg.nMayorV);
    read(legajos, reg);
  end;
  close(legajos);
end;

var
  legajos : TArchLeg;

begin
  assign(legajos, 'LegajosAct.dat');
  cargarLegajos(legajos);
  listarLegajos(legajos);
  readln();
end.

