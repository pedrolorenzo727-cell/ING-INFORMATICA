program ej11a;
var
  archE : text;
  saldo, monto : real;
  cont : byte;
  codigo : char;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  cont := 0;
  readln(archE, saldo);
  while not eof(archE) do
  begin
    readln(archE, codigo, monto);
    if codigo = 'D' then
       saldo := saldo + monto
    else
      if codigo = 'R' then
         if saldo - monto >= 0 then
            saldo := saldo - monto
         else
          cont := cont + 1;
  end;
  close(archE);
  writeln('Saldo: $', saldo:4:2);
  writeln('Errores: ', cont);
  readln();
end.

