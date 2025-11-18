program ej19;
Var
  Arch:text;
  Num,Max:integer;

begin
  Assign(Arch,'ej19.txt'); reset(Arch);

  repeat       //Va hasta el primer negativo
    read(Arch,Num);
  until Num<0 ;

  while not eof(Arch) do
    Begin
      Max:=-1;
      read(Arch,Num);
      while not eof(Arch) and (Num>0)  do
        Begin
          If Num>Max then
            Max:=Num;
          read(Arch,Num);
        end;
      If not eof(Arch) then
        writeln(Max,' ');
    end;
  readln;
  Close(Arch);
end.

