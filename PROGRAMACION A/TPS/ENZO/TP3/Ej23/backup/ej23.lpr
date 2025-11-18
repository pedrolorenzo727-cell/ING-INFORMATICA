program ej23;
var
  archE, archS : text;
  i, contDig, contInv, contTotal, iInvMax : byte;
  letMayus, letMinus, carEspecial : boolean;
  car : char;
  palabra, palabraInvMax : string[15];

begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  assign(archS, 'Salida.txt');
  rewrite(archS);
  contInv := 0;
  contTotal := 0;
  iInvMax := 0;
  read(archE, car);
  while not eof(archE) do
  if car = ' ' then
     read(archE, car)
  else
      begin
           i := 0;
           letMayus := false;
           letMinus := false;
           contDig := 0;
           palabra := '';
           carEspecial := false;
           while (car <> ' ') and not eof(archE) do
           begin
             i := i + 1;
             if (car in ['A'..'Z']) then
                letMayus := true
             else
                 if (car in ['a'..'z']) then
                    letMinus := true
                 else
                     if car in ['0'..'9'] then
                        contDig := contDig + 1
                     else
                         carEspecial := true;
             palabra := palabra + car;
             read(archE, car);
           end;
           contTotal := contTotal + 1;
           if letMayus and letMinus and (not carEspecial) and (contDig = 4) then
              write(archS, palabra, ' ')
           else
               begin
                    contInv := contInv + 1;
                    if i > iInvMax then
                    begin
                         iInvMax := i;
                         palabraInvMax := palabra;
                    end;
               end;
      end;
      close(archE);
      close(archS);
      writeln('Porcentaje de palabras invalidas: ', contInv*100/contTotal:4:2, '%');
      if iInvMax <> 0 then
         writeln('Palabra invalida mas larga: ', palabraInvMax);
      readln();
end.

