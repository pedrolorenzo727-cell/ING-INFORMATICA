program ej3;
Const
  MAX=50;
Type
  St3=string[3];
  St20=string[20];

  TregEX= record
    CodEx:St3;
    Desc:St20;
    PBase,PComida:real;
  end;

  TregBOL= record
    CodEx:st3;
    NroBol:word;
    Comida:char;
  end;

  TarEX= file of TregEX;
  TarBOL= file of TregBOL;

  TVS=array[0..MAX] of St3;

Procedure CargaExcursion(Var AExc:TarEX);
Var
  R:TregEX;  Car:char;
  ArchE:text;
Begin
  rewrite(AExc); Assign(ArchE,'ej3Datos.txt'); reset(ArchE);
  while not eof(ArchE) do
    Begin
      readln(ArchE,R.CodEx,Car,R.Desc,R.PBase,R.PComida);
      write(AExc,R);
    end;
  Close(ArchE); Close(AExc);
end;

Procedure CargaBolete(Var ABol:TarBOL);
Var
  R:TregBOL;  Car:char;
  ArchE:text;
Begin
  rewrite(ABol); Assign(ArchE,'ej3Bolete.txt'); reset(ArchE);
  while not eof(ArchE) do
    Begin
      readln(ArchE,R.CodEx,R.NroBol,Car,R.Comida);
      write(ABol,R);
    end;
  Close(ArchE); Close(ABol);
end;

Procedure CargaTabla(Var Tabla:TVS; Var AExc:TarEX);
Var
  R:TregEX;
  i:byte;
Begin
  reset(AExc); i:=0;
  while not eof(AExc) do
    Begin
      read(AExc,R);
      Tabla[i]:=R.CodEx;
      i:=i+1;
    end;
  Close(AExc);
end;

Function BuscaCod(Tabla:TVS; Cod:st3):byte; //Supongo que siempre encuentra
Var
  i:byte;
Begin
  i:=0;
  while Tabla[i]<>Cod do
    i:=i+1;
  BuscaCod:=i;
end;

Procedure Listado(Var AExc:TarEX; Var ABol:TarBOL; Tabla:TVS);
Var
  CantBol,CantCom,CantComTOT:word; Total:real;
  ExcAct:st3;
  RB:TregBOL;
  RE:TregEX;
Begin
  reset(ABol); reset(AExc); read(ABol,RB);
  CantComTOT:=0;
  writeln('Excursion           Cantidad De Boletos    Cantidad de Comida    Monto Total');
  while not eof(ABol) do
    Begin
      ExcAct:=RB.CodEx;
      CantBol:=0; CantCom:=0; Total:=0;
      Seek(AExc,BuscaCod(Tabla,ExcAct)); read(AExc,RE);
      while ExcAct=RB.CodEx do
        Begin
          CantBol:=CantBol+1; Total:=Total+RE.PBase;
          If RB.Comida='S' then
            Begin
              CantCom:=CantCom+1;
              Total:=Total+RE.PComida;
            end;
          read(ABol,RB);
        end;
      writeln(RE.Desc,CantBol:11,CantCom:22,Total:20:2);
      CantComTot:=CantComTot+CantCom;
    end;
  writeln('% de turistas que contrataron excursion con comida: ',CantComTot/(FileSize(ABol)-1)*100:4:2,'%');
  Close(ABol);
  Close(AExc);
end;

Var
  AExc:TarEX; ABol:TarBOL;
  Tabla:TVS;

begin
  Assign(ABol,'BOLETERIA.DAT'); Assign(AExc,'EXCURSIONES.DAT');
  CargaExcursion(AExc);
  CargaBolete(ABol);
  CargaTabla(Tabla, AExc);
  Listado(AExc, ABol, Tabla);
  readln;
end.

