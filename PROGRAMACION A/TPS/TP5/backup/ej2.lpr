program ej2;
Const
  MAXVEC=100;

Type
  TVInt= array[1..MAXVEC] of integer;

Procedure GeneraArreglos(Var V,W:TVInt; Var N,M:byte);
Var
  Arch:text;
  Num:integer;
begin
  N:=0; M:=0;
  Assign(Arch,'ej2.txt');  reset(Arch);
  while not eof(Arch) do
    Begin
      read(Arch,Num);
      If not Odd(Num) and (Num<>0) then
        Begin
          M:=M+1;
          W[M]:= Num;
        end
      else
        If odd(Num) then
          Begin
            N:=N+1;
            V[N]:=Num;
          end;
    end;
end;

Procedure MuestraArreglo(V:TVInt; N:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(V[i],' ');
end;

Var
  V,W:TVInt;
  N,M:byte;
Begin
  GeneraArreglos(V,W,N,M);
  MuestraArreglo(V,N);
  MuestraArreglo(W,M);
  readln;
end.

