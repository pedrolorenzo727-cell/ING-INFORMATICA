program ej5;
Var
  N1,N2,N3: integer;

begin
  writeln('Ingrese tres numeros');
  readln(N1,N2,N3);

  //Inciso a
  if (N1>N2) and (N1>N3) or (N1>=N2) and (N1>N3) or (N1>N2) and (N1>=N3)  then
    writeln('El numero mas grande es el ',N1);
  if (N2>N1) and (N2>N3) or (N2>=N1) and (N2>N3) or (N2>N1) and (N2>=N3)then
    writeln('El numero mas grande es el ',N2);
  If (N3>N1) and (N3>N2) or (N3>=N1) and (N3>N2) or (N3>N1) and (N3>=N2) then
    writeln('El numero mas grande es el ',N3);
  If (N1=N2) and (N2=N3) then
    writeln('Los numeros ingresados son iguales');

  //Inciso b
  If (N1>N2) and (N1>N3) or (N1>=N2) and (N1>N3) or (N1>N2) and (N1>=N3)  then
    writeln('El numero mas grande es el ',N1)
  else
    If (N2>N1) and (N2>N3) or (N2>=N1) and (N2>N3) or (N2>N1) and (N2>=N3)then
      writeln('El numero mas grande es el ',N2)
    else
      If (N3>N1) and (N3>N2) or (N3>=N1) and (N3>N2) or (N3>N1) and (N3>=N2) then
        writeln('El numero mas grande es el ',N3)
      else
         writeln('Los numeros ingresados son iguales');

  //Inciso c
  If N1>N2 then
    Begin
      If N1>N3 then
        writeln('El numero mas grande es el ',N1)
      else
        writeln('El numero mas grande es el ',N3)
    end
  else
    If N2>N3 then
      writeln('El numero mas grande es el ',N2)
    else
      If N3>N1 then
        writeln('El numero mas grande es el ',N3)
      else
        writeln('Los numeros ingresados son iguales'); }

  readln;
end.

