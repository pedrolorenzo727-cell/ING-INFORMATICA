program ej2;
Const
  Seguro=500;
  Basico=15000;
  CargasSociales=0.89;

Var
  N,i,Antiguedad:byte;
  Nombre,NombreMasCobra:string[12];
  Sueldo,AcumSueldo,Max:real;

begin
  Max:=0;AcumSueldo:=0;
  writeln('Ingrese la cant de empleados a los que le liquidara el sueldo');
  readln(N);
  For i:=1 to N do
    Begin
      writeln('Ingrese el nombre del empleado');
      readln(Nombre);
      writeln('Ingrese la antigueadad en años');
      readln(Antiguedad);

      Sueldo:=Basico;
      Case Antiguedad of
        0..5: Sueldo:=Sueldo + Sueldo*0.05;
        6..10: Sueldo:= Sueldo + Sueldo*0.08;
        11..15: Sueldo:=Sueldo + Sueldo*0.12;
      else
        Sueldo:=Sueldo + Sueldo*0.20;
      end;
      Sueldo:=Sueldo*CargasSociales - Seguro;
      AcumSueldo:=AcumSueldo+Sueldo;
      If Sueldo>Max then
        Begin
          NombreMasCobra:=Nombre;
          Max:=Sueldo;
        end;
      //Inciso a
      writeln('El empleado ',Nombre,' tiene un sueldo de ',Sueldo:5:2);
    end;
  writeln('El nombre del empleado que mas cobra es ',NombreMasCobra);
  If N<>0 then
    writeln('El sueldo promedio es ',AcumSueldo/N:5:2);
  readln;
end.

