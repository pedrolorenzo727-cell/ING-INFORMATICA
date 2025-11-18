program ej11;
Const
  MAXVEC=100;

Type
  StNom= string[20];
  TVS= array[1..MAXVEC] of StNom;
  TVR= array[1..MAXVEC] of real;

Procedure CargaDatos(Var VNomb:TVS; Var VLanz1,VLanz2:TVR; Var N:byte);
Var
  Arch:text;
Begin
  N:=0;
  Assign(Arch,'ej11.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      N:=N+1;
      readln(Arch,VNomb[N]);
      readln(Arch,VLanz1[N],VLanz2[N]);
    end;
  Close(Arch);
end;

//Inciso a
Function SuperanLanz1conLanz2(VLanz1,VLanz2:TVR; N:byte):byte;
Var
  Cont,i:byte;
Begin
  Cont:=0;
  For i:=1 to N do
    If VLanz2[i]>VLanz1[i] then
      Cont:=Cont+1;
  SuperanLanz1ConLanz2:=Cont;
end;

Function RegistroMejorMarca(VLanz1,VLanz2:TVR; VNomb:TVS; N:byte):StNom;
Var
  i,indice:byte;
  MejorMarca:real;
Begin
  MejorMarca:=0;
  For i:=1 to N do
    Begin
      If VLanz1[i]> MejorMarca then
        Begin
          MejorMarca:=VLanz1[i];
          Indice:=i;
        end;
      If VLanz2[i]>MejorMarca then
        Begin
          MejorMarca:=VLanz2[i];
          Indice:=i;
        end;
    end;

  RegistroMejorMarca:=VNomb[indice];
end;
//Supongo que existe
Procedure InformaMarca(VNomb:TVS; VLanz1,VLanz2:TVR; N:byte; Nomb:StNom);
Var
  i:byte;
Begin
  i:=1;
  while VNomb[i]<Nomb do
    i:=i+1;
  writeln('La marca que realizo ',VNomb[i],' en el 1er lanz fue ',VLanz1[i]:0:2);
  writeln('La marca que realizo ',VNomb[i],' en el 2do lanz fue ',VLanz2[i]:0:2);
end;

//Supongo que puede no existir
{Procedure InformaMarca(VNomb:TVS; VLanz1,VLanz2:TVR; N:byte; Nomb:StNom);
Var
  i:byte;
Begin
  i:=1;
  while (i<N) and (VNomb[i]<Nomb) do
    i:=i+1;

  If VNomb[i]=Nomb then
    Begin
      writeln('La marca que realizo ',VNomb[i],' en el 1er lanz fue ',VLanz1[i]:0:2);
      writeln('La marca que realizo ',VNomb[i],' en el 2do lanz fue ',VLanz2[i]:0:2);
    end
  else
    writeln('El competidor ingresado es incorrecto');
end;
 }
Procedure GeneraVecSemifin(VLanz1,VLanz2:TVR; VNomb:TVS; N:byte; X:real; Var VSemi:TVS; Var M:Byte);
Var
  i:byte;
Begin
  M:=0;
  For i:=1 to N do
    If (VLanz1[i]>X) or (VLanz2[i]>X) then
      Begin
        M:=M+1;
        VSemi[M]:=VNomb[i];
      end;
end;

Procedure MuestraArreglo(Vec:TVS; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i],' ');
end;

Var
  VLanz1,VLanz2:TVR;
  VNomb,VSemi:TVS;
  N,M:byte;
  X:real;
  Nomb:STNom;

begin
  CargaDatos(VNomb,VLanz1,VLanz2,N);
  writeln('Superaron con el 2do lanzamiento el primero ',SuperanLanz1ConLanz2(VLanz1,VLanz2,N),' competidores');
  writeln('El nombre del atleta que registro la mejor marca es : ',RegistroMejorMarca(VLanz1,VLanz2,VNomb,N));
  writeln('Ingrese le nombre de un atleta');
  readln(Nomb);
  InformaMarca(VNomb,VLanz1,VLanz2,N,Nomb);
  writeln('Ingrese la marca a superar');
  readln(X);
  GeneraVecSemiFin(VLanz1,VLanz2,VNomb,N,X,VSemi,M);
  writeln('Los que pasaron a la semifinal son:');
  MuestraArreglo(VSemi,M);
  readln;
end.

