program ej1;
Const
  MAXMAT=50;

Type
  TM=array[1..MAXMAT,1..MAXMAT] of integer;
  TV=array[1..MAXMAT] of integer;

Procedure LeeMatriz(Var Mat:TM; Var N,M:byte);
Var
  i,j:byte;
  arch:text;
Begin
  Assign(Arch,'ej1.txt'); reset(Arch);
  readln(Arch,N,M);
  For i:=1 to N do
    Begin
      For j:=1 to M do
        read(Arch,Mat[i,j]);
    readln(Arch);
    end;

  Close(Arch);
end;

Procedure GeneraArregloMaxFila(Var VMaxF:TV; N,M:byte; Mat:TM);
Var
  i,j:byte;
  Max:integer;
Begin
  For i:=1 to N do
    Begin
      Max:=Mat[i,1];
      For j:=2 to M do
        Begin
          If Mat[i,j]> Max then
            Max:=Mat[i,j];
        end;
      VMaxF[i]:=Max;
    end;
end;

Procedure MuestraArreglo(Vec:TV; N:byte);
Var
  i:byte;
Begin
  writeln('El el elemento maximo de cada fila de la matriz son los siguientes');
  For i:=1 to N do
    writeln('Fila: ',i,' Maximo: ',Vec[i]);
end;

Procedure GeneraVecSumaImp(Var VecImp:TV; Mat:TM; N,M:byte; Var P:byte);
Var
  i,j:byte;
  Suma:integer;
  TieneImpar:boolean;
Begin
  P:=0;
  For J:=1 to M do
    Begin
      Suma:=0;
      TieneImpar:=False;
      For i:=1 to N do
        If Odd(Mat[i,j]) then
          Begin
            TieneImpar:=True;
            Suma:=Suma+Mat[i,j];
          end;
      If TieneImpar then
        Begin
          P:=P+1;
          VecImp[P]:=Suma;
        end;
    end;
end;

Function PromedioDeX(Mat:TM; N,X:byte):real;
Var
  i:byte;
  Prom:real;
Begin
  Prom:=0;
  For i:=1 to N do
    Prom:=Prom + Mat[i,X]/N;

  PromedioDeX:=Suma/N;
end;

Var
  Mat:TM;
  VMaxF,VImp:TV;
  P,N,M,X:byte;

begin
  LeeMatriz(Mat, N, M);
  GeneraArregloMaxFila(VMaxF, N, M, Mat);
  MuestraArreglo(VMaxF,N);
  GeneraVecSumaImp(VImp,Mat,N,M,P);
 // MuestraArreglo(VImp,P);
  writeln('Ingrese una columna de (X<= ',M,' )');
  readln(X);
  writeln('El promedio de los elementos de la columna ',X,' es ',PromedioDeX(Mat, N, X):0:2);
  readln;
end.

