program ej10;
Type
  TVInt= array[1..17] of integer;
  TVB= array[1..100] of byte;
Const
  VecA: TVInt=(3,5,-1,3,8,2,-5,2,10,-4,-8,4,6,7,-3,11,2);
  N=17;

Procedure GeneraByC(Var VecB,VecC:TVB; Var M:byte);
Var
  i:byte;
begin
  M:=0;
  i:=0;
  repeat
    i:=i+1;
  until VecA[i]<0;
  while(i<N) do
    Begin
      If VecA[i]>0 then
        Begin
          VecC[M]:=VecC[M]+1;
          VecB[M]:=VecB[M]+VecA[i];
        end
      else
        Begin
          M:=M+1;
          VecC[M]:=0;
          VecB[M]:=0;
        end;
        i:=i+1;
    end;
  If VecA[i]>0 then
    M:=M-1;
end;

Procedure MuestraArreglo(Vec:TVB; P:byte);
Var
  i:byte;
Begin
  For i:=1 to N do
    write(Vec[i],' ');
end;

Var
  VecB,VecC:TVB;
  M:byte;
Begin
  GeneraByC(VecB,VecC,M);
  writeln('El arreglo que contiene las sumas es:');
  MuestraArreglo(VecB,M);
  writeln;
  writeln('El arreglo que contiene la cant de terminos sumados es:');
  MuestraArreglo(VecC,M);
  readln;
end.

