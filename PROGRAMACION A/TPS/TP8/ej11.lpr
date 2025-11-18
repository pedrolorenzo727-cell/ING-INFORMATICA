program ej11;

Procedure Piramide(a,f:byte);
Begin
  write(a:2);
  If f<10 then
    If a=1 then
      Begin
        writeln;
        If f<>9 then
          Piramide(f+1,f+1);
      end
    else
        Piramide(a-1,f)
end;

begin
  Piramide(1,1);
  readln;
end.

