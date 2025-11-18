program ej6;
Function Aleatorio(A,B:word):word;
Begin
  Aleatorio:=Random(B+1-A) +A;
end;
Var
  i,A,B:word;
begin       
  Randomize;
  writeln('Ingrese A y B (A<B)');
  readln(A,B);
  For i:=1 to 100 do
    writeln('Un numero aleatorio entre ',A,' y ',B,' es ',Aleatorio(A,B));
  readln;
end.

