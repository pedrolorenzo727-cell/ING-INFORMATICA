program ej9;
Const
  MAXVEC=100;

Type
  TVInt= array[1..MAXVEC] of integer ;

Procedure GeneraA(Var VecA:TVInt; Var N:byte);
Var
  Arch:text;
Begin
  N:=1;
  Assign(Arch,'ej9.txt'); reset(Arch);
  read(Arch,VecA[N]);
  while not eof(Arch) do
    Begin
      N:=N+1;
      read(Arch,VecA[N]);
      If VecA[N]<=VecA[N-1] then
        N:=N-1;
    end;
  Close(Arch);
end;

Procedure GeneraB(VecA:TVInt; N:byte; Var VecB:TVInt);
Var
  i,h:byte;
Begin
  If Odd(N) then
    h:=(N Div 2)+1
  else
    h:=N Div 2;
  For i:=1 to (N Div 2)+1 do
    If (VecA[N-i+1] Mod VecA[i])<>0 then
      Begin
       VecB[i]:=0;
       VecB[N-i+1]:=0;
      end
    else
      Begin
        VecB[i]:=VecA[i];
        VecB[N-i+1]:=VecA[N-i+1];
      end;
end;

Procedure MuestraArreglo(Vec:TVInt; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i],' ');
end;

Var
  VecA,VecB:TVInt;
  N:byte;
begin
  GeneraA(VecA,N);
  GeneraB(VecA,N,VecB);
  MuestraArreglo(VecA,N);
  writeln('');
  MuestraArreglo(VecB,N);
  readln;
end.

