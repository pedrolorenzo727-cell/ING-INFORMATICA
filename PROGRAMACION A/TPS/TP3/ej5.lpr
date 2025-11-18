program ej5;
Var
  K,Q,Mult:integer;
  i:byte;

begin
  writeln('Ingrese K y Q');
  readln(K,Q);
  Mult:=K;
  i:=1;
  writeln('Los multiplos son: ');
  while Mult<Q do
    Begin
      writeln(Mult);
      i:=i+1;
      Mult:=K*i
    end;
  readln;
end.

