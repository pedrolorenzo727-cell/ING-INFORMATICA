program ej4;
Var
  Dia1,Dia2,Mes1,Mes2,Mes,MasAntigua:byte;
  Anio1,Anio2:word;

begin
  writeln('Ingrese una fecha Dia,Mes,Anio');
  readln(Dia1,Mes1,Anio1);
  writeln('Ingrese otra fecha');
  readln(Dia2,Mes2,Anio2);
  MasAntigua:=0;
  If Anio1>Anio2 then
     MasAntigua:=2
  else
    If Anio1<Anio2 then
      MasAntigua:=1
    else
      If Mes1>Mes2 then
         MasAntigua:=2
      else
        If Mes1<Mes2 then
          MasAntigua:=1
        else
          If Dia1>Dia2 then
            MasAntigua:=2
          else
            If Dia1<Dia2 then
              MasAntigua:=1
            else
              Begin
                writeln('Las fechas ingresadas son iguales');
                Mes:=mes1;
              end;

If MasAntigua=1 then
  Begin
    Mes:=Mes1;
    writeln('La fecha mas antigua es la primera');
  end
else
  If MasAntigua=2 then
  Begin
    Mes:=Mes2;
    writeln('La fecha mas antigua es la segunda');
  end;

Case Mes of
     1..3: writeln('Pertenece al primer trimestre');
     4..6: writeln('Pertenece al segundo trimestre');
     7..9: writeln('Pertenece al tercer trimestre');
     10..12: writeln('Pertenece al cuarto trimestre');
end;
readln;
end.

