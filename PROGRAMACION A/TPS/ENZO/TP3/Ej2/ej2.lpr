program ej2;
const
  basico = 15000;
  cargasSociales = 11;
  seguro = 500;
var
  n, i, antiguedad : byte;
  nombre, nombreMax : string[10];
  sueldo, sueldoMax, sueldoAcum : real;
begin
  writeln('Ingrese n');
  readln(n);
  sueldoMax := -9999;
  sueldoAcum := 0;
  for i := 1 to n do
  begin
    writeln('Ingrese nombre');
    readln(nombre);
    writeln('Ingrese antiguedad');
    readln(antiguedad);
    sueldo := basico;
    if antiguedad <> 0 then
       case antiguedad of
            1..5 : sueldo := sueldo + basico*0.05;
            6..10 : sueldo := sueldo + basico*0.08;
            11..15 : sueldo := sueldo + basico*0.12;
       else
           sueldo := sueldo + basico*0.20;
    end;

    sueldo := sueldo - sueldo*0.11 - 500;

    writeln('Sueldo: $', sueldo:4:2);

    if sueldo > sueldoMax then
    begin
        sueldoMax := sueldo;
        nombreMax := nombre;
    end;

    sueldoAcum := sueldoAcum + sueldo;
  end;

  writeln('Empleado que mas cobra: ', nombreMax);
  if n <> 0 then
     writeln('Sueldo promedio: $', sueldoAcum/n:4:2);

  readln();
end.

