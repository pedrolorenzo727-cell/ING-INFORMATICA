program ej3;
Var
  N1,N2:integer;
  N,i,ContSupera:byte;

begin
  ContSupera:=0;
  writeln('Ingrese la cantidad de numeros');
  readln(N);
  writeln('Ingrese el primer numero');
  readln(N1);
  for i:=2 to N do
    Begin
      writeln('Ingrese un numero');
      readln(N2);
      If N2>N1 then
        ContSupera:=ContSupera+1;
      N1:=N2;
    end;
  writeln('Un numero supero al anterior ',ContSupera,' veces');
  readln;
end.

