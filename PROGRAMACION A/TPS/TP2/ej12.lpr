program ej12;
Var
  DiaDelMes:byte;

begin
  writeln('Ingrese un dia del mes (Entre 1 y 31)');
  readln(DiaDelMes);
  //Partimos de que el 1 es lunes
  Case DiaDelMes of
    1,8,15,22,29: writeln('El dia ',DiaDelMes,' es Lunes');
    2,9,16,23,30: writeln('El dia ',DiaDelMes,' es Martes');
    3,10,17,24,31:  writeln('El dia ',DiaDelMes,' es Miercoles');
    4,11,18,25:  writeln('El dia ',DiaDelMes,' es Jueves');
    5,12,19,26:  writeln('El dia ',DiaDelMes,' es Viernes');
    6,13,20,27:  writeln('El dia ',DiaDelMes,' es Sabado');
    7,14,21,28:  writeln('El dia ',DiaDelMes,' es Domingo');
  else
    writeln('Dia erroneo');
  end;

  readln;
end.

