program ej4;
Function Potencia(X,N:integer): real;
  Var
    i:byte;
    Pot:real;
  Begin
    Pot:=X;
    For i:=1 to Abs(N) do
      Pot:=Pot*X;

    If N<0 then
      Pot:=1/Pot
    else
      If N=0 then
        Pot:=1;

    Potencia:=Pot;
  End;

Var
  X,N:integer;
begin
  writeln('Ingrese un numero y a la potencia que lo quiera elevar');
  readln(X,N);

  writeln(X,' elevado a la ',N,' es ',Potencia(X,N):0:2);
  readln;
end.

