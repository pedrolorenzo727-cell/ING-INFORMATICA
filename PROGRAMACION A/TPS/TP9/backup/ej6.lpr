program ej6;
Const
  Comision= 0.005;
Type
  St15=string[15];
  TregMAE=record
    Legajo,FactMaxVta:word;
    NyA:St15;
    TotVentas,ImpMaxVta:real;
  end;

  TregVTAS=record
    Legajo,NroFact:word;
    Imp:real;
  end;

  TarMAE= file of TregMAE;
  TarVTAS= file of TregVTAS;

Procedure CargaMaestro(Var ArMae:TarMAE);
Var
  R:TregMAE;
  Arch:text; Car:char;
Begin
  Assign(Arch,'ej6AcumMensual.txt'); reset(Arch); rewrite(ArMae);
  while not eof(Arch) do
    Begin
      Readln(Arch,R.Legajo,Car,R.NyA,R.TotVentas,R.FactMaxVta,R.ImpMaxVta);
      write(ArMae,R);
    end;
  Close(Arch); Close(ArMae);
end;

Procedure CargaVentas(Var ArVtas:TarVTAS);
Var
  R:TregVTAS;
  Arch:text;
Begin
  Assign(Arch,'ej6Ventas.txt'); reset(Arch); rewrite(ArVtas);
  while not eof(Arch) do
    Begin
      readln(Arch,R.Legajo,R.NroFact,R.Imp);
      write(ArVtas,R);
    end;
  Close(Arch);Close(ArVtas);
end;

Procedure ActualizayLista(Var ArMae:TarMAE; Var ArVtas:TarVTAS; Nombre:St15);
Var
  Temp:TarMAE;
  RM:TregMAE; RV:TregVTAS;
Begin
  Assign(Temp,'Temp.DAT'); rewrite(Temp);
  reset(ArMae); reset(ArVtas);
  //necesita un archivos auxiliar
  writeln('Legajo    Comision');
  read(ArMae,RM); read(ArVtas,RV);
  while not eof(ArMae) or not eof(ArVtas) do
    //OJO la consigna pide actualizar el archivo de comisiones en base al de VENTAS
    If RM.Legajo=RV.Legajo then
      Begin
        while RM.Legajo=RV.Legajo do
          Begin
            RM.TotVentas:=RM.TotVentas + RV.Imp;
            If RV.Imp > RM.ImpMaxVta then
              Begin
                RM.ImpMaxVta:=RV.Imp;
                RM.FactMaxVta:=RV.NroFact;
              end;
              read(ArVtas,RV);
          end;
        writeln(RM.Legajo,RM.TotVentas*Comision:12:2);
        write(Temp,RM); read(ArMae,RM);
      end
    else
      If RM.Legajo<RV.Legajo then //El empleado no realizo ventas en el dia de la fecha
        Begin
          write(Temp,RM); Read(ArMae,RM);
        end
      else  //Legajo incorrecto
        Read(ArVtas,RV);     //seria mejor hacer un while
    //en el temporal no guarda el centinela
    write(Temp,RM);
    Close(ArMae); Close(ArVtas); Close(Temp);
    erase(ArMAE); rename(Temp,Nombre);
end;

Var
  ArMae:TarMAE; ArVtas:TarVTAS;
begin
  Assign(ArMae,'INFORMACIONEMPLEADOS.DAT'); Assign(ArVtas,'VENTAS.DAT');
  CargaMaestro(ArMae); CargaVentas(ArVtas);
  ActualizayLista(ArMae, ArVtas,'INFORMACIONEMPLEADOS.DAT');
  readln;
end.

