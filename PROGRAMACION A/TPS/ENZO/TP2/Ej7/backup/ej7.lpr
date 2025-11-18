program ej7;
const
  impH = 1000;
  impM = 1200;
  descTalle = 5;
  descCant = 7;
  IVA = 21;
var
  genero, talle : char;
  cant : byte;
  importe : real;
begin
  writeln('Ingrese genero (H o M)');
  readln(genero);
  writeln('Ingrese cantidad de camisas');
  readln(cant);
  writeln('Ingrese talle (S, M, L, X)');
  readln(talle);
  if upcase(genero) = 'H' then
     importe := impH
  else
    importe := impM;
  importe := (importe + importe*IVA/100)*cant; (*Agrego IVA al importe unitario y multiplico por la cantidad*)

  if ((upcase(talle) = 'S') and (upcase(genero) = 'H')) or ((upcase(talle) = 'X') and (upcase(genero) = 'M')) then

  if cant > 12 then
     importe := importe - importe*descCant/100;
  writeln('Importe: $', importe:4:2);
  readln();
end.

