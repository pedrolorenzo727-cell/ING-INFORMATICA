program ej14;
Const
  MAXVEC=200;

Type
  St7= string[7];
  TVS= array[1..MAXVEC] of St7;
  TVR= array[1..MAXVEC] of real;

Function BuscaPatente(VPat:TVS; N:byte; Patente:St7):byte;
Var
  i:byte;
Begin
  i:=1;
  while (i<=N) and (VPat[i]<>Patente) do
    i:=i+1;
  If i>N then
    BuscaPatente:=0
  else
    BuscaPatente:=i;
end;

Procedure CargaArreglos(Var VPat:TVS; Var VRecaud:TVR; Var N:byte);
Var
  Arch:text;
  Patente:St7;
  Recaudado:real;
  Indice:byte;
Begin
  N:=0;
  Assign(Arch,'ej14.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      readln(Arch,Patente,Recaudado);
      Indice:=BuscaPatente(VPat,N,Patente);
      If indice =0 then
        Begin
          N:=N+1;
          VPat[N]:=Patente;
          VRecaud[N]:=Recaudado;
        end
      else
        VRecaud[indice]:=VRecaud[indice]+Recaudado;
    end;
  Close(Arch);
end;

//Inciso A
Function PromedioRecaudado(VRecaud:TVR; N:byte):real;
Var
  i:byte;
  Acum:real;
Begin
  Acum:=0;
  For i:=1 to N do
    Acum:=Acum+VRecaud[i];

  PromedioRecaudado:=Acum/N;
end;

//Inciso B
Procedure SuperaronX(VPat:TVS; VRecaud:TVR; N:byte; X:real);
Var
  i:byte;
Begin
  for i:=1 to N do
    If VRecaud[i]>X then
      write(VPat[i],' ');
end;

//Inciso C
Function MenosRecaudo(VPat:TVS; VRecaud:TVR; N:byte):St7;
Var
  Min:real;
  i,Indice:byte;
Begin
  Min:=VRecaud[1]; Indice:=1;
  For i:=2 to N do
    If VRecaud[i]<Min then
      Begin
        Min:=VRecaud[i];
        Indice:=i;
      end;
  MenosRecaudo:=VPat[Indice];
end;

Var
  VRecaud:TVR;
  VPat:TVS;
  N:byte;
  X:real;
begin
  CargaArreglos(VPat,VRecaud,N);
  writeln('El promedio recaudado por auto es $',PromedioRecaudado(VRecaud,N):0:2);
  writeln('Ingrese un valos a superar en $');
  readln(X);
  writeln('Las patentes de los vehiculos que superaron en la recaudacion $',X:0:2,' son: ');
  SuperaronX(VPat, VRecaud, N, X);
  writeln('La patente que menos recaudo fue ',MenosRecaudo(VPat, VRecaud, N));
  READLN;

end.

