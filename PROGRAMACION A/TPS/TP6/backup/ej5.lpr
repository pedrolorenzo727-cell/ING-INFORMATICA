program ej5;
Const
  TOPE=255;
  Tipos=4;
Type
  TMR=array[1..TOPE,1..4] of real;
  TVI=array[1..TOPE] of integer;

Function BuscaCli(VNroCli:TVI; N:byte; NroCli:integer):byte;
Var
  i:byte;
Begin
  i:=1;
  while(i<N) and (VNroCli[i]<>NroCli) do
    i:=i+1;
  If VNroCli[i]=NroCli then
    BuscaCli:=i
  else
    BuscaCli:=0;
end;

Procedure IniciaFila(Var Mat:TMR; i:byte);
Var
  j:byte;
Begin
  for j:=1 to TIPOS do
    Mat[i,j]:=0;
end;

Procedure CargaEstructuras(Var MCompras:TMR; Var N:byte; Var VNroCli:TVI);
Var
  p,Tipo:byte;
  NroCli:integer;
  Monto:real;
  Arch:text;
Begin
  N:=0;
  Assign(Arch,'ej5.txt'); reset(Arch);
  while not eof(Arch) do
    begin
      readln(Arch,NroCli,Tipo,Monto);
      P:=BuscaCli(VNroCli,N,NroCli);
      If P=0 then
        Begin
          N:=N+1;
          P:=N;
          VNroCli[P]:=NroCli; writeln(VNroCli[P]);
          IniciaFila(MCompras,P);
        end;
      MCompras[P,Tipo]:=MCompras[P,Tipo]+ monto;
    end;
  Close(Arch);
end;

//Inciso A
Procedure TotalComprasPorRubro(MCompras:TMR; N:byte);
Var
  Acum:real;
  i,j:byte;
Begin
  For J:=1 to TIPOS do
    Begin
      Acum:=0;
      For i:=1 to N do
        Acum:=Acum+MCompras[i,j];
      writeln('El total de compras del rubro ',j,' es ',Acum:0:2);
    end;
end;

//Inciso B
Procedure ListadoSuperan(MCompras:TMR; N:byte; VNroCli:TVI);
Var
  i:byte;
Begin
  writeln('Los clientes que superaron el monto de Indumentaria con el de Supermercado son:');
  For i:=1 to N do
    If MCompras[i,1]>MCompras[i,3] then
      writeln(VNroCli[i]);
end;

//Inciso C
Function TotCompra(MCompras:TMR; N:byte):real;
Var
  i,j:byte;
  Prom:real;
Begin
  Prom:=0;
  For i:=1 to N do
    For j:=1 to TIPOS do
      Prom:=Prom+MCompras[i,j]/N;
  TotCompra:=Prom;
end;

//Inciso D
Function MasConsumio(MCompras:TMR; VNroCli:TVI; N:byte):integer;
Var
  i,j,indice:byte;
  Max,Acum:real;
Begin
  Max:=0;
  For i:=1 to N do
    Begin
      Acum:=0;
      For j:=1 to TIPOS do
        Acum:=Acum+MCompras[i,j];
      If Acum>Max then
        Begin
          Indice:=i;
          Max:=Acum;
        end;
    end;

  MasConsumio:=VNroCli[Indice];
end;

//Inciso E
Function NoRegisCompras(MCompras:TMR; N:byte):byte;
Var
  i,j,Cont:byte;
Begin
  Cont:=0;
  For i:=1 to N do
    Begin
      j:=1;
      while(j<TIPOS) and (MCompras[i,j]<>0) do
        j:=j+1;
      If MCompras[i,j] = 0 then
        Cont:=Cont+1;
    end;

  NoRegisCompras:=Cont;
end;

Var
  MCompras:TMR;
  VNroCli:TVI;
  N:byte;
begin
  CargaEstructuras(MCompras,N,VNroCli);
  TotalComprasPorRubro(MCompras, N);
  ListadoSuperan(MCompras, N, VNroCli);
  writeln('El promedio de compra por cliente es ',TotCompra(MCompras, N):0:2);
  writeln('El numero de cliente que mas consumio es: ',MasConsumio(MCompras,VNroCli, N));
  writeln('No registraron compras en algun rubro ',NoRegisCompras(MCompras, N),' clientes');
  readln;

end.

