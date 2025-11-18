program ej9;
Var
  Ascendente:boolean;
  Arch:text;
  N1,N2:integer;

begin
  Ascendente:=true;
  Assign(Arch,'ej9.txt'); reset(Arch);
  readln(Arch,N1);
  while not eof(Arch) do
    Begin
      readln(Arch,N2);
      If N2<N1 then
        Ascendente:=false;
      N1:=N2;
    end;
  If Ascendente then
    writeln('Los numeros estan ordenados de forma ascendente')
  else
    writeln('Los numeros no estan ordenados de forma ascendente');
  readln;
  Close(Arch);
end.

