program ej19;
var
  archE : text;
  num, max : integer;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  read(archE, num);
  while not eof(archE) do
  begin
    max := 0;
    if num < 0 then
    begin
      read(archE, num);
      while (num > 0) and not eof(archE) do
      begin
           if num > max then
              max := num;
           read(archE, num);
      end;

      if not eof(archE) then
         write(max, ' ');
    end
    else
        read(archE, num);
  end;
  close(archE);
  readln();
end.

