program ej10;
const
  basico = 1350;

var
  cable, peliculas, deportes, internet6, internet10, grabar : char;
  importe : real;
begin
  importe := 0;
  writeln('Desea PAQUETE BASICO: $1350 (INCLUYE CABLE)? S o N');
  readln(cable);
  if upcase(cable) = 'S' then
     begin
       importe := basico;
       writeln('Desea paquete de peliculas? S o N');
       readln(peliculas);
       writeln('Desea paquete de deportes? S o N');
       readln(deportes);
       If upcase(peliculas) = 'S' then
          importe := importe + 200;

       if upcase(deportes) = 'S' then
          importe := importe + 270;

       writeln('Desea grabar programas? S o N');
       readln(grabar);
       if upcase(grabar) = 'S' then
          importe := importe + 150;
     end;

  writeln('Desea internet con 6MB? S o N');
  readln(internet6);
  if upcase(internet6) = 'S' then
     begin
         writeln('Desea 10MB y WIFI? S o N');
         readln(internet10);
         if upcase(internet10) = 'S' then
            importe := importe + 800*1.2
         else
         importe := importe + 800;
     end;

  if (upcase(cable) = 'S') and (upcase(internet6) = 'S') then
     importe := importe*0.75;

  writeln('Importe: $', importe:4:2);
  readln();
end.

