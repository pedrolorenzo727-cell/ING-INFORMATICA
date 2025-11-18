program ej12;

procedure fibo (cota : word);
var
  n1, n2, aux : word;
begin
  n1 := 1;
  n2 := 1;
  write(n1, ' ');
  while n1 <= cota do
  begin
      write(n2, ' ');
      aux := n2 + n1;
      n1 := n2;
      n2 := aux;
  end;
  writeln();
end;

procedure generarTerminos (n : byte);
var
  i : byte;
  cota : word;
begin
     for i := 1 to n do
     begin
          writeln('Ingrese cota');
          readln(cota);
          fibo(cota);
     end;
end;

var
  n : byte;
  cota : word;
begin
  writeln('Ingrese n');
  readln(n);
  generarTerminos(n);
  readln();
end.

