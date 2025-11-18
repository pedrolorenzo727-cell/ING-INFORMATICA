program ej3;

function posX (V : TV; n : byte; x : integer):byte;
var
  i : byte;
begin
  i := 1;
  while (i <= n) and (V[i] <> x) do
        i := i + 1;
  if i <= n then
     posX := i
  else
    posX := 0;
end;

begin
end.

