program ej9;
Const
  MAXELEM=50;

Type
  TMC=array[1..MAXELEM,1..MAXELEM] of char;
  TMW=array[1..MAXELEM,1..MAXELEM] of word;

Procedure CargaEstructuras(Var T1:TMC; Var T2:TMW; Var N:byte);
Var
  Blanco:char;
  i,j:byte;
  Arch:text;
Begin
  Assign(Arch,'ej9.txt'); reset(Arch);
  readln(Arch,N);
  For i:=1 to N do
    Begin
      For j:=1 to N do
        read(Arch,T1[i,j],T2[i,j],Blanco);
      readln(Arch);
    end;
  Close(Arch);
end;

//Inciso A
Function ColorPred(T1:TMC; N:byte):char;
Var
  i,j,ContA,ContR:byte;
Begin
  ContA:=0;
  ContR:=0;
  For i:=1 to N do
    For j:=1 to N do
      If T1[i,j]='A' then
        ContA:=ContA+1
      else
        ContR:=ContR+1;

  If ContR>ContA then
    ColorPred:='R'
  else
    If ContA>ContR then
      ColorPred:='A'
    else
      ColorPred:='I';
end;

//Inciso B
Function ColorMasFichas(T1:TMC; T2:TMW; N:byte): char;
Var
  i,j,AcumA,AcumR:byte;
Begin
  AcumA:=0;
  AcumR:=0;
  For i:=1 to N do
    For j:=1 to N do
      If T1[i,j]='A' then
        AcumA:=AcumA + T2[i,j]
      else
        AcumR:=AcumR + T2[i,j];

  If AcumR>AcumA then
    ColorMasFichas:='R'
  else
    If AcumA>AcumR then
      ColorMasFichas:='A'
    else
      ColorMasFichas:='I';
end;

//Inciso C
{Function Cols1SoloColor(T1:TMC; N:byte):byte;
Var
  i,j,Cont:byte;
Begin
  Cont:=0;
  For j:=1 to N do
    Begin
      i:=2;
      while (i<N) and (T1[i,j]=T1[1,j]) do
        i:=i+1;
      If T1[i,j]=T1[1,j] then
        Cont:=Cont+1;
    end;

  Cols1SoloColor:=Cont;
end;
 }
Function Cols1SoloColorRec(T1:TMC; i,j,N:byte):byte;
Begin
  If j=0 then
    Cols1SoloColorRec:=0
  else
    If T1[i,j]<>T1[i+1,j] then
        Cols1SoloColorRec:=Cols1SoloColorRec(T1,N-1,j-1,N)
    else
      If i=1 then
        Cols1SoloColorRec:=Cols1SoloColorRec(T1,N-1,j-1,N)+1
      else
        Cols1SoloColorRec:=Cols1SoloColorRec(T1,i-1,j,N)
end;

Var
  T1:TMC; T2:TMW;
  N:byte;
  C:char;

begin
  CargaEstructuras(T1, T2, N);
  C:=ColorPred(T1, N);
  If C='I' then
    writeln('Los colores estan repartidos de manera equitativa')
  else
    writeln('El color predominante es ',C);
  C:=ColorMasFichas(T1, T2, N);
  If C='I' then
    writeln('Los colores poseen la misma cantidad de fichas')
  else
    writeln('El color con mas fichas es ',C);
  writeln('La cantidad de columnas de un solo color son ',Cols1SoloColorRec(T1, N-1, N, N));
  readln;
end.

