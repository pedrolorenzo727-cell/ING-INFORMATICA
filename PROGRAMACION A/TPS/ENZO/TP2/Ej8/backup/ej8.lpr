program ej8;
var
  edad, cant, dia : byte;
  importe : real;
  piletaSN, deporteE : char;
begin
  writeln('Ingrese edad');
  readln(edad);
  if edad < 18 then
     if edad < 13 then
        if edad < 5 then
           importe := 0
        else
          importe := 750
     else
          importe := 1200
  else
      importe := 1800;

  writeln('Realiza deportes extras? S o N');
  readln(deporteE);
  if upcase(deporteE) = 'S' then
     begin
          writeln('Cuantos realiza?');
          readln(cant);
          writeln('Alguno de esos deportes es pileta? S o N');
          readln(piletaSN);
          if upcase(piletaSN) = 'S' then
             importe := importe + 800 + 250*(cant - 1)
          else
            importe := importe + 250*cant;
     end;

  writeln('Ingrese dia del mes abonado');
  readln(dia);
  if dia > 15 then
     importe := importe*1.05;

  writeln('Importe: $', importe:4:2);
  readln();
end.

