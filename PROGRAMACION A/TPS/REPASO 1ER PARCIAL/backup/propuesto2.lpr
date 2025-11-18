program propuesto2;
CONST
  MAXVEC=150;
  Dias=15;

Type
  St4=string[4];
  TVS=array[1..MAXVEC] of st4;
  TVR=array[1..MAXVEC] of real;
  TVB=array[1..MAXVEC] of byte;

Function BuscaTambo(VCod:TVS; Codigo:st4; N:byte):byte;
Var
  i:byte;
Begin
  i:=1;
  while (i<N) and (VCod[i]<>Codigo) do
    i:=i+1;
  if VCod[i]=Codigo then
    BuscaTambo:=i
  else
    BuscaTambo:=0;
end;

Procedure GeneraArreglos(Var VCod:TVS; Var VTot:TVR; Var VEntregas:TVB; Var N:byte);
Var
  Arch:text;
  i,Dia:byte;
  Litros:real;
  Codigo:st4;

Begin
  Assign(Arch,'propuesto2.TXT'); reset(Arch);
  N:=0;
  while not eof(Arch) do
    Begin
      readln(Arch,Codigo,Dia,Litros);
      i:=BuscaTambo(VCod, Codigo, N);
      If i=0 then
        Begin
          N:=N+1;
          VCod[N]:=Codigo;
          VTot[N]:=Litros;
          VEntregas[N]:=1;
        end
      else
        Begin
          VTot[i]:=VTot[i]+Litros;
          VEntregas[i]:=VEntregas[i]+1;
        end;
    end;
  Close(Arch);
End;

//Inciso A
Function EntregoMasLeche(VTot:TVR; VCod:TVS; N:byte):st4;
Var
  Max:real;
  i,Indice:byte;
Begin
  Max:=VTot[1]; Indice:=1;
  for i:=2 to N do
    If VTot[i]>Max then
      Begin
        Max:=VTot[i];
        Indice:=i;
      end;
  EntregoMasLeche:=VCod[Indice];
End;

//Inciso B
Function SuperanX(VTot:TVR; VEntregas:TVB; N:byte; X:real):byte;
Var
  i,Cont:byte;
begin
  Cont:=0;
  For i:=1 to N do
    If (VTot[i]/VEntregas[i])>X then
      Cont:=Cont+1;
  SuperanX:=Cont;
end;

Var
  VCod:TVS;
  VEntregas:TVB;
  VTot:TVR;
  i,N:byte;
  X:real;
  Codigo:st4;
Begin
  GeneraArreglos(VCod, VTot, VEntregas, N);
  writeln('El codigo del tambo que mas leche entrego a la compañia es ',EntregoMasLeche(VTot,VCod,N));
  writeln('Ingrese un promedio de litros a superar');
  readln(X);
  writeln('Superaron ',X:0:2,' litros de entrega ',SuperanX(VTot, N, X),' tambos');
  writeln('Ingrese un codigo'); readln(Codigo);
  i:=BuscaTambo(VCod, Codigo,N);
  If i<>0 then
    writeln('El total entregado es ',VTot[i]:0:2,' litros y el promedio diario entregado es ',VTot[i]/VEntregas[i]:0:2)
  else
    writeln('El cdigo ingresado no existe');
  readln;

end.

end.

