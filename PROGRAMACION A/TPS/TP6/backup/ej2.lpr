program ej2;
Const
  MAXALU=255;
  MAXNOTAS=10;
Type
  TMR=array[1..MAXALU,1..MAXNOTAS] of real;
  St8=string[8];
  TVS=array[1..MAXALU] of st8;

Procedure CargaEstructuras(Var VNom:TVS; Var MNotas:TMR; Var N,M:byte);
Var
  j:byte;
  Arch:text;

Begin
  N:=0;
  Assign(Arch,'ej2.txt'); reset(Arch);
  readln(Arch,M);
  while not eof(Arch) do
    Begin
      N:=N+1;
      read(Arch,VNom[N]);
      For j:=1 to M do
        Begin
          read(Arch,MNotas[N,j]); //write(MNotas[i,j]:0:2,' ');
        end;
      //writeln('');
      readln(Arch);
    end;
  Close(Arch);
end;

//Inciso A
Procedure ListadoAprobaron(Mat:TMR; N,M:byte; VNom:TVS);
Var
  i,j:byte;
Begin
  writeln('Listado de alumnos que aprobaron los ',M,' parciales');
  for i:=1 to N do
    Begin
      j:=1;
      while (j<M) and (Mat[i,j] >=5) do
        j:=j+1;
      If Mat[i,j]>=5 then
        writeln(VNom[i]);
    end;
end;

//Inciso B
Function Promedio(Mat:TMR; i,M:byte):real;
Var
  j:byte;
  suma:real;
Begin
  Suma:=0;
  For j:=1 to M do
    Suma:=Suma+Mat[i,j];

  Promedio:=Suma/M;
end;

Procedure DeterminaSit(Mat:TMR; N,M:byte; VNom:TVS; Var Vprom:TVS; Var P:byte);
Var
  i:byte;
  Prom:real;
 Begin
   P:=0;
   For i:=1 to N do
     Begin
       Prom:=Promedio(Mat,i,M);
       If Prom>=7 then
         Begin
           P:=P+1;
           VProm[P]:=VNom[i];
           writeln('El alumno ',VNom[i],' promociona');
         end
       else
         If Prom>=5 then
          writeln('El alumno ',VNom[i],' Habilita')
         else
           writeln('El alumno ',VNom[i],' desaprobo');
     end;
 end;

Var
  MNotas:TMR;
  VNom,VProm:TVS;
  N,M,P:byte;

begin
  CargaEstructuras(VNom, MNotas, N, M);
  ListadoAprobaron(MNotas, N, M, VNom);
  DeterminaSit(MNotas, N, M, VNom, VProm, P);

  readln;
end.

