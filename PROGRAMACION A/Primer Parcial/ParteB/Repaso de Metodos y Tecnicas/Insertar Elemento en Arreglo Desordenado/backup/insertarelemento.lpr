program insertarelemento;
const
  maxElem = 100;
type
  TV = array[1..maxElem] of integer;

procedure insertarElemento (var V : TV; var n : byte; pos : byte; x : integer);
var
  i : byte;
begin
  for i := n downto pos do
      V[i + 1] := V[i];
  V[pos] := x;
end;

begin
end.




