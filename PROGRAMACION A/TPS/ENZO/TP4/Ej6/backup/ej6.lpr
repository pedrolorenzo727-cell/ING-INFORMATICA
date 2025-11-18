program ej6;

function aleatorio (a, b : integer):real;
begin
  randomize;
  aleatorio := random()*(b - a) + a;
end;

var
  a, b : integer;
begin
  repeat
    writeln('Ingrese a y b');
    readln(a, b);
    writeln(aleatorio(a,b):4:2);
    writeln();
  until (a = b);
readln();
end.

