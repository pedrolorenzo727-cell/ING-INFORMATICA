program ej7;
CONST
  Hom=1000;
  Muj=1200;
  IVA=1.21;
  DtoTalle=0.95;
  DtoMay=0.93;

Var
  N:byte;
  Importe:real;
  Talle,Genero:char;

begin
  writeln('Ingrese el genero de las camisas (H o M)');
  readln(Genero);
  Genero:=UpCase(Genero);
  writeln('Ingrese el talle de las camisas (S,M,L,X)');
  readln(Talle);
  Talle:=UpCase(Talle);
  writeln('Ingrese la cantidad de camisas a llevar');
  readln(N);

  If Genero='H' then
    Begin
      Importe:=Hom;
      If Talle='S' then
        Importe:=Importe*DtoTalle
    end
  else
    Begin
      Importe:=Muj;
      If Talle='X' then
        Importe:=Importe*DtoTalle;
    End;
  Importe:=Importe*IVA;

  If N>12 then
    Importe:=Importe*DtoMay;

  writeln('El importe total a facturar en la venta es $',Importe:4:2);
  readln;

end.

