program prueba;

var
  archE : text;
  pal: string[4];
  num : word;
begin
  assign(archE, 'text.txt');
  reset(archE);
  read(archE, pal, num);
  writeln(pal, ' ', num);
  readln();
end.

