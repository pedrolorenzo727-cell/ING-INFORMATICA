program ej20;
var
  archE: text;
  num, acum : integer;
  cont : byte;

begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  read(archE, num);
  while not eof(ArchE) do
  begin
    if num < 0 then (*Si encuentro un negativo*)
    begin
      read(archE, num);
      acum := 0;
      cont := 0;
      while num >= 0 do (*Mientras no encuentre un negativo*)
      begin
           if num <> 0 then
           begin
              acum := acum + num;
              cont := cont + 1;
           end;
           read(archE, num);
      end;
      if cont <> 0 then
         write(acum/cont:4:2, ' ');
    end
    else
        read(archE, num);
  end;
  close(archE);
  readln();
end.

