program ej22b;
Const
  Max=4;
Var
  ArchE,ArchS:text;
  Pal:string[12];
  Car:char;
begin
  Assign(ArchE,'ej22.txt'); reset(ArchE);
  Assign(ArchS,'ej22b.txt'); rewrite(ArchS);
  while not eof(ArchE) do
    Begin
      read(ArchE,Car);
      Pal:='';
      while(Car<>' ') and (not eof(ArchE)) do
        Begin
          Pal:=Car+Pal;
          read(ArchE,Car);
        end;

      If Length(Pal)>MAX then
        write(ArchS,Pal,' ');
    end;

  Close(ArchE);
  Close(ArchS);
end.

