program ej17;
CONST
  MAXVEC=3000;

Type
  St30=string[30];
  TVS=array[1..MAXVEC] of St30;

Procedure InsertaOrdenado(Var VPacientes:TVS; Var N:word; Nombre:ST30);
Var
  J:word;
Begin
  J:=N;
  while (J>0) and (VPacientes[J]>Nombre) do
    Begin
      VPacientes[J+1]:=VPacientes[J]; J:=J-1;
    end;
  VPacientes[J+1]:=Nombre;
  N:=N+1;
end;

Procedure LeeArchivo(Var VPacientes:TVS; Var N:word);
Var
  Arch:text;   Extra:char;
  Nombre:St30;
  Numero:word;
begin
  Assign(Arch,'ej17.TXT'); reset(Arch);
  N:=0;
  while not eof(Arch) do
    Begin
      readln(Arch,Numero,Extra,Nombre);
      If UpCase(Nombre[1]) in ['A'..'F'] then
        InsertaOrdenado(VPacientes,N,Nombre);
    end;
end;

Procedure MuestraArreglo(VPacientes:TVS; N:word);
Var
  i:word;
Begin
  writeln('El listado de los pacientes con apellidos entre A y F ordenados alfabeticamnte es:');
  for i:=1 to N do
    writeln(VPacientes[i]);
end;

Var
  VPacientes:TVS;
  N:word;
Begin
  LeeArchivo(VPacientes, N);
  MuestraArreglo(VPacientes,N);
  readln;
end.

