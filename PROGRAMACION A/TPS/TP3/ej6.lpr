program ej6;
Var
  Arch:text;
  Saldo,Monto:real;
  Movimiento:char;
  ContNoRet:byte;
begin
  ContNoRet:=0;
  Assign(Arch,'ej6.txt'); reset(Arch);
  readln(Arch,Saldo);
  read(Arch,Movimiento);
  while Movimiento<>'F' do
    Begin
      readln(Arch,Monto);
      If UpCase(Movimiento)='D' then
        Saldo:=Saldo+Monto
      else
        If Saldo-Monto<0 then
          ContNoRet:=ContNoRet+1
        else
          Saldo:=Saldo-Monto;
      read(Arch,Movimiento);
    end;

  writeln('El Saldo de la cuenta luego de procesar las transacciones es de $',Saldo:0:2);
  If ContNoRet<>0 then
    writeln('No pudo retirar dinero por insuficiencia de fondos ',ContNoRet,' veces')
  else
    writeln('Nunca tuvo insuficiencia de fondos');
  Close(Arch);
  readln;
end.

