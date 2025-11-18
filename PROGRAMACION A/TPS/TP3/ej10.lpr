program ej10;
Var
  N1,N2:integer;
  Frecu:byte;
  Arch:text;

begin
  Assign(Arch,'ej10.txt'); reset(Arch);
  readln(Arch,N1);
  Frecu:=1;
  writeln('Numero    Frecuencia');
  while not eof(Arch) do
    Begin
      readln(Arch,N2);
      If N2>N1 then
        Begin
          writeln(N1:4,'    ',Frecu);
          Frecu:=1;
        end
      else
        Frecu:=Frecu+1;
      N1:=N2;
    end;
  writeln(N1:4,'    ',Frecu);
  readln;
  Close(Arch);
end.

