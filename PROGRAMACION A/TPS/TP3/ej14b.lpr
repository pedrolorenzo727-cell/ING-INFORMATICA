program ej14b;
Var
  Sum,x:integer;
begin
  Sum:=0;
  Readln( x );
  while (x<>0) and (Sum<100) do
    Begin
      Sum := Sum + x;
      Readln( x );
    End;
  Writeln('Resultado', Sum );
  readln;
end.
begin
end.

