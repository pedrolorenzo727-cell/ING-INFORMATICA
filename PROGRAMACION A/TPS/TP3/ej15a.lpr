program ej15a;
Var
  Arch:text;
  L,Car1,Car2:char;
  ContPal:byte;
begin
  ContPal:=0;
  Assign(Arch,'ej15a.txt'); reset(Arch);
  writeln('Ingrese la letra');
  readln(L);
  L:=UpCase(L);
  read(Arch,Car1);
  while Car1<>'.' do
    Begin
      repeat
        read(Arch,Car2);
      until (Car2=' ') or (Car2='.');;
      If Car1=L then
        ContPal:=ContPal+1;
      If Car2 <> '.' then
       read(Arch, Car1)
      else
       Car1:=Car2
    end;

  writeln(ContPal,' palabras comienzan con la letra ',L);
  readln;
  Close(Arch);
end.

