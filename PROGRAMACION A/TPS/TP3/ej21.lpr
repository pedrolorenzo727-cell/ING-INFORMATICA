program ej21;
Var
  i,SCMasNum,MasCantNum,CantNum:byte;
  Num1,Num2,Max:integer;
  Arch:text;
begin
  MasCantNum:=0;
  i:=0;
  Num2:=1;
  Assign(Arch,'ej21.txt'); reset(Arch);
  writeln('Subconjunto   Maximo');
  read(Arch,Num1);
  while (Num2<>0) do
    Begin
      CantNum:=0;
      Max:=-30000;
      i:=i+1;
      while Num1<>0 do
        Begin
          CantNum:=CantNum+1;
          If Num1>Max then
            Max:=Num1;
          read(Arch,Num1);
        end;
      writeln(i:6,Max:11);
      If CantNum>MasCantNum then
        Begin
          SCMasNum:=i;
          MasCantNum:=CantNum;
        end;
      read(Arch,Num2);
      If Num2<>0 then
        Num1:=Num2;
    end;

  writeln('El subconjunto con mas elementos el el ',SCMasNum);
  readln;
  Close(Arch);
end.

