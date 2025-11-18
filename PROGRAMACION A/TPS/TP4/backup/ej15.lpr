program ej15;
Type
  TipoFunc= function(N,Rta:byte):real;

Function Factorial(N:byte):word;
Var
  Aux,i:byte;
Begin
  Aux:=1;
  For i:=1 to N do
    Aux:=Aux*i;

  Factorial:=Aux;
end;

Function CalculaTermino(N,Rta:byte):real;
Var
  i:byte;
  Den:word;
Begin
  Den:=2;
Case Rta of
  1: CalculaTermino:= 1/sqr(N);
  2: Begin
       For i:=2 to N-1 do
         Den:=Den*2;
       CalculaTermino:=1/Den;
     end;
  3: CalculaTermino:=1/Factorial(N);
  end;
end;

Procedure CalculaRES(N,Rta:Byte);
Var
  i:byte;
  Res:real;
Begin
  Res:=0;
  For i:=1 to N do
    Res:=Res+CalculaTermino(i,Rta);
  writeln('El resultado de la sumatoria es ',Res:0:2);
end;

Procedure Menu(Var Rta,N:byte);
Begin
  repeat
    writeln('Ingrese la cantidad de terminos a sumar');
    readln(N);
    writeln('Ingrese la sumatoria que desea obtener');
    writeln('1');
    writeln('2');
    writeln('3');
    writeln('0(sale del programa)');
    readln(Rta);

    CalculaRes(N,Rta);
  until rta=0;
end;
Var
  Rta,N:byte;
begin
  Menu(Rta,N);
  readln;
end.

