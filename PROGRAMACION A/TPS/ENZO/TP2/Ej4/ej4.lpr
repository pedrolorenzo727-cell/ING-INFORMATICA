program ej4;
var
  dia1, dia2, mes1, mes2, fechAnt, mes : byte;
  anio1, anio2 : word;
begin
     writeln('Ingrese primer fecha (Dia, mes y anio)');
     readln(dia1,mes1,anio1);
     writeln('Ingrese segunda fecha (Dia, mes y anio)');
     readln(dia2,mes2,anio2);
     fechAnt := 0; (*Para el caso que son iguales se mantiene en 0*)
     if anio1 < anio2 then
        fechAnt := 1
     else
       if anio2 < anio1 then
          fechAnt := 2
       else
         if mes1 < mes2 then
            fechAnt := 1
         else
             if mes2 < mes1 then
                fechAnt := 2
             else
                 if dia1 < dia2 then
                    fechAnt := 1
                 else
                     if dia2 < dia1 then
                        fechAnt := 2
                     else
                         begin
                              writeln('Las fechas son iguales');
                              mes := mes1;
                         end;

     if fechAnt = 1 then
        begin
             writeln('La primer fecha es mas antigua');
             mes := mes1;
        end
     else
         if fechAnt = 2 then
         begin
              writeln('La segunda fecha es mas antigua');
              mes := mes2;
         end;

     case mes of
          1..3 : writeln('La fecha pertenece al primer trimestre');
          4..6 : writeln('La fecha pertenece al segundo trimestre');
          7..9 : writeln('La fecha pertenece al tercer trimestre');
          10..12 : writeln('La fecha pertenece al cuarto trimestre');
     end;
     readln();
end.

