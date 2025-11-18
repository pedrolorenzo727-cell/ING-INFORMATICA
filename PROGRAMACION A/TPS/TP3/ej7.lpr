program ej7;
 Var
   N1,N2,N3,ContAluAP,ContAlu:byte;
   Prom:real;
   Arch:text;
   Nombre:string[3];
begin
  ContAlu:=0; ContAluAP:=0;
  Assign(Arch,'ej7.txt'); reset(Arch);
  read(Arch,Nombre);
  while Nombre<>'***' do
    Begin
      ContAlu:=ContAlu+1;
      readln(Arch,N1,N2,N3);
      Prom:=(N1+N2+N3)/3;
      writeln('El promedio del alumno ',Nombre,' es ',Prom:0:2,' y su condicion es:');
      If Prom>=4 then
        Begin
          writeln('Aprobado');
          ContAluAp:=ContAluAp+1;
        end
      else
        writeln('Desaprobado');
      read(Arch,Nombre);
    end;
  If ContAlu<>0 then
    writeln('El porcentaje de alumnos aprobados es ',ContAluAp/ContAlu*100:0:2,'%')
  else
    writeln('No se registraron Alumnos');
  readln;
  Close(Arch)
end.

