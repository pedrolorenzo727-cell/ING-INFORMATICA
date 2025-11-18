program busquedabinaria;
type
  TV = array[1..10] of integer;

const
  V : TV = (0,2,3,4,5,6,7,8,9,10);

function buscPos (V : TV; n : byte; x : integer):byte;
var
  pri, ult, med : byte;
begin
  pri := 1;
  ult := n;
  med := (pri + ult) div 2;
  while (ult > pri) and (V[med] <> x) do
  begin
    if x > V[med] then
       pri := med + 1
    else
      ult := med - 1;
    med := (pri + ult) div 2;
  end;
  if v[med] = x then
     buscPos := med
  else
    buscPos := 0;

end;
var
  n : byte;
begin
  writeln(buscPos(V,10,1));
  readln();
end.

