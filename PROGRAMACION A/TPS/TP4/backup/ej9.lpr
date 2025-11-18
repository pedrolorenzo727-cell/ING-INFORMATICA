program ej9;
Procedure SumaFraccion(N1,D1,N2,D2:integer; Var NumS,DenS:integer);
Begin
  If D1<>D2 then
    Begin
      DenS:=D1*D2;
      NumS:=N1*D2 + N2*D1
    end
  else
    Begin
      DenS:=D1;
      NumS:=N1+N2;
    end;
end;

Procedure ProductoFraccion(N1,D1,N2,D2:integer; Var NumP,DenP:integer);
Begin
  NumP:=N1*N2;
  DenP:=D1*D2;
end;

Procedure MuestraComoFraccion(DenS,NumS,DenP,NumP:integer);
Begin
  writeln('La suma como fraccion es ',NumS,' / ',DenS);
  writeln('El producto como fraccion es ',NumP,' / ',DenP);
end;

Var
  N1,D1,N2,D2,DenS,NumS,DenP,NumP:integer;
  Arch:text;
begin
  Assign(Arch,'ej9.txt'); reset(Arch);
  readln(Arch,N1,D1,N2,D2);
  while not eof(Arch) do
    Begin
      readln(Arch,N1,D1,N2,D2);
      SumaFraccion(N1,D1,N2,D2,NumS,DenS);
      ProductoFraccion(N1,D1,N2,D2,NumP,DenP);
      MuestraComoFraccion(DenS,NumS,DenP,NumP);
    end;
  readln;
  Close(Arch);
end.

