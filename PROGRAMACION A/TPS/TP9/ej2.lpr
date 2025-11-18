program ej2;
Const
  MAX=1000;
Type
  St14=string[14];

  TregTarj=record
    NroTar:word;
    NomProp:St14;
    Tope,GastoDelMes:real;
  end;

  TregRech=record
    NroTar,CodOper:word;
    Monto:real;
  end;

  TarTJ= file of TregTarj;
  TarRE= file of TregRech;

  TVW=array[0..MAX] of word;

Procedure CargaTarjetas(Var ATar:TarTJ);
Var
  AEnt:text; Car:char;
  R:TregTarj;
Begin
  rewrite(ATar); assign(AEnt,'ej2.txt'); reset(AEnt);
  while not eof(AEnt) do
    Begin
      readln(AEnt,R.NroTar,Car,R.NomProp,R.Tope,R.GastoDelMes);
      write(ATar,R);
    end;
  Close(ATar); Close(AEnt);
end;

Procedure CargaTabla(Var ATar:TarTJ; Var Tabla:TVW);
Var
  R:TregTarj;
  i:word;
Begin
  reset(ATar); i:=0;
  while not eof(ATar) do
    Begin
      read(ATar,R);
      Tabla[i]:=R.NroTar;
      i:=i+1;
    end;
  Close(ATar);
end;

Function BuscaTarjeta(Tabla:TVW; Nro:word):word; //Supongo que siempre encuentra
Var
  i:word;
Begin
  i:=0;
  while Tabla[i]<Nro do
    i:=i+1;
  BuscaTarjeta:=i;
end;

Procedure ActualizaGastos(Var ATar:TarTJ; Tabla:TVW; Var ARech:TarRE);
Var
  Monto:real;
  NroT,CodOp:word;
  ArchOp:text;
  R:TregTarj;
  Rech:TregRech;
Begin
  reset(ATar); rewrite(ARech); Assign(ArchOp,'ej2operaciones.txt'); reset(ArchOp);
  while not eof(ArchOp) do
    Begin
      readln(ArchOp,NroT,CodOp,Monto);
      Seek(ATar,BuscaTarjeta(Tabla,NroT));
      read(ATar,R);
      If R.GastoDelMes+Monto<=R.Tope then
        Begin
          R.GastoDelMes:=R.GastoDelMes+Monto;
          Seek(ATar,FilePos(ATar)-1);
          write(ATar,R);
        end
      else
        Begin
          Rech.NroTar:=NroT;
          Rech.CodOper:=CodOp;
          Rech.Monto:=Monto;
          write(ARech,Rech);
        end;
    end;
  Close(ATar); Close(ArchOp); Close(ARech);
end;

Procedure Muestra(Var ATar:TarTJ);
Var
  R:TregTarj;
Begin
  reset(ATar);
  while not eof(ATar) do
    begin
      read(ATar,R);
      writeln(R.NroTar,R.NomProp:20,R.Tope:10:2,R.GastoDelMes:10:2);
    end;
  Close(ATar);
end;

Procedure MuestraRech(Var ARech:TarRE);
Var
  R:TregRech;
Begin
  reset(ARech);
  while not eof(ARech) do
    begin
      read(ARech,R);
      writeln(R.NroTar,R.CodOper:6,R.Monto:10:2);
    end;
  Close(ARech);
end;

Var
  ATar:TarTJ; ARech:TarRE;
  Tabla:TVW;
begin
  Assign(ATar,'TARJETAS.DAT'); Assign(ARech,'RECHAZADOS.DAT');
  CargaTarjetas(ATar);
  Muestra(ATar); writeln;
  CargaTabla(ATar, Tabla);
  ActualizaGastos(ATar, Tabla, ARech);
  Muestra(ATar); writeln;
  MuestraRech(ARech);
  readln;

end.

