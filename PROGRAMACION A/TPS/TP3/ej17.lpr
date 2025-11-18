program ej17;
Const
  DtoPromo=0.90;
Var
  Arch:text;
  SoloOF:boolean;
  Nombre,NombreMasArtDto:string[5];
  i,CantArt,CantArtDto,MaxArtDto,CantSoloOF:byte;
  PrecioBase,ImporteNeto,ImporteBruto,TotalDto:real;
  Promo:char;

begin
  Assign(Arch,'ej17.txt'); reset(Arch);
  MaxArtDto:=0;
  CantSoloOF:=0;
  readln(Arch,Nombre);
  while Nombre<>'*****' do
    Begin
      readln(Arch,CantArt);
      SoloOf:=True;
      CantArtDto:=0;
      ImporteNeto:=0;
      ImporteBruto:=0;
      TotalDto:=0;
      For i:=1 to CantArt do
        Begin
          readln(Arch,PrecioBase);
          readln(Arch,Promo);
          ImporteBruto:=ImporteBruto+PrecioBase;
          If Promo='S' then
            Begin
              CantArtDto:=CantArtDto+1;
              TotalDto:=TotalDto+PrecioBase*DtoPromo;
              ImporteNeto:=ImporteNeto + PrecioBase*0.90;
            end
          else
            Begin
              SoloOf:=False;
              ImporteNeto:=ImporteNeto+PrecioBase;
            end;
        end;

      //Inciso a
      writeln('Monto total $',ImporteBruto:0:2,' Total Descuento $',TotalDto:0:2,' Precio final a pagar $',ImporteNeto:0:2);

      If CantArtDto>MaxArtDto then
        Begin
          MaxArtDto:=CantArtDto;        //Controla si hay un nuevo maximo de comprador de art en dto
          NombreMasArtDto:=Nombre;
        end;
      If SoloOf then
        CantSoloOf:=CantSoloOf+1;   //Si solo compro en oferta lo suma

      readln(Arch,Nombre);
    end;
  //Inciso B
  writeln('El cliente que compro mas articulos en oferta fue ',NombreMasArtDto);

  //Inciso C
  writeln(CantSoloOf,' cliente/s compraron solo articulos en oferta');
  readln;
  Close(Arch);
end.

