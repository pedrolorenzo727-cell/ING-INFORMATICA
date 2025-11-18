program ej10;
CONST
  Basico=1350;
  Peli=200;
  Deport=270;
  Internet=800;
  InternetPlus=0.20;
  Grabar=150;
  Bonific=0.75;
Var
  Cable,PaqPeli,PaqDep,Inter,InterPlus,GrabProg:char;
  Importe:real;
begin
  Importe:=0;
  writeln('Desea adquirir el servicio de cable?(S N)');
  readln(Cable);
  If UpCase(Cable)='S' then
    Begin
      Importe:=Importe+Basico;
      writeln('Desea adquirir el paq de peliculas?');
      readln(PaqPeli);
      If UpCase(PaqPeli)='S' then
        Importe:=Importe+Peli;

      writeln('Desea adquirir el paquete de deportes?');
      readln(PaqDep);
      If UpCase(PaqDep)='S' then
        Importe:=Importe+Deport;
    end;

  Writeln('Desea adquirir el servicio de internet?');
  readln(Inter);
  If UpCase(Inter)='S' then
    Begin
      Importe:=Importe + Internet;
      writeln('Desea 10MB y WIFI?');
      readln(InterPlus);
      If UpCase(InterPlus)='S' then
        Importe:=Importe+Internet*InternetPlus;

      writeln('Desea la opcion de grabar programas?');
      readln(GrabProg);
      If UpCase(GrabProg)='S' then
        Importe:=Importe + Grabar;
    end;

  If (UpCase(Cable)='S') and (UpCase(Inter)='S') then
    Importe:=Importe*Bonific;
  writeln('El impote total a pagar es $',Importe:4:1);
  readln;

end.

