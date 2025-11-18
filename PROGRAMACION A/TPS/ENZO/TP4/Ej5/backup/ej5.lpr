program ej5;

function determinante (a, b, c , d : integer):integer;
begin
  determinante := a*d - b*c;
end;

var
  a, b, c, d, res1, res2, detS, detX, detY : integer;
begin
  writeln('Ingrese coeficientes de la primera ecuacion');
  readln(a, b);
  writeln('Ingrese solucion de la primera ecuacion');
  readln(res1);
  writeln('Ingrese coeficientes de la segunda ecuacion');
  readln(c,d);
  writeln('Ingrese resultado de la segunda ecuacion');
  readln(res2);
  detS := determinante(a,b,c,d);
  detX := determinante(res1,res2,b,d);
  detY := determinante(a,c,res1,res2);
  if detS <> 0 then
  begin
     writeln('X : ', detX/detS :4:2);
     writeln('Y : ', detY/detS :4:2);
  end
  else
      writeln('El sistema no es CD');
  readln();
end.
