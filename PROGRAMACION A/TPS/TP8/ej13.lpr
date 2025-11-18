program ej13;
Const
  MAXP=250;
  MAXL=50;

Type
  TMB=array[1..MAXP,1..MAXL] of Byte;
  TVW=array[1..MAXP] of word;

Procedure InicializaMatriz(Var Mat:TMB; i,j,M:byte);
Begin
  If i>0 then
    Begin
      Mat[i,j]:=0;
      If j>1 then
        InicializaMatriz(Mat,i,j-1,M)
      else
        InicializaMatriz(Mat,i-1,M,M);
    end;
end;

Procedure CargaEstructuras(Var MSuben,MBajan:TMB; Var N,M:byte);
Var
  i,j,Sub,Baj:byte;
  Arch:text;
Begin
  Assign(Arch,'ej13.txt'); reset(Arch);
  readln(Arch,N,M);
  InicializaMatriz(MSuben,N,M,M); InicializaMatriz(MBajan,N,M,M);
  while not eof(Arch) do
    Begin
      readln(Arch,i,j,Sub,Baj);
      MSuben[i,j]:=MSuben[i,j]+Sub;
      MBajan[i,j]:=MBajan[i,j]+Baj;
    end;
  Close(Arch);
end;

{Procedure MuestraMat(MBajan:TMB; N,M:byte);
Var
  i,j:byte;
Begin
  For i:=1 to N do
   Begin
     For j:=1 to M do
      write(MBajan[i,j]:3);
     writeln;
   end;
end;
}
//Inciso A
Function AcumParada(MBajan:TMB; i,j:byte):word;
Begin
  If j=1 then
    AcumParada:=MBajan[i,j]
  else
    AcumParada:=AcumParada(MBajan,i,j-1)+MBajan[i,j];
end;

Procedure PersPorParada(MBajan:TMB; i,N,M:byte; Var VCantBajan:TVW);
Begin
  If i<=N then
    Begin
      VCantBajan[i]:=AcumParada(MBajan,i,M);
      PersPorParada(MBajan,i+1,N,M,VCantBajan);
    end;
end;

Procedure MaxBajaron(VCantBajan:TVW; i:byte; Var Max:word; Var MaxI:byte);
Begin
  If i=1 then
    Begin
      Max:=VCantBajan[1];
      MaxI:=i;
    end
  else
    Begin
      MaxBajaron(VCantBajan,i-1,Max,MaxI);
      If VCantBajan[i]>Max then
        Begin
          Max:=VCantBajan[i];
          MaxI:=i;
        end;
    end;
end;

//Inciso B
Function MinSuben(MSuben:TMB; N,M:byte):integer;
Var
  i,j,Indice:byte;
  Min,Acum:integer;
Begin
  Indice:=0; Min:=1000;
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
Function SubenMenosBajan(VCantSuben,VCantBajan:TVW; i:byte):byte;
Begin
  If i=0 then
    SubenMenosBajan:=0
  else
    If VCantSuben[i]<0.4*VCantBajan[i] then
      SubenMenosBajan:=1+SubenMenosBajan(VCantSuben,VCantBajan,i-1)
    else
      SubenMenosBajan:=SubenMenosBajan(VCantSuben,VCantBajan,i-1);
end;

//Inciso D
Function NoRegisSubOBaj(MSuben,MBajan:TMB; i,j,N:byte):byte;
Begin
  If j=0 then
    NoRegisSubOBaj:=0
  else
    If (MSuben[i,j]=0) or (MBajan[i,j]=0) then
      NoRegisSubOBaj:=NoRegisSubOBaj(MSuben,MBajan,N,j-1,N) + 1
    else
      If i>1 then
        NoRegisSubOBaj:=NoRegisSubOBaj(MSuben, MBajan, i-1, j, N)
      else
        NoRegisSubOBaj:=NoRegisSubOBaj(MSuben, MBajan, N, j-1, N)
end;


//P.Principal
Var
  MSuben,MBajan:TMB; VCantBajan,VCantSuben:TVW;
  MaxI,i,N,M:byte; Max:word;
Begin
  CargaEstructuras(MSuben, MBajan, N, M);
  //MuestraMat(MBajan,N,M);
  //Inciso A
  PersPorParada(MBajan,1,N,M, VCantBajan);
  MaxBajaron(VCantBajan, N, Max, MaxI);
  writeln('La parada con mayor cantidad de pasajeros que bajaron es ',MaxI);
  //Inciso B
  writeln('La linea con menor cantidad de pasajeros que subieron es la ',MinSuben(MSuben, N, M));
  //Inciso C
  PersPorParada(MSuben,1,N,M, VCantSuben);
  writeln('La cantidad de paradas en las cuales el total de personas que subieron fue menor al 40% de las que bajaron fueron ',SubenMenosBajan(VCantSuben, VCantBajan, N));
  //Inciso D
  writeln('La cantidad de lineas que no registraron subida o bajada de pasajeros en alguna parada fueron ',NoRegisSubOBaj(MSuben, MBajan, N, M, N));
  readln;
end.

