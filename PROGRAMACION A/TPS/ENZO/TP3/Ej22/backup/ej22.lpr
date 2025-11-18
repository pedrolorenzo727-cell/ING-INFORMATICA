program Ej22;
type
  st20 = string[20];
var
  archE, archS : text;
  contV, contVMax, contCapicua, i, j : byte;
  palabra, palabraMax, palabraInv : st20;
  car : char;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  assign(archS, 'Salida.txt');
  rewrite(archS);
  read(archE, car);
  contVMax := 0;
  contCapicua := 0;
  while not eof(archE) do
  begin
    if car = ' ' then
       read(archE, car)
    else
      begin
           palabra := '';
           i := 0;
           contV := 0;
           while (car <> ' ') and not eof(archE) do
           begin
                palabra := palabra + car;
                i := i + 1;
                if upcase(car) in ['A','E','I','O','U'] then
                   contV := contV + 1;
                read(archE, car);
           end;
           if contV > contVMax then
           begin
                contVMax := contV;
                palabraMax := palabra;
           end;
           palabraInv := '';
           for j := i downto 1 do
               palabraInv := palabraInv + palabra[j];
           if i > 4 then
                write(archS, palabraInv, ' ');
           if palabra = palabraInv then
              contCapicua := contCapicua + 1;
      end;
  end;
  close(archE);
  close(archS);
  writeln('Palabra con mas vocales: ', palabraMax);
  writeln('Cantidad de palabras palindromas: ', contCapicua);
  readln();
end.

