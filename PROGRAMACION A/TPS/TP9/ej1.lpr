program ej1;
Const
  MAX=30;
Type
  St15=string[15];
  TregPaq=record
    CodPaq:word;
    Peso,MontoAs:real;
    CodDest:byte;
  end;
  TregDes= record
    CodDest:byte;
    Descrip:St15;
  end;
  TarPaq= file of TregPaq;
  TarDes= file of TregDes;

  TregTabla=record
    CodDest:byte;
    Descrip:St15;
    Cant:word;
  end;

  TVReg=array[1..MAX] of TregTabla;

Procedure CargaArchivoDes(Var ArchDes:TarDes);
Var
  ArchE:text;
  R:TregDes;
Begin
  Assign(ArchE,'ej1Des.txt'); reset(ArchE);
  rewrite(ArchDes);
  while not eof(ArchE) do
    Begin
      Readln(ArchE,R.Descrip,R.CodDest);
      write(ArchDes,R);
    end;

  Close(ArchE);
  Close(ArchDes);
end;

{Procedure ListaArchivoDes(Var ArchDes:TarDes);
Var
  R:TregDes;
  i:byte;
Begin
  reset(ArchDes);
  For i:=1 to MAX do
    Begin
      Read(ArchDes,R); writeln(R.Descrip,R.CodDest:5);
    end;
  Close(ArchDes);
end;
 }
Procedure CargaArchivoPaq(Var ArchPaq:TarPaq);
Var
  ArchE:text;
  R:TregPaq;
Begin
  Assign(ArchE,'ej1Paq.txt'); reset(ArchE);
  rewrite(ArchPaq);
  while not eof(ArchE) do
    Begin
      Readln(ArchE,R.CodPaq,R.Peso,R.CodDest,R.MontoAs);
      write(ArchPaq,R);
    end;
  Close(ArchPaq);
  Close(ArchE);
end;

Procedure CargaTabla(Var ArchDes:TarDes; Var VTabla:TVReg);
Var
  R:TregDes;
  i:byte;
Begin
  Reset(ArchDes); i:=0;
  while not eof(ArchDes) do
    Begin
      read(ArchDes,R); i:=i+1;
      VTabla[i].Cant:=0; VTabla[i].CodDest:=R.CodDest; VTabla[i].Descrip:=R.Descrip;
    end;
  Close(ArchDes);
end;

Function BuscaCod(VTabla:TVReg; Cod:byte):byte; //Supone que siempre encuentra
Var
  i:byte;
Begin
  i:=1;
  while VTabla[i].CodDest <> Cod do
    i:=i+1;
  BuscaCod:=i;
end;

Procedure Listado( Var ArchPaq:TarPaq; VTabla:TVReg);
Var
  AcumPeso,TotMonto:real;
  R:TregPaq;
  i:byte;
Begin
  AcumPeso:=0; TotMonto:=0;
  reset(ArchPaq);
  while not eof(ArchPaq) do
    Begin
      read(ArchPaq,R);
      AcumPeso:=AcumPeso + R.Peso;
      TotMonto:=TotMonto + R.MontoAs;
      i:=BuscaCod(VTabla,R.CodDest);
      VTabla[i].Cant:=VTabla[i].Cant + 1;
    end;
  writeln('El peso promedio de los paquetes es ',AcumPeso/Filesize(ArchPaq):4:2);
  writeln('El total del monto asegurado de la carga a transportar es ',TotMonto:4:2);
  writeln('Destino          Cantidad de Paquetes');
  For i:=1 to MAX do
   writeln(VTabla[i].Descrip,VTabla[i].Cant:14);
  Close(ArchPaq);
end;


Var
  ArchDes:TarDes;
  ArchPaq:TarPaq;
  VTabla:TVReg;
begin
  Assign(ArchDes,'destino.dat'); Assign(ArchPaq,'PAQUETES.DAT');
  CargaArchivoDes(ArchDes); //ListaArchivoDes(ArchDes);
  CargaArchivoPaq(ArchPaq);
  CargaTabla(ArchDes,VTabla);
  Listado(ArchPaq,VTabla);
  readln;
end.

