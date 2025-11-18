program ej13;
Procedure LeeDatos(Var HoraIn,MinIn,SegIn,SegTr:byte);
Begin
  writeln('Ingrese la hora inicial(Horas - minutos - segundos)');
  readln(HoraIn,MinIn,SegIn);
  writeln('Ingrese los segundos transcurridos');
  readln(SegTr);
end;

Procedure HoraFinal(HoraIn,MinIn,SegIn,SegTr:byte);
Var
  HoraFi,MinFi,SegFi:byte;
begin
  SegFi:=SegIn+SegTr;
  If SegFi>59 then
    Begin
      SegFi:=SegFi-60;
      MinFi:=MinIn+1;
      If MinFi=60 then
        Begin
          MinFi:=00;
          HoraFi:=HoraIn+1;
          If HoraFi=24 then
            HoraFi:=00;
        end
      else
        HoraFi:=HoraIn;
    end
  else
    Begin
      MinFi:=MinIn;
      HoraFi:=HoraIn;
    end;
    writeln('La hora final es (Hora - Min - Seg) es:', HoraFi,':',MinFi,':',SegFi);
end;
Var
  HoraIn,MinIn,SegIn,SegTr:byte;
Begin
  LeeDatos(HoraIn,MinIn,SegIn,SegTr);
  HoraFinal(HoraIn,MinIn,SegIn,SegTr);
  readln;
end.

