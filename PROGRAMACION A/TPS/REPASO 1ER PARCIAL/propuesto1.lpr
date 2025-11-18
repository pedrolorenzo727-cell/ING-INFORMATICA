program propuesto1;
Const
  MAXVEC=100;

Type
  St4=string[4];
  TVR=array[1..MAXVEC] of real;
  TVS=array[1..MAXVEC] of St4;

Procedure CargaArreglos(Var VCod:TVS; Var VTot,VProm:TVR; Var N:byte);
Var
  Arch:text;
  Litros:real;
  CantDias,i:byte;

begin
  Assign(Arch,'propuesto1.TXT'); reset(Arch);
  readln(Arch,N);
  For i:=1 to N do
    Begin
      readln(Arch,VCod[i]);
      VTot[i]:=0;
      CantDias:=0;
      read(Arch,Litros);
      while Litros<>0 do
        Begin
          CantDias:=CantDias+1;
          VTot[i]:=VTot[i]+litros;
          read(Arch,Litros);
        end;
      If CantDias <>0 then
        VProm[i]:=VTot[i]/CantDias
      else
        VProm[i]:=0;
      readln(Arch);
      //writeln(VTot[i]:0:2,' ',VProm[i]:0:2,' ',VCod[i]);
    end;
  Close(Arch);
end;

//Inciso A
Function MasLecheEntrego(VCod:TVS; VTot:TVR; N:byte):ST4;
Var
  Max:real;
  i,Indice:byte;
Begin
  Max:=VTot[1]; Indice:=1;
  For i:=2 to N do
    If VTot[i]>Max then
      Begin
        Max:=VTot[i];
        Indice:=i;
      end;
  MasLecheEntrego:=VCod[indice];
end;

//Inciso B
Function SuperaronX(VProm:TVR; X:real; N:byte):byte;
Var
  i,Cont:byte;
Begin
  Cont:=0;
  For i:=1 to N do
    If VProm[i]>X then
      Cont:=Cont+1;
  SuperaronX:=Cont;
end;

Function BuscaCodigo(VCod:TVS; N:byte; Codigo:ST4):byte;
Var
  i:byte;
Begin
  i:=1;
  while (i<N) and (VCod[i]<>Codigo) do
    i:=i+1;
  If VCod[i]=Codigo then
    BuscaCodigo:=i
  else
    BuscaCodigo:=0;
end;

Var
  VCod:TVS;
  VProm,VTot:TVR;
  N,i:byte;
  Codigo:ST4;
  X:real;

Begin
  CargaArreglos(VCod, VTot, VProm, N);
  writeln('El codigo del tambo que mas leche entrego a la compañia es ',MasLecheEntrego(VCod,VTot,N));
  writeln('Ingrese un promedio de litros a superar');
  readln(X);
  writeln('Superaron ',X:0:2,' litros de entrega ',SuperaronX(VProm, X, N),' tambos');
  writeln('Ingrese un codigo'); readln(Codigo);
  i:=BuscaCodigo(VCod, N,Codigo);
  If i<>0 then
    writeln('El total entregado es ',VTot[i]:0:2,' litros y el promedio diario entregado es ',VProm[i]:0:2)
  else
    writeln('El codigo ingresado no existe');
  readln;

end.

