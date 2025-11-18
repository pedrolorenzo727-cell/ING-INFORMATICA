program ej3;
Function Suma(N:byte):word;
Var
  i:byte;
  Acum:word;
Begin
  Acum:=0;
  For i:=1 to N do
    Acum:=Acum+i;

  Suma:=Acum;
End;

Var
 N:byte;
begin
  writeln('Ingrese un numero natural');
  readln(N);

  writeln('La suma de los ',N,' primeros numeros naturales es ',Suma(N));
  readln;
end.

