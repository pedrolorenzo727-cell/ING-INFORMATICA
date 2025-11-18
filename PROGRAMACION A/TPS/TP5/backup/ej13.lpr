program ej13;
Const
  MAXVEC=100;
  Auto=3000;
  Moto=1500;
  Camioneta=3000;
  Camion=4700;
  Colectivo=3900;
  Recargo=1.10;

Type
  TVR= array[1..MAXVEC] of real;
  TVW= array[1..MAXVEC] of word;

Procedure IniciaArregloW(Vec:TVW; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    Vec[i]:=0;
end;

Procedure IniciaArregloR(Vec:TVR; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    Vec[i]:=0;
end;

Function Importe(Tipo,Hora:byte):real;
Var
  Costo:real;
Begin
  Case Tipo of
    1: Costo:=Auto;
    2: Costo:=Moto;
    3: Costo:=Camioneta;
    4: Costo:=Camion;
    5: Costo:=Colectivo;
  end;
  If (Hora>=10) and (Hora<=18) then
    Costo:=Costo*Recargo;
  Importe:=Costo;
end;

Procedure CargaArreglos(Var VCantAutos:TVW; Var VRecaud:TVR; Var N:byte);
Var
  Arch:text;
  NumCabin,Hora,Tipo:byte;
begin
  Assign(Arch,'ej13.txt'); reset(Arch);
  readln(Arch,N);
  IniciaArregloW(VCantAutos,N); IniciaArregloR(VRecaud,N);
  while not eof(Arch) do
    Begin
     readln(Arch,NumCabin,Tipo,Hora);
     VCantAutos[NumCabin]:= VCantAutos[NumCabin]+1;
     VRecaud[NumCabin]:= VRecaud[NumCabin] + Importe(Tipo,Hora);
    end;
  Close(Arch);
end;

Function MasRecaudo(VRecaud:TVR; N:byte):byte;
Var
  indice,i:byte;
  Max:real;
Begin
  Max:=VRecaud[1]; Indice:=1;
  For i:=2 to N do
    If VRecaud[i]>Max then
      Begin
        Max:=VRecaud[i];
        Indice:=i;
      end;
  MasRecaudo:=Indice;
end;

Procedure CantVehicAtendio(VCantAutos:TVW; N);
Var
  i:byte;
Begin
  For i:=1 to N do
    writeln('La cabina ',i,' atendio ',VCantAutos[i],' vehiculos');
end;

Var
  VRecaud:TVR; VCantAutos:TVW;
  N:byte;
Begin
  CargaArreglos(VCantAutos,VRecaud,N);
  CantVehicAtendio(VCantAutos,N);
  writeln('La cabina que mas importe recuado fue la ',MasRecaudo(VRecaud,N));
  readln;
end.

