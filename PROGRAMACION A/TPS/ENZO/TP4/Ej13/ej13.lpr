program ej13;

procedure actHora (var hor, min, seg: longint; segT :longint);
begin
    seg := seg + segT;
    while seg >= 60 do
    begin
          seg := seg - 60;
          min := min + 1;
    end;

    while min >= 60 do
    begin
          min := min - 60;
          hor := hor + 1;
    end;

    while hor >= 24 do
         hor := hor - 24;
end;

procedure mostrarHora (horaI, minI, segI : LongInt; segT : LongInt);
begin
    if horaI < 10 then write('0');
    write(horaI, ':');

    if minI < 10 then write('0');
    write(minI, ':');

    if segI < 10 then write('0');
    writeln(segI);
end;

procedure horaInicial (var hor, min, seg, segT : longint);
begin
     repeat
           writeln('Ingrese hora, minutos y segundos');
           readln(hor,min,seg);
     until ((hor >= 0) and (hor <= 23)) and ((min >= 0) and (min <= 59)) and ((min >= 0) and (min <= 59));

     repeat
           writeln('Ingrese segundos transcurridos');
           readln(segT);
     until segT >= 0;
end;

var
  hor, min , seg, segT : longint;

begin
  horaInicial(hor, min,seg, segT);
  writeln('Hora Inicial');
  mostrarHora(hor,min,seg,segT);
  writeln('Hora Actualizada');
  actHora(hor,min,seg,segT);
  mostrarHora(hor,min,seg,segT);
  readln();
end.

