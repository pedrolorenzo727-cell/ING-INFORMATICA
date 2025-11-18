program ej16;
Var
  Patente,PatMasViajes:string[7];
  Arch:text;
  N,CantViajes,MasViajes,i:byte;
  KM,AcumKM,MinKM,LitCombus,TotLitrosMenorKM:real;


begin
  MasViajes:=0;
  MinKm:=0;
  Assign(Arch,'ej16.txt'); reset(Arch);
  readln(Arch,N);
  For i:=1 to N do
    Begin
      CantViajes:=0;
      AcumKM:=0;
      readln(Arch,Patente);
      readln(Arch,LitCombus);
      readln(Arch,KM);
      while KM<>0 do
        Begin
          CantViajes:=CantViajes+1;
          AcumKM:=AcumKm+KM;
          readln(Arch,KM);
        end;
      If CantViajes>MasViajes then
        Begin
          PatMasViajes:=Patente;
          MasViajes:=CantViajes;
        end;
      If AcumKm<MinKm then
        Begin
          TotLitrosMenorKM:=LitCombus;
          MinKm:=AcumKm;
        end;
      writeln('El consumo del vehiculo ',i,' fue de ',LitCombus/AcumKm:0:2,' litros por km');
    end;
  writeln('');
  writeln('La patente del vehiculo que mas viajes hizo es ',PatMasViajes);
  writeln('El auto que hizo menos km consumio ',TotLitrosMenorKm:0:2,' litros');
  readln;
  Close(Arch);
end.

