program ej7;
Const
  MAXVEC=20;
Type
  TVB= array[1..MAXVEC] of byte;

Procedure CargaNumeros(Var VNum1,VNum2:TVB; Var N,M:byte);
Var
  i:byte;
begin
  writeln('Ingrese la cantidad de digitos del primer numero');
  readln(N);
  writeln('A continuacion ingrese los digitos de derecha a izquierda');
  For i:=1 to N do
    readln(VNum1[i]);
  writeln('Ingrese la cantidad de digitos del segundo numero');
  readln(M);
  writeln('A continuacion ingrese los digitos de derecha a izquierda');
  For i:=1 to M do
    readln(VNum2[i]);

end;

Procedure Suma(VNum1,VNum2:TVB; N,M:byte; Var VSuma:TVB; Var P:byte );
Var
  Aux,i,Suma:byte;
Begin
  Aux:=0;
  P:=0;
  i:=1;
  while (i<=N) or (i<=M) do
    Begin
      Suma:=VNum1[i]+VNum2[i]+Aux;
      P:=P+1;
      If Suma>9 then
        Begin
          Aux:= (Suma div 10) Mod 10;
          VSuma[P]:= Suma mod 10;
        end
      else
        Begin
          Aux:=0;
          VSuma[P]:=Suma;
        end;
      i:=i+1;
    end;
end;

Procedure MuestraSuma(VSuma:TVB; P:byte);
Var
  i:byte;
Begin
  writeln('La suma de ambos numeros es: ');
  For i:=P downto 1 do
    write(VSuma[i],' ');
end;

Var
  VNum1,VNum2,VSuma:TVB;
  N,M,P:byte;

Begin
  CargaNumeros(VNum1,VNum2,N,M);
  Suma(VNum1,VNum2,N,M,VSuma,P);
  MuestraSuma(VSuma,P);
  readln;
end.

