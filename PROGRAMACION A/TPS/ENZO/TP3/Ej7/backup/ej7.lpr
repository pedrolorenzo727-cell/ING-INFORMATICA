program ej7;
var
  nombre : string[10];
  n1, n2, n3, prom : real;
  cantApr, cantTot : byte;
begin
  writeln('Ingrese nombre del alumno (*** para finalizar)');
  readln(nombre);
  cantApr := 0;
  cantTot := 0;
  while nombre <> '***' do
  begin
    cantTot := cantTot + 1;
    writeln('Ingrese las tres notas');
    readln(n1,n2,n3);
    prom := (n1 + n2 + n3)/3;
    writeln('Promedio: ', prom:4:2);
    write('Condicion: ');
    if prom >= 4 then
    begin
         cantApr := cantApr + 1;
         writeln('Aprobado');
    end
    else
         writeln('Desaprobado');
  writeln('Ingrese nombre del alumno (*** para finalizar)');
  readln(nombre);
  end;
  writeln('Porcentaje de alumnos aprobados: ', cantApr*100/cantTot:4:2, '%');
  readln();
end.

