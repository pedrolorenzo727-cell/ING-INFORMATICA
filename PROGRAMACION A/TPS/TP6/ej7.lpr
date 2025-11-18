program ej7;
Const
  MAXP=250;
  MAXL=50;

Type
  TMB=array[1..MAXP,1..MAXL] of Byte;

Procedure InicializaMatriz(Var Mat:TMB; N,M:byte);
Var
  i,j:byte;
Begin
  For i:=1 to N do
   For j:=1 to M do
    Mat[i,j]:=0;
end;

Procedure CargaEstructuras(Var MSuben,MBajan:TMB; Var N,M:byte);
Var
  i,j,Sub,Baj:byte;
  Arch:text;
Begin
  Assign(Arch,'ej7.txt'); reset(Arch);
  readln(Arch,N,M);
  InicializaMatriz(MSuben,N,M); InicializaMatriz(MBajan,N,M);
  while not eof(Arch) do
    Begin
      readln(Arch,i,j,Sub,Baj);
      MSuben[i,j]:=MSuben[i,j]+Sub;
      MBajan[i,j]:=MBajan[i,j]+Baj;
    end;
  Close(Arch);
end;

//Inciso A
Function MaxBajan(MBajan:TMB; N,M:byte):byte;
Var
  i,j,Indice:byte;
  Max,Acum:integer;
begin
  Max:=-1;
  For i:=1 to N do
   Begin
     Acum:=0;
     For j:=1 to M do
       Acum:=Acum+MBajan[i,j];
     If Acum>Max then
       Begin
         Max:=Acum;
         Indice:=i;
       end;
   end;

  MaxBajan:=Indice;
end;

//Inciso B
Function MinSuben(MSuben:TMB; N,M:byte):integer;
Var
  i,j,Indice:byte;
  Min,Acum:integer;
Begin
  Min:=1000;
  For j:=1 to M do
   Begin
     Acum:=0;
     For i:=1 to N do
       Acum:=Acum+MSuben[i,j];
     If Acum<Min then
       Begin
         Min:=Acum;
         Indice:=j;
       end;
   end;

  MinSuben:=Indice;
end;

//Inciso C
Function Suben40MenosBajan(MSuben,MBajan:TMB; N,M:byte):byte;
Var
  i,j,Cont:byte;
  CantSuben,CantBajan:integer;
Begin
  Cont:=0;
  For i:=1 to N do
   Begin
     CantSuben:=0; CantBajan:=0;
     For j:=1 to M do
      Begin
        CantSuben:=CantSuben+MSuben[i,j];
        CantBajan:=CantBajan+MBajan[i,j];
      end;
     If CantSuben < (CantBajan*0.4) then
       Cont:=Cont+1;
   end;

  Suben40MenosBajan:=Cont;
end;

//Inciso D
Function NoRegisSubOBaj(MSuben,MBajan:TMB; N,M:byte):byte;
Var
  i,j,Cont:byte;
Begin
  Cont:=0;
  For j:=1 to M do
   Begin
     i:=1;
     while (i<N) and (MSuben[i,j] <> 0) and (MBajan[i,j] <> 0) do
       i:=i+1;
     If (MSuben[i,j]=0) or (MBajan[i,j]=0) then
       Cont:=cont+1;
   end;

  NoRegisSubOBaj:=Cont;
end;

//P.Principal
Var
  MSuben,MBajan:TMB;
  N,M:byte;
Begin
  CargaEstructuras(MSuben, MBajan, N, M);
  writeln('La parada con mayor cantidad de pasajeros que bajaron es ',MaxBajan(MBajan, N, M));
  writeln('La linea con menor cantidad de pasajeros que subieron es la ',MinSuben(MSuben, N, M));
  writeln('La cantidad de paradas en las cuales el total de personas que subieron fue menor al 40% de las que bajaron fueron ',Suben40MenosBajan(MSuben, MBajan, N, M));
  writeln('La cantidad de lineas que no registraron subida o bajada de pasajeros en alguna parada fueron ',NoRegisSubOBaj(MSuben, MBajan, N, M));
  readln;
end.

{Se deberia agregar un vector paralelo a Lineas o paradas
 que contenga la cantidad de veces que ascendio o descendio alguien}

