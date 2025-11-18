program ej18;

Function MCD(A,B:integer):integer;
Var
  C:byte;
Begin
  A:=Abs(A);B:=Abs(B);
  while (A mod B <>0) do
    Begin
     C:=B;
     B:= A mod B;
     A:=C;
    end;
  MCD:=B;
end;

Var
  A,B:integer;
begin
  writeln('Ingrese dos numeros enteros');
  readln(A,B);
  writeln(MCD(A,B),' es el MCD entre ellos');
  readln;
end.

