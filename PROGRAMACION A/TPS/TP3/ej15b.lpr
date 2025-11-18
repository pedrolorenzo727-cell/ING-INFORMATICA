program ej15b;
Var
  L,Car:char;
  ContPal:byte;
  Arch:text;
  Esta:boolean;

begin
  ContPal:=0;
  Assign(Arch,'ej15a.txt'); reset(Arch);
  writeln('Ingrese una letra');
  readln(L);
  L:=UpCase(L);
  read(Arch,Car);
  while Car<>'.' do
    Begin
      Esta:=False;
      while (Car<>' ') and (Car<>'.') do
        Begin
          If UpCase(Car)=L then
            Esta:=true;
          read(Arch,Car);
        end;
      If Esta then
        ContPal:=ContPal+1;
      If Car<>'.' then
        read(Arch,Car);
    end;
  writeln(ContPal,' palabras contienen la letra ',L);
  readln;
  Close(Arch);
end.

