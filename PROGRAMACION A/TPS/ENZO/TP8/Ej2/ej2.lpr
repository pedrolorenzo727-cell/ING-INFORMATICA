program ej2;

function imagen (x : integer):integer;
begin
  if x = 0 then
     imagen := 1
  else
    if (x mod 2 = 0) then
       imagen := 1 + imagen(x - 1)
    else
      imagen := imagen(x - 1);
end;

var
  x : integer;

begin
  readln(x);
  writeln(imagen(X));
  readln();
end.

