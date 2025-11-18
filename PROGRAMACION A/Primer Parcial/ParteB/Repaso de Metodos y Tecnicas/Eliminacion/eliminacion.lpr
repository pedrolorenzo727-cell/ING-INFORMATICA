program eliminacion;
var
  maxElem = 100;
type
  TV = array[1..maxElem] of integer;

procedure eliminaCero (var V : TV; var : n : byte; pos : byte);
var
  i : byte;
begin
  for i := pos to n - 1 do
      V[i] := v[i + 1];
  n := n - 1;
end;

procedure eliminaVariosCeros (var V : TV; var : n : byte);
var
  i : byte;
begin
  i := 1;
  while i <= n do
        if V[i] = 0 then
           eliminaCero(V,n,i)
        else
          i := i + 1;
end;

var
  V : TV;
  b : byte;
begin

end.

