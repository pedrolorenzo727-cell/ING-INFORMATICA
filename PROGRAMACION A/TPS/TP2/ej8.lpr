program ej8;
Const
  DepAdi=250;
  Pileta=800;
  Recargo=1.05;
Var
  Cuota:real;
  Rta:char;
  Edad,CantDepAdi,DiaAbona:Byte;

begin
  writeln('Ingrese su edad');
  readln(Edad);
  writeln('Ingrese cuantos deportes adicionales realiza(0 en caso que no haga)');
  readln(CantDepAdi);
  If CantDepAdi<>0 then
    Begin
      writeln('¿Alguno de ellos es pileta?(S N)');
      readln(Rta);
    end;
  writeln('Ingrese el dia que abona');
  readln(DiaAbona);

  Case Edad of
    0..4: Cuota:=0;
    5..12: Cuota:=750;
    13..18: Cuota:=1200;
  else
    Cuota:=1800;
  end;
  If CantDepAdi>0 then
    If Rta='S' then
      Cuota:=Cuota+(CantDepAdi-1)*DepAdi+Pileta
    else
      Cuota:=Cuota+CantDepAdi*DepAdi;
  If DiaAbona>15 then
    Cuota:=Cuota*Recargo;
  writeln('El socio paga $',Cuota:5:2);
  readln;
end.

