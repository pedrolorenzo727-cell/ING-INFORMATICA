program ej6;
Const
  MAXVEC=100;
Type
  TregNoNul=record
    Fila,Col:byte;
    Valor:integer;
  end;

  TVR=array[1..MAXVEC] of TregNoNul;

Procedure CargaEstructura(Var VElem1,VElem2:TVR; Var N,M,P1,P2:byte);
Var
  Arch:text;
  i:byte;
Begin
 Assign(Arch,'ej6.txt'); reset(Arch);
 readln(Arch,N,M,P1);
 For i:=1 to P1 do
   readln(Arch,VElem1[i].Fila,VElem1[i].Col,VElem1[i].Valor);

 readln(Arch,P2);
 For i:=1 to P2 do
   readln(Arch,VElem2[i].Fila,VElem2[i].Col,VElem2[i].Valor);
 Close(Arch);
end;

Function BuscaElem(VElem:TVR; P,i,j:byte):byte;
Var
  k:byte;
Begin
 k:=1;
 while(k<P) and ((VElem[k].Fila<>i) or (VElem[k].Col<>j)) do
   k:=k+1;
 If (VElem[k].Fila=i) and (VElem[k].Col=j) then
   BuscaElem:=k
 else
   BuscaElem:=0;
end;

Procedure MuestraMatricialmenteSuma(VElem1,VElem2:TVR; N,M,P1,P2:byte);
Var
  k,l,i,j:byte;
Begin
   For i:=1 to N do
     Begin
       For j:=1 to M do
         Begin
           k:=BuscaElem(VElem1, P1, i, j);
           l:=BuscaElem(VElem2, P2, i, j);
           If k<>0 then
             If l<>0 then
               write((VElem1[k].Valor + VElem2[l].Valor):4)
             else
               write(VElem1[k].Valor:4)
           else
             If l<>0 then
               write(VElem2[l].Valor:4)
             else
               write('0':4);
         end;
       writeln;
     end;
end;

Var
  VElem1,Velem2:TVR;
  P1,P2,N,M:byte;

begin
  CargaEstructura(VElem1, VElem2, N, M, P1, P2);
  MuestraMatricialmenteSuma(VElem1, VElem2, N, M, P1, P2);
  readln;
end.

