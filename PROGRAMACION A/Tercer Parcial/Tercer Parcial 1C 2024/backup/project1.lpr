program project1;

type
    ST6 = string[6];
    ST20 = string[30];
    TRegCan = record
            Id : ST6;
            genero : 1..5;
            nombre : ST30;
            disponible : char;
            duracion : word;
    end;

    TArchCan = file of TRegCan;

procedure grabar (var canciones : TArchCan);
var
  archE : text;
  reg : TRegCan;
begin
     assign(archE, 'Entrada.txt');
     reset(archE);
end;
begin
end.

