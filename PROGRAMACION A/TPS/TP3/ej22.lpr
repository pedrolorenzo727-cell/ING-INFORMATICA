program ej22a;
Var
  Arch:text;
  Pal,PalMasVoc:string[10];
  Car:char;
  CantVoc,MaxVoc:byte;
begin
  MaxVoc:=0;
  PalMasVoc:='';
  Assign(Arch,'ej22.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      read(Arch,Car);
      Car:=UpCase(Car);
      Pal:=Car;
      CantVoc:=0;
      while (Car<>' ') and (not eof(Arch)) do
        Begin
          If (Car='A') or (Car='E') or (Car='I') or (Car='O') or (Car='U') then
            CantVoc:=CantVoc+1;
          read(Arch,Car);
          Car:=UpCase(Car);
          Pal:=Pal+Car;
        end;
       If CantVoc>MaxVoc then
         Begin
           PalMasVoc:=Pal;
           MaxVoc:=CantVoc;
         end;
    end;
  writeln('La palabra con mas cantidad de vocales es: ',PalMasVoc);
  readln;
  Close(Arch);
end.

