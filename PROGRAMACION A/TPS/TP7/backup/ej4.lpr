program ej4;
Const
  MAXVEC=50;

Type
  St22=string[22];
  TregEq=record
    Nombre:st22;
    Puntaje:byte;
    Perdio:boolean;
  end;

  TVR=array[1..MAXVEC]of TregEq;

Procedure CargaEstructuras(Var VEquipos:TVR; Var N:byte);
Var
  Arch:text;
  i,j,Puntos,CantJug:byte;
  Extra,Result:char;
Begin
  Assign(Arch,'ej4.txt'); reset(Arch);
  readln(Arch,N);
  For i:=1 to N do
    Begin
      Puntos:=0;
      read(Arch,VEquipos[i].Nombre,CantJug,Extra);
      VEquipos[i].Perdio:=False;
      For j:=1 to CantJug do
        Begin
          Read(Arch,Result,Extra);
          If Result='G' then
            Puntos:=Puntos+3
          else
            If Result='E' then
              Puntos:=Puntos+1
            else
              VEquipos[i].Perdio:=True;
        end;
      VEquipos[i].Puntaje:=Puntos;
      readln(Arch);
    end;
  Close(Arch);
end;

Procedure Listado(VEquipos:TVR; N:byte);
Var
  i:byte;
Begin
  writeln('    Nombre del club       Puntaje Obtenido');
  For i:=1 to N do
    writeln(VEquipos[i].Nombre:22,VEquipos[i].Puntaje:12);
end;

Function MaxPuntaje(VEquipos:TVR; N:byte):byte;
Var
  Max,i:byte;
Begin
  Max:=VEquipos[1].Puntaje;
  For i:=2 to N do
    If VEquipos[i].Puntaje>Max then
      Max:=VEquipos[i].Puntaje;

  MaxPuntaje:=Max;
end;

Procedure ListaPunteros(VEquipos:TVR; N:byte; Max:byte);
Var
  i:byte;
Begin
  writeln('El o los punteros de la tabla con ',Max,' puntos son:');
  for i:=1 to N do
    If VEquipos[i].Puntaje=Max then
      writeln(VEquipos[i].Nombre);
end;

Function CuentaNoPerdieron(VEquipos:TVR; N:byte):byte;
Var
  cont,i:byte;
Begin
  Cont:=0;
  for i:=1 to N do
    If Not VEquipos[i].Perdio  then
      Cont:=Cont+1;
  CuentaNoPerdieron:=Cont;
end;

Var
  VEquipos:TVR;
  N,Max:byte;
begin
  CargaEstructuras(VEquipos,N);
  Listado(VEquipos,N );
  Max:=MaxPuntaje(VEquipos,N);
  ListaPunteros(VEquipos,N,Max);
  If n<>0 then
    writeln('El porcentaje de equipos que no perdieron ningun partido es el ',CuentaNoPerdieron(VEquipos,N)*100/N,'%')
  else
    writeln('No se registraron equipos');
  readln;
end.

