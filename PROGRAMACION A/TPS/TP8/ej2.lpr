program ej2;
Function FuncRecur(i:integer):integer;
Begin
  If i=0 then
    FuncRecur:=1
  else
    If odd(i) then
      If (i>0) then
        FuncRecur:=FuncRecur(i-1)
      else
        FuncRecur:=FuncRecur(i+1)
    else
      If (i>0) then
        FuncRecur:=1+FuncRecur(i-1)
      else
        FuncRecur:=1+FuncRecur(i+1);
end;

Function FuncRecur(i:integer):integer;
Begin
  If i=0 then
    FuncRecur:=1
  else
    If odd(i) and (i>0) then
      FuncRecur:=FuncRecur(i-1)
    else
      If not odd(i) and (i>0) then
        FuncRecur:=1+FuncRecur(i-1)
      else
        If odd(i) and (i<0) then
          FuncRecur:=FuncRecur(i+1)
        else
          FuncRecur:=1+FuncRecur(i+1);
end;
Var
  i:integer;
begin
  writeln('Ingrese un i');
  readln(i);
  writeln('F(',i,')=',FuncRecur(i));
  readln;
end.

