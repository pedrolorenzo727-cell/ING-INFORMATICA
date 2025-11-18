program ej22c;
Var
  ContCapi:byte;
  Arch:text;
  Car:char;
  Pal1,Pal2:string[12];

begin
  Assign(Arch,'ej22.txt'); reset(Arch);
  ContCapi:=0;
  while not eof(Arch) do
    Begin
      read(Arch,Car);
      Car:=UpCase(Car);
      Pal1:='';
      Pal2:='';
      while (Car<>' ') and not eof(Arch) do
        Begin
          Pal1:=Pal1+Car;
          Pal2:=Car+Pal2;
          read(Arch,Car); Car:=UpCase(Car);
        end;
      writeln(Pal1,' ',Pal2);
      If (Pal1=Pal2) and (Pal1<>' ') and (Length(Pal1)>3) then
        ContCapi:=ContCapi+1;
    end;
  writeln('Hay ',ContCapi,' palabras capicua');
  readln;
  Close(Arch);
end.

