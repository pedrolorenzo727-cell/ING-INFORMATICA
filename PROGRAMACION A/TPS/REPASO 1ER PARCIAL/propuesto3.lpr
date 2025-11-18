program propuesto3;
Const
  MAXVEC=200;
  Precio=1;
  Recargo=1.50;
Type
  St15=string[15];
  TVR=array[1..MAXVEC] of real;
  TVB=array[1..MAXVEC] of byte;

Function Importe(VCant:TVB; Tipo:char; Num,N:byte):real;
Var
  AcumPrecio:real;
Begin
  AcumPrecio:=VCant[N]*Precio;
  Case tipo of
    'A': AcumPrecio:=AcumPrecio*2;
    'B': AcumPrecio:=AcumPrecio*3;
    'C': AcumPrecio:=AcumPrecio*5;
  end;
  If Num=2 then
    AcumPrecio:=AcumPrecio*Recargo;
  Importe:=AcumPrecio;
end;

Procedure GeneraArreglos(Var VCosto:TVR; Var VCant,VMasL:TVB; Var N:byte);
Var
  Arch:text;
  Tipo,Car:char;
  Num,ContCar,MaxCar:byte;

Begin
  Assign(Arch,'propuesto3.txt'); reset(Arch);
  N:=0;
  while not eof(Arch) do
    Begin
      read(Arch,Tipo,Num,Car);
      N:=N+1;
      VMasL[N]:=0; VCant[N]:=0;
      while (Car<>'.') do  //Analizo la frase
          If Car=' ' then
            read(Arch,Car)
          else
            Begin
              ContCar:=0;
              read(Arch,Car);
              while (Car<>'.') and (Car<>' ') do
                Begin
                  ContCar:=ContCar+1;
                  read(Arch,Car);
                end;
              VCant[N]:=VCant[N]+1;
              If ContCar>VMasL[N] then
                VMasL[N]:=ContCar;
            end;
      VCosto[N]:=Importe(VCant,Tipo,Num,N);  //Asigno el importe correspondiente a la frase
      readln(Arch);  //Paso a la siguiente linea en caso de ser eof sale del ciclo
    end;
  Close(Arch);
end;

Procedure MuestraArreglos(Vec1,Vec2:TVB; Vec3:TVR; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    writeln(Vec1[i],' ',Vec2[i],' ',Vec3[i]:0:2);
end;

Function MaxCosto(VMasL:TVB; VCosto:TVR; N:byte):real;
Var
  AcumCosto:real;
  ContMax,i,MasLarga:byte;
Begin
  AcumCosto:=VCosto[1]; ContMax:=1; MasLarga:=VMasL[1];
  For i:=2 to N do
    Begin
    If VMasL[i]=MasLarga then
      Begin
        AcumCosto:=AcumCosto+VCosto[i];
        ContMax:=ContMax+1;
      end
    else
      If VMasL[i]>MasLarga then
        Begin
          AcumCosto:=VCosto[i];
          ContMax:=1;
          MasLarga:=VMasL[i];
        end;
    end;
  MaxCosto:=AcumCosto/ContMax;
end;

Function BuscaFolleto(VCant:TVB; N,X:byte):byte;
Var
  i:byte;
Begin
  i:=1;
  while (i<N) and (VCant[i]<>X) do
    i:=i+1;
  If VCant[i]=X then
    BuscaFolleto:=i
  else
    BuscaFolleto:=0;
end;

Var
  VCant,VMasL:TVB;
  N,X,i:byte;
  VCosto:TVR;
begin
  GeneraArreglos(VCosto,VCant,VMasL,N);
  MuestraArreglos(VCant,VMasL,VCosto,N);
  writeln('El costo del folleto que contiene la palabra mas larga (o el costo promedio si hay mas de uno con la palabra mas larga) es ',MaxCosto(VMasL,Vcosto,N):0:2);
  writeln('Ingrese un entero positivo'); readln(X);
  i:=BuscaFolleto(VCant,N,X);
  if i<>0 then
    writeln('El costo del primer folleto que posee exactamente ',X,' palabras es de ',VCosto[i]:0:2)
  else
    writeln('No existe ningun folleto que contenga ',X,' palabras');

  readln;
end.

