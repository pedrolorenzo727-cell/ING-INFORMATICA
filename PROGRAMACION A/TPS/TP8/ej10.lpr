program ej10;
Const
  MAXVEC=10;
Type
  TVI=array[1..MAXVEC] of integer;

Const
  A: TVI = (3, 7, 10, 15, 20, 0, 0, 0, 0, 0);     // tamaño real: N_A = 5
  B: TVI = (1, 7, 8, 15, 22, 30, 0, 0, 0, 0);  // tamaño real: N_B = 6

Procedure Mezcla(Var VecC:TVI; VecA,VecB:TVI; i,j,N,M:byte; Var P:byte);
Begin
  If (i<=N) and (j<=M) then
    Begin
      P:=P+1;
      If VecA[i]<VecB[j] then
        Begin
          VecC[P]:=VecA[i];
          Mezcla(VecC,VecA,VecB,i+1,j,N,M,P);
        end
      else
        If VecB[j]<VecA[i] then
          Begin
            VecC[P]:=VecB[j];
            Mezcla(VecC,VecA,VecB,i,j+1,N,M,P)
          end
        else
          Begin
            VecC[P]:=VecB[j];
            Mezcla(VecC,VecA,VecB,i+1,j+1,N,M,P)
          end
    end
  else
    If (i<=N) then
      Begin
        P:=P+1;
        VecC[P]:=VecA[i];
        Mezcla(VecC,VecA,VecB,i+1,j,N,M,P)
      end
    else
      If (j<=M) then
        Begin
          P:=P+1;
          VecC[P]:=VecB[j];
          Mezcla(VecC,VecA,VecB,i,j+1,N,M,P)
        end;
end;

Procedure Muestra(Vec:TVI; N:byte);
Var
  i:byte;
Begin
  for i:=1 to N do
    write(Vec[i]:3);
end;

Var
  VecC:TVI; i,j,N,M,P:byte;
begin
  N:=5; M:=6; P:=0;
  Mezcla(VecC, A, B, 1, 1,N, M, P);
  Muestra(VecC,P);
  readln;
end.

