program ej5;
Const
  MAXVEC=10;
Type
  TVInt=array[1..MAXVEC] of integer;

Const
  VEC: TVInt=(5,-9,6,3,0,-2,11,1,0,4);

//Inciso A Suma sus elementos
Function SumaRecur(VecInt:TVInt; n:byte):integer;
Begin
  If n=0 then
    SumaRecur:=0
  else
    SumaRecur:= VecInt[n]+SumaRecur(VecInt,n-1);
end;

//Inciso B muestra sus elementos
Procedure MuestraVec(VecInt:TVInt; n:byte);
Begin
  If n>1 then
    MuestraVec(VecInt,n-1);
  write(VecInt[n]:3);
end;

//Inciso C muestra sus elem invertidos
Procedure MuestraVecInv(VecInt:TVInt; n:byte);
Begin
  If n>0 then
    Begin
      write(VecInt[n]:3);
      MuestraVecInv(VecInt,n-1);
    end;
end;

//Inciso D obtener el maximo
Function Max(VecInt:TVInt; n:byte):integer;
Var
 Aux:integer;
 Begin
   If n>1 then
     Begin
       Aux:=Max(VecInt,n-1);
       If VecInt[n]>Aux then
         Aux:=VecInt[n];
     end
   else
       Aux:=VecInt[n];
   Max:=Aux;
 end;

//Inciso E obtener el promedio
Function Prom(VecInt:TVInt; n,Pos:byte):real;
Begin
  If Pos>0 then
    Prom:=(VecInt[Pos]/N) + Prom(VecInt,n,Pos-1)
  else
    Prom:=0;
end;

Var
 n,Pos:byte;

begin
 n:=10;
 writeln('La suma de los elementos del arreglo es ',SumaRecur(Vec,n));
 writeln('El vector es: ');
 MuestraVec(Vec,n); writeln;
 writeln('El vector al reves es: ');
 MuestraVecInv(Vec,n); writeln;
 writeln('El maximo de sus elementos es ',Max(Vec,n));
 Pos:=n;
 writeln('El promedio de sus elementos es: ',Prom(Vec,n,Pos):0:2);

 readln;
end.

