program ej3;
CONST
  DtoPrev=0.11;
  DtoCobMed=0.05;
  Hora=200;

VAR
  Neto,Bruto,X:real;

begin
  writeln('Ingrese cantidad de horas trabajadas');
  readln(X);
  Bruto:=X*Hora;
  writeln('El sueldo bruto es $',Bruto:3:2);
  writeln('El sueldo neto es $',Bruto - (Bruto*DtoPrev)- (Bruto*DtoCobMed);:3:2);
  readln;
end.

