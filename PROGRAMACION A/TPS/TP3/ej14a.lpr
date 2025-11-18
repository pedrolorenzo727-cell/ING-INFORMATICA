program ej14a;
Var
  Bool:boolean;
  Sum,x:integer;
begin                                 //Lote1:0         Result: 0
  Bool:=false ;                       //Lote2:70,40,20  Result: 110
  Sum:=0;                             //Lote3: 70,0     Result: 70
  Readln( x );
  If x <>0 then                       //El codigo suma enteros hasta que se ingresa un cero o la suma supera 100
    Repeat
      Sum := Sum + x;
      If Sum > 100 then
        Bool :=true;
      Readln( x );
    Until ( x=0) or Bool;
  Writeln('Resultado', Sum );
  readln;
end.

