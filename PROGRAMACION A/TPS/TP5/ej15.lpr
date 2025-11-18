program ej15;
Const
  MAXVEC=1500;

Type
  St17=string[17];
  St7=string[7];
  TVS17= array[1..MAXVEC] of St17;
  TVS7= array[1..MAXVEC] of St7;
  TVR= array[1..MAXVEC] of real;
  TVB= array[1..MAXVEC] of byte;

Procedure CargaArreglos(Var VClientes:TVS17;Var VPat:TVS7; Var VTipo:TVB; Var VTons:TVR; Var N:word);
Var
  Arch:text;

Begin
  N:=0;
  Assign(Arch,'ej15.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      N:=N+1;
      readln(Arch,VClientes[N],VPat[N],VTipo[N],VTons[N]);
      //writeln(VClientes[N],VPat[N],VTipo[N],VTons[N]:0:2);
    end;
  Close(Arch);
end;

Procedure PorcentajesDeCereal(VTipo:TVB; VTons:TVR; N:word);
Var
  AcumT,AcumG,AcumS,AcumM,TotTons: real;
  i:word;
Begin
  AcumT:=0; AcumG:=0; AcumS:=0; AcumM:=0;
  For i:=1 to N do
    Case VTipo[i] of
      1: AcumT:=AcumT+VTons[i];
      2: AcumG:=AcumG+VTons[i];
      3: AcumS:=AcumS+VTons[i];
      4: AcumM:=AcumM+VTons[i];
    end;
  TotTons:=AcumT+AcumG+AcumS+AcumM;

  writeln('El porcentaje de toneladas Trigo sobre el total es ',AcumT/TotTons*100:0:2,'%');
  writeln('El porcentaje de toneladas Girasol sobre el total es ',AcumG/TotTons*100:0:2,'%');
  writeln('El porcentaje de toneladas Soja sobre el total es ',AcumS/TotTons*100:0:2,'%');
  writeln('El porcentaje de toneladas Maiz sobre el total es ',AcumM/TotTons*100:0:2,'%');

end;

Function BuscaPatente(VPat:TVS7; N:word; Patente:St7):byte;
Var
  i:word;
Begin
  i:=1;
  while (i<=N) and (VPat[i]<>Patente) do
    i:=i+1;
  If i>N then
    BuscaPatente:=0
  else
    BuscaPatente:=i;
end;

Procedure InsertaOrdenado(Var Vec:TVS17; Var N:word; Nombre:ST17);
Var
  J:word;
Begin
  J:=N;
  while (J>0) and (Vec[J]>Nombre) do
    Begin
      Vec[J+1]:=Vec[J]; J:=J-1;
    end;
  Vec[J+1]:=Nombre;
  N:=N+1;
end;

Procedure GeneraSupX(Var VSuperanX:TVS17; Var M:word; VTons:TVR; N:word; X:real; VClientes:TVS17);
Var
  i:word;
Begin
  M:=0;
  For i:=1 to N do
    If VTons[i]>X then
      InsertaOrdenado(VSuperanX,M,VClientes[i]);

end;

Procedure MuestraArreglo(Vec:TVS17; N:word);
Var
  i:word;
Begin
  For i:=1 to N do
    write(Vec[i],' ');
end;

Var
  VClientes,VSuperanX:TVS17;
  VPat:TVS7;
  VTipo:TVB;
  VTons:TVR;
  N,M,Indice:word;
  Patente:St7;
  X:real;
begin
  CargaArreglos(VClientes, VPat, VTipo, VTons, N);
  PorcentajesDeCereal(VTipo, VTons, N);
  writeln('Ingrese una patente');
  readln(Patente);
  Indice:=BuscaPatente(VPat, N, Patente);
  If Indice<>0 then
    Begin
      Case VTipo[indice] of
        1: write('Transporta trigo,');
        2: write('Transporta girasol,');
        3: write('Transporta soja,');
        4: write('Transporta maiz,');
      end;
      writeln(VTons[Indice]:0:2,' toneladas y pertenece al cliente ',VClientes[Indice]);
    end
  else
    writeln('La patente ingresada no existe');
  writeln('Ingrese una cant de toneladas a superar');
  readln(X);
  GeneraSupX(VSuperanX, M, VTons, N, X, VClientes);
  writeln('Los clientes que superan ',X:0:2,' toneladas son:');
  MuestraArreglo(VSuperanX,M);

  readln;
end.

