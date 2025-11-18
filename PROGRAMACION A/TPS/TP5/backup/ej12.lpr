program ej12;
Const
  MAXVEC=50;
Type
  St30=String[30];
  TVS= array[1..MAXVEC] of St30;
  TVR= array[1..MAXVEC] of real;
  TVC= array[1..MAXVEC] of char;

Procedure CargaArreglos(Var VClave:TVS; Var VProm:TVR; Var VCar:TVC; Var N:byte);
Var
  Arch:text;
  ContCarEsp,i:byte;
  Num:real;
  Car:char;
  ContraInvalida:boolean;
Begin
  N:=0;
  Assign(Arch,'ej12.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      N:=N+1;
      ContraInvalida:=False;
      ContCarEsp:=0;
      VClave[N]:='';
      VProm[N]:=0;
      read(Arch,Car);
      while car<>' ' do
        Begin
          If not (Car in['0'..'9','a'..'z','A'..'Z']) then
            ContCarEsp:=ContCarEsp+1
          else
            VClave[N]:=VClave[N]+Car;
          read(Arch,Car);
        end;
      If ContCarEsp>3 then
        ContraInvalida:=True
      else
        Begin
          For i:=1 to 3 do
            Begin
              read(Arch,Num);
              VProm[N]:=VProm[N]+Num;
            end;
          VProm[N]:=VProm[N] / 3;
          read(Arch,Car);
          while car=' ' do
            read(Arch,Car);
          If Car=VClave[N][length(VClave[N])] then
            ContraInvalida:=True
          else
            VCar[N]:=Car;
        end;
      If ContraInvalida then
        N:=N-1;
      readln(Arch);
    end;
  Close(Arch);
end;

Procedure MuestraArregloS(Vec:TVS; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i],' ');
end;

Procedure MuestraArregloR(Vec:TVR; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i]:0:2,' ');
end;

Procedure MuestraArregloC(Vec:TVC; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i],' ');
end;

Function ClaveMaxPromLetra(VClave:TVS; N:byte; Letra:Char):St30;
Var
  Max,ContL,i,j,Indice:byte;
Begin
  Max:=0; Indice:=0;
  For i:=1 to N do
    Begin
      ContL:=0;
      For j:=1 to length(VClave[i]) do
        If VClave[i][j]=Letra then
          ContL:=ContL+1;
      If ContL>Max then
        Begin
          Max:=ContL;
          Indice:=i;
        end;
    end;
  If Indice<>0 then
    ClaveMaxPromLetra:=VClave[indice]
  else
    ClaveMaxPromLetra:='';

end;

Function BuscaClave(VClave:TVS; N:byte; Clave:St30):Byte;
Var
  i:byte;
Begin
  i:=1;
  while (i<=N) and (VClave[i]<>Clave) then
    i:=i+1;
  If i>N then
    BuscaClave:=0
  else
    BuscaClave:=i;
end;

Var
  VClave:TVS;
  VProm:TVR;
  VCar:TVC;
  N,i:byte;
  Letra:Char;
  Contra,Max:St30;

begin
  CargaArreglos(VClave, VProm, VCar, N);
  MuestraArregloS(VClave,N); writeln;
  MuestraArregloR(VProm,N); writeln;
  MuestraArregloC(VCar,N); writeln;
  writeln('Ingrese una letra');
  readln(Letra);
  writeln('Ingrese una contraseña');
  readln(Contra);
  Max:=ClaveMaxPromLetra(VClave,N,Letra);
  If Max<>'' then
    writeln('La clave de maximo promedio que contiene a ',Letra,' es ',ClaveMaxPromLetra(VClave,N,Letra))
  else
    writeln('Ninguna de las claves posee la letra ingresada');
  i:=BuscaClave(VClave,N,Contra);
  If i<>0 then
    writeln('El promedio asociado a la clave ingresada es ',VProm[i]:0:2,' y la letra es ',VCar[i])
  else
    writeln('La clave ingresada no existe');
  readln;
end.

