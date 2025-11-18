program ej7;
CONST
  MAXZON=10;
  MAXPEL=40;

Type
  St4=string[4];
  St3=string[3];
  St20=string[20];

  TregCIN=record
    Cod:St4;
    Zona,Capacidad:byte;
  end;

  TregVTAS=record
    CodCin:st4;
    CodPel:st3;
    LocVend:byte;
  end;

  TregPEL=record
    CodPel:St3;
    CantFunc,Duracion:byte;
    TotLoc:word;
  end;

  TVZ=array[1..MAXZON] of word;
  TVP=array[1..MAXPEL] of TregPEL;

  TarCIN= file of TregCIN;
  TarVTAS= file of TregVTAS;

Procedure CargaCines(Var ArCin:TarCIN);
Var
  R:TregCIN;
  Arch:text;
Begin
  Assign(Arch,'ej7Cines.txt'); reset(Arch); rewrite(ArCin);
  while not eof(Arch) do
    Begin
      readln(Arch,R.Cod,R.Zona,R.Capacidad);
      write(ArCin,R);
    end;
  Close(Arch); Close(ArCin);
end;

Procedure CargaVentas(Var ArVtas:TarVTAS);
Var
  R:TregVTAS;
  Arch:text; Car:char;
Begin
  Assign(Arch,'ej7Ventas.txt'); reset(Arch); rewrite(ArVtas);
  while not eof(Arch) do
    Begin
      readln(Arch,R.CodCin,Car,R.CodPel,R.LocVend);
      write(ArVtas,R);
    end;
  Close(Arch); Close(ArVtas);
end;

Procedure CargaTabla(Var VPel:TVP; Var N:byte);
Var
  Arch:text; Car:char; Titulo:st20;
Begin
  Assign(Arch,'ej7Peliculas.txt'); reset(Arch);
  N:=0;
  while not eof(Arch) do
    Begin
      N:=N+1;
      VPel[N].CantFunc:=0;
      VPel[N].TotLoc:=0;
      readln(Arch,VPel[N].CodPel,Car,Titulo,VPel[N].Duracion);
    end;
  Close(Arch);
end;

Procedure IniciaVec(Var VLocPorZon:TVZ);
Var
  i:byte;
Begin
  for i:=1 to MAXZON do
    VLocPorZon[i]:=0;
end;

Function BuscaPos(VPel:TVP; Cod:st3):byte;
Var
  i:byte;
Begin
  i:=1;
  while VPel[i].CodPel<>Cod do
    i:=i+1;
  BuscaPos:=i;
end;

Function MinProm(VPel:TVP; N:byte):byte;
Var
  Min:real; i,PosMin:byte;
Begin
  Min:=10000;
  For i:=1 to N do
    If (VPel[i].CantFunc<>0) and (VPel[i].TotLoc/VPel[i].CantFunc < Min) then
      Begin
        Min:=VPel[i].TotLoc/VPel[i].CantFunc;
        PosMin:=i;
      end;
  MinProm:=PosMin;
end;

Procedure MuetsraVtasPorZona(VLocPorZon:TVZ);
Var
  i:byte;
begin
  writeln('Total de localidades vendidas por zona');
  for i:=1 to MAXZON do
    writeln('Zona ',i,VLocPorZon[i]:5);
end;

Procedure Listado(Var ArCin:TarCIN; Var ArVtas:TarVTAS; Var VLocPorZon:TVZ; Var VPel:TVP);
Var
  RC:TregCIN; RV:TregVTAS;
  PelAct:st3;
  i,NoProyPel,CantPel,CantFunc:byte;
  TotLocVend:word;
 Begin
   reset(ArCin); reset(ArVtas); read(ArCin,RC); read(ArVtas,RV);
   NoProyPel:=0;
   writeln('Cine  Cant.Peliculas  Cant.Funciones  Total Loc.Vendidas  %Ocup.Promedio');
   while not eof(ArCin) or not eof(ArVtas) do
     If RC.Cod=RV.CodCin then
       Begin
         CantPel:=0; CantFunc:=0; TotLocVend:=0;
         while RC.Cod=RV.CodCin do
           Begin
             CantPel:=CantPel+1; PelAct:=RV.CodPel;
             i:=BuscaPos(VPel,PelAct);
             while (RC.Cod=RV.CodCin) and (PelAct=RV.CodPeL) do
               Begin
                 CantFunc:=CantFunc+1; TotLocVend:=TotLocVend+RV.LocVend;
                 VPel[i].CantFunc:=VPel[i].CantFunc+1; VPel[i].TotLoc:=VPel[i].TotLoc+RV.LocVend;
                 VLocPorZon[RC.Zona]:=VLocPorZon[RC.Zona]+RV.LocVend;
                 read(ArVtas,RV);
               end;
           end;
         writeln(RC.Cod,CantPel:12,CantFunc:15,TotLocVend:19,TotLocVend/(CantFunc*RC.Capacidad)*100:18:2);
         read(ArCin,RC);
       end
   else
     If RC.Cod<RV.CodCin then
       Begin
         NoProyPel:=NoProyPel+1;
         read(ArCin,RC);
       end
       //NO AVANZA EN EL ARCHIVO DE CINES. OK listo
     else  //Posible error en codigo de cine en ArVtas
       while RC.Cod=RV.CodCin do
           read(ArVtas,RV);    // como el codigo de cine es clave secundaria, aca deberias hacer un while. Ok listo
 end;

   writeln('Cantidad de cines que no proyectaron ninguna pelicula: ',NoProyPel);
   //i:=MinProm(VPel, N);
   //writeln('Pelicula con menor promedio de localidades vendidas ',VPel[i].CodPel,' (',VPel[i].Duracion,')');
   //MuetsraVtasPorZona(VLocPorZon);
   //estas ultimas 3 sentencias, llevarlas al PP
   Close(ArCin);Close(ArVtas);
   //N:= 0;  NO tiene efecto para el PP pero si para este proc
 end;

Var
  ArCin:TarCIN; ArVtas:TarVTAS;
  VPel:TVP; N:byte; VLocPorZon:TVZ;
  i:byte;
begin
  Assign(ArCin,'CINES.DAT'); Assign(ArVtas,'VENTASCINE.DAT');
  CargaCines(ArCin); CargaVentas(ArVtas);
  CargaTabla(VPel, N); IniciaVec(VLocPorZon);
  Listado(ArCin, ArVtas, VLocPorZon, VPel);
  i:=MinProm(VPel, N);
  writeln('Pelicula con menor promedio de localidades vendidas ',VPel[i].CodPel,' (',VPel[i].Duracion,')');
  MuetsraVtasPorZona(VLocPorZon);
  //deberia invocarse a la muesra de VLocporZona Ok Listo
  readln;
end.

