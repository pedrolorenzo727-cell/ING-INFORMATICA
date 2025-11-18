program ej5;
Const
  MAXVEC=100;
Type
  TVInt= array[1..MAXVEC] of integer;

Procedure LeeArreglo(Var VecInt:TVInt; Var N:byte);
Var
  Arch:text;
Begin
  N:=0;
  Assign(Arch,'ej5.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      N:=N+1;
      read(Arch,VecInt[N]);
    end;
  Close(Arch);
end;

Function Maximo(VecInt:TVInt; N:byte):integer;
Var
  i:byte;
  Max:integer;
Begin
  Max:=VecInt[1];
  For i:=2 to N do
    If VecInt[i]>Max then
      Max:=VecInt[i];

  Maximo:=Max;
end;

Procedure GeneraVec(VecInt:TVInt; N:byte; Max:integer; Var VecDiv:TVInt; Var M:byte);
Var
  i:byte;
Begin
  M:=0;
  For i:=1 to N do
    If (VecInt[i]<>0) and ((Max mod VecInt[i])=0) then
      Begin
        M:=M+1;
        VecDiv[M]:=VecInt[i];
      end;
end;

Function PromedioVecDiv(VecDiv:TVInt; M:byte):real;
Var
  i:byte;
  Suma:integer;
Begin
  Suma:=0;
  For i:=1 to M do
    Suma:=Suma+VecDiv[i];
  If M<>0 then
    PromedioVecDiv:=Suma/M
  else
    PromedioVecDiv:=0;
end;

Procedure MuestraArreglo(Vec:TVInt; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i],' ');
  writeln('');
end;

Var
  VecInt,VecDiv:TVInt;
  N,M:byte;
begin
  LeeArreglo(VecInt, N);
  GeneraVec(VecInt, N,Maximo(VecInt,N), VecDiv, M);
  writeln('El arreglo leido es:');
  MuestraArreglo(VecInt, N);
  writeln('El arreglo generado es:');
  MuestraArreglo(VecDiv,M);
  writeln('El promedio de los elementos del arreglo generado es: ',PromedioVecDiv(VecDiv, M):0:2);
  readln;

end.

