program ej11;

procedure generarFila (n : byte);
begin
  if n > 0 then
    begin
         write(n, ' ');
         generarFila(n - 1);
    end;
end;

procedure generarColumna (n : byte);
begin
  if n > 0 then
  begin
    generarColumna(n - 1);
    generarFila(n);
    writeln();
  end;
end;

var
  n : byte;

begin
  readln(n);
  generarColumna(n);
end.

