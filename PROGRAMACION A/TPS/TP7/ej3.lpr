program ej3;
 Const
   MAXVEC=20;
 Type
   TregPuntos=record
     X,Y:integer;
     DistAl0:real;
     Cuad:byte;
   end;

   TVR=array[1..MAXVEC] of TregPuntos;

Procedure Cuadrante(Var VPuntos:TVR; i:byte);
Begin
  If VPuntos[i].X>0 then
    If  VPuntos[i].Y>0 then
      VPuntos[i].Cuad:=1
    else
      If VPuntos[i].Y<0 then
        VPuntos[i].Cuad:=4
      else
        VPuntos[i].Cuad:=0
  else
    If VPuntos[i].X<0 then
      If VPuntos[i].Y>0 then
        VPuntos[i].Cuad:=2
      else
        If VPuntos[i].Y<0 then
          VPuntos[i].Cuad:=3
        else
          VPuntos[i].Cuad:=0
    else
      VPuntos[i].Cuad:=0;
end;

Procedure CargaEstructura(Var VPuntos:TVR; Var N:byte);
Var
  Arch:text;
Begin
  Assign(Arch,'ej3.txt'); reset(Arch);
  N:=0;
  while not eof(Arch) do
    Begin
      N:=N+1;
      readln(Arch,VPuntos[N].X,VPuntos[N].Y);
      VPuntos[N].DistAl0:=sqrt(sqr(VPuntos[N].X)+sqr(VPuntos[N].Y));
      Cuadrante(VPuntos, N);
    end;
  Close(Arch);
end;

Function MasCercano(VPuntos:TVR; N:byte):byte;
Var
  i,indice:byte;
  Min:real;
Begin
  Min:=VPuntos[1].DistAl0; Indice:=1;
  for i:=2 to N do
    If VPuntos[i].DistAl0<Min then
      Begin
        Min:=VPuntos[i].DistAl0;
        Indice:=i;
      end;
  MasCercano:=Indice;
end;

Function MasLejano(VPuntos:TVR; N:byte):byte;
Var
  i,indice:byte;
  Max:real;
Begin
  Max:=VPuntos[1].DistAl0; Indice:=1;
  for i:=2 to N do
    If VPuntos[i].DistAl0>Max then
      Begin
        Max:=VPuntos[i].DistAl0;
        Indice:=i;
      end;
  MasLejano:=Indice;
end;

Procedure PorcentajePorCuad(VPuntos:TVR; N:byte);
Var
  i,Cuad1,Cuad2,Cuad3,Cuad4,SinCuad:byte;
Begin
  Cuad1:=0; Cuad2:=0; Cuad3:=0; Cuad4:=0; SinCuad:=0;
  For i:=1 to N do
    Case VPuntos[i].Cuad of
      0:  SinCuad:=SinCuad+1;
      1:  Cuad1:=Cuad1+1;
      2:  Cuad2:=Cuad2+1;
      3:  Cuad3:=Cuad3+1;
      4:  Cuad4:=Cuad4+1;
    end;

  writeln('El porcentaje de puntos en el cuadrante 1 es ',Cuad1/N*100:0:2,'%');
  writeln('El porcentaje de puntos en el cuadrante 2 es ',Cuad2/N*100:0:2,'%');
  writeln('El porcentaje de puntos en el cuadrante 3 es ',(Cuad3/N)*100:0:2,'%');
  writeln('El porcentaje de puntos en el cuadrante 4 es ',(Cuad4/N)*100:0:2,'%');
  writeln('El porcentaje de puntos que no se encuentran en ningun cuadrante es el ',(SinCuad/N)*100:0:2,'%');
end;

Function Distancia(X1,X2,Y1,Y2:integer):real;
Begin
  Distancia:=sqrt(sqr(X2-X1)+sqr(Y2-Y1));
end;

Var
  VPuntos:TVR;
  i,N:byte;
  X1,X2,Y1,Y2:integer;
begin
  CargaEstructura(VPuntos, N);
  i:=MasCercano(VPuntos,N);
  writeln('El punto mas cercano al centro es el (',VPuntos[i].X,';',VPuntos[i].Y,')');
  i:=MasLejano(VPuntos, N);
  writeln('El punto mas lejano al centro es el (',VPuntos[i].X,';',VPuntos[i].Y,')');
  PorcentajePorCuad(VPuntos, N);
  writeln('Ingrese dos puntos (X1,Y1,X2,Y2)');
  readln(X1,Y1,X2,Y2);
  writeln('La distancia entre ellos es ',Distancia(X1,X2,Y1,Y2):0:2);
  readln;
end.

