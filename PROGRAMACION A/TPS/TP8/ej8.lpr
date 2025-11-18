program ej8;
Type
  TMInt=array[1..4,1..3] of integer;
  TVInt=array[1..4] of integer;
Const
  Mat: TMInt = (
    (  2,  -1,   7),
    (  0,   5,  -3),
    (  8,  -2,   4),
    ( -6,   1,   0)
  );

Function Max(Matriz:TMInt; i,j:byte):integer;
Var
  Aux:integer;
Begin
  If j>1 then
    Begin
      Aux:=Max(Matriz,i,j-1);
      If Matriz[i,j]>Aux then
        Aux:=Matriz[i,j];
    end
  else
    Aux:=Matriz[i,j];
  Max:=Aux;
end;

Procedure ArregloMaximos(Var VMax:TVInt; i,M,N:byte; Matriz:TMInt);
Begin
  If i>0 then
    Begin
      VMax[i]:=Max(Matriz,i,N);
      ArregloMaximos(VMax,i-1,M,N,Matriz);
    end;
end;

Procedure MuestraVec(VMax:TVInt; M:byte);
Var
  i:byte;
Begin
  For i:=1 to M do
    write(VMax[i]:3);
end;

Procedure ArregloMaximos2(Var VMax:TVInt; i,j,N:byte; Matriz:TMInt; Var Max:integer);
Begin
  If i>0 then
    Begin
      If j=N then
        Begin
          Max:=Matriz[i,j];
          ArregloMaximos2(VMax,i,j-1,N,Matriz,Max);
        end
      else
        If j>0 then
          Begin
            If Mat[i,j]>Max then
              Max:=Mat[i,j];
            ArregloMaximos2(VMax,i,j-1,N,Matriz,Max);
          end
        else
          Begin
            VMax[i]:=Max;
            ArregloMaximos2(VMax,i-1,N,N,Matriz,Max);
          end;
    end;
end;

Var
  VMax:TVInt;
  Maxi:integer;
begin
  //ArregloMaximos(VMax, 4, 4, 3, Mat);
  ArregloMaximos2(VMax,4,3,3,Mat,Maxi);
  MuestraVec(VMax, 4);
  readln;
end.

