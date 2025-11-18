program ej18;

function MCD (n1, n2 : word):word;
var
  resto : word;
begin
     while (n2 <> 0) do
     begin
       resto := n1 mod n2;
       n1 := n2;
       n2 := resto;
     end;
     MCD := n1;
end;

var
  n1, n2 : word;
begin
     writeln('Ingrese n1 y n2 (n1 >= n2');
     readln(n1,n2);

  writeln(MCD(n1,n2));
  readln();

end.

