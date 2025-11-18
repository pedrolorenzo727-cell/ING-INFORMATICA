program ej20;
Var
  Num:integer;
  Suma,Cant:byte;
  Arch:text;
begin
  Assign(Arch,'ej20.txt'); reset(Arch);

  repeat                   //Avanza hasta el primer negativo
    read(Arch,Num);
  until Num<0 ;

  while not eof(Arch) do
    Begin
      Cant:=0;
      Suma:=0;
      read(Arch,Num);
      While Num>=0 do
        Begin
          If Num>0 then
            Begin
              Cant:=Cant+1;
              Suma:=Suma+Num;
            end;
          read(Arch,Num);
        end;
      If not eof(Arch) and (Cant<>0) then
        write(Suma/Cant:0:1,' ')
    end;
  readln;
  Close(Arch);
end.

