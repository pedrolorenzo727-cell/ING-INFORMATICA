program ej24;
Var
  ArchE,ArchS:text;
  Car1,Car2,c:char;
begin
  Assign(ArchE,'ej24E.txt'); reset(ArchE);
  Assign(ArchS,'ej24S.txt'); rewrite(ArchS);
  read(ArchE,Car1);
  while Car1<>'.' do
    Begin
      read(ArchE,Car2);
      If (Car1 in ['a'..'z']) and (Car2 in ['0'..'9']) then
        Begin
          For c:='1' to Car2 do
            write(ArchS,Car2);
          read(ArchE,Car2)
        end
      else
        read(ArchE,Car1);
      Car1:=Car2;
    end;
  Close(ArchE); Close(ArchS);
  reset(ArchS);
  while not eof(ArchS) do
    Begin
      read(ArchS,Car1); write(Car1);
    end;
  readln;
  Close(ArchS);
end.

