program ej6;
var
  saldo, monto: real;
  codigo : char;
  cont : byte;
begin
  writeln('Ingrese saldo');
  readln(saldo);
  cont := 0;
  writeln('Ingrese codigo');
  writeln('R : Retiro');
  writeln('D : Deposito');
  writeln('F : Fin de datos');
  readln(codigo);
  while upcase(codigo) <> 'F' do
  begin
    writeln();
    writeln('Ingrese monto');
    readln(monto);
    if upcase(codigo) = 'D' then
       saldo := saldo + monto
    else
      if upcase(codigo) = 'R' then
         if saldo - monto >= 0 then
            saldo := saldo - monto
         else
           begin
             writeln('Fondos Insuficientes');
             cont := cont + 1;
           end
      else
          writeln('Codigo Invalido');
    writeln();
    writeln('Ingrese codigo');
    writeln('R : Retiro');
    writeln('D : Deposito');
    writeln('F : Fin de datos');
    readln(codigo);
  end;
    writeln('Saldo Actual: ', saldo:4:2);
    writeln('Intentos fallidos: ', cont);
    readln();
end.

