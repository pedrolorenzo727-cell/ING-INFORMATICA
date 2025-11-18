program ej4;
Type
  St4=string[4];
  TregSTK=record
    CodArt:St4;
    Talle:char;
    Color:byte;
    CantPren:word;
    Precio:Real;
  end;

  TarSTK= file of TregSTK;

Procedure CargaStock(Var AStock:TarSTK);
Var
  R:TregSTK;  Car:char;
  ArchE:text;
Begin
  rewrite(AStock); Assign(ArchE,'ej4Stock.txt'); reset(ArchE);
  while not eof(ArchE) do
    Begin
      readln(ArchE,R.CodArt,Car,R.Talle,R.Color,R.CantPren,R.Precio);
      write(AStock,R);
    end;
  Close(ArchE); Close(AStock);
end;

Procedure Listado(Var AStock:TarSTK);
Var
  CodAct:St4;
  TalleAct:char;
  Cant,CantTotal,CantNegras:word;
  Precio:real;
  R:TregSTK;
Begin
  reset(AStock); CantNegras:=0; CantTotal:=0;
  read(AStock,R);
  writeln('          Stock De Prendas');
  while not eof(AStock) do
    Begin
      CodAct:=R.CodArt; writeln('Codigo: ',CodAct);
      writeln('Talle     Cantidad     Precio Costo');
      while CodAct=R.CodArt do
        Begin
          Cant:=0; Precio:=0;
          TalleAct:=R.Talle;
          while (CodAct=R.CodArt) and (TalleAct=R.Talle) do
            Begin
              Cant:=Cant+R.CantPren;
              Precio:=Precio+R.Precio*R.CantPren;
              If R.Color=1 then
                CantNegras:=CantNegras+Cant;
              read(AStock,R);
            end;
          writeln(TalleAct:3,Cant:12,Precio:18:2);
          CantTotal:=CantTotal+Cant;
        end;
    end;
  writeln('Cantidad total: ',CantTotal);
  If CantTotal<>0 then
    writeln('Porcentaje de Prendas Negras: ',CantNegras/CantTotal*100:4:2,'%')
  else
    writeln('No se registraron Prendas');
  Close(AStock);
end;

Var
  AStock:TarSTK;

Begin
  Assign(AStock,'STOCK.DAT');
  CargaStock(AStock);
  Listado(AStock);
  Readln;
end.

