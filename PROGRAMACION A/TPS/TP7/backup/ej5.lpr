program ej5;
Const
  MAXVEC=100;
Type
  TregNoNul=record
    Fila,Col:byte;
    Valor:integer;
  end;

  TVR=array[1..MAXVEC] of TregNoNul;

Procedure CargaEstructura(Var VElem:TVR; Var N,M,P:byte);
Var
  Arch:text;
Begin
 Assign(Arch,'ej5.txt'); reset(Arch);
 P:=0;
 readln(Arch,N,M);
 while not eof(Arch) do
   Begin
     P:=P+1;
     readln(Arch,VElem[P].Fila,VElem[P].Col,VElem[P].Valor);
   end;
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

Procedure MuestraMatricialmente(VElem:TVR; N,M,P:byte);
Var
  k,i,j:byte;
Begin
   For i:=1 to N do
     Begin
       For j:=1 to M do
         Begin
           k:=BuscaElem(VElem, P, i, j);
           If k<>0 then
             write(VElem[k].Valor:4)
           else
             write(0:4);
         end;
       writeln;
     end;
end;

Procedure MuestraTraspuesta(VElem:TVR; N,M,P:byte);
Var
  k,i,j:byte;
Begin
   For i:=1 to N do
     Begin
       For j:=1 to N do
         Begin
           k:=BuscaElem(VElem, P, j, i);
           If k<>0 then
             write(VElem[k].Valor:4)
           else
             write('0':4);
         end;
       writeln;
     end;
end;

Var
  VElem:TVR;
  N,M,P:byte;

begin
  CargaEstructura(VElem, N, M, P);
  MuestraMatricialmente(VElem, N, M, P);
  If N=M then
    Begin
      writeln('La matriz traspuesta es:');
      MuestraTraspuesta(VElem, N, M, P);
    end;
  readln;
end.

