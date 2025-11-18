program ej7;
var
  color1,color2 : string;
  palo1, palo2 : char;
  nCarta1, nCarta2: integer;
begin
  writeln('Ingrese color del mazo: Rojo o Azul ');
  readln(color1);
  writeln('Ingrese numero de carta: (De 1 a 12) ');
  readln(nCarta1);
  writeln('Ingrese palo de la carta: (O,C,E,B) ');
  readln(palo1);
  writeln('Ingrese color del mazo: Rojo o Azul ');
  readln(color2);
  writeln('Ingrese numero de carta: (De 1 a 12) ');
  readln(nCarta2);
  writeln('Ingrese palo de la carta: (O,C,E,B) ');
  readln(palo2);
  writeln('A: ', ((nCarta1 = 1) or (nCarta2 = 1)) and ((palo1 = 'C') or (palo2 = 'C')));
  writeln('B: ', ((nCarta1 >= 10) and (color1 = 'Rojo')) or ((nCarta2 >= 10) and (color2 = 'Rojo')));
  writeln('C: ', ((color1 <> color2) and (nCarta1 = nCarta2) and (palo1 = palo2)));
  writeln('D: ', (palo1 = palo2) and ((nCarta1 = nCarta2 + 1) or (nCarta2 = nCarta1 + 1)));
  writeln('E: ', (palo1 <> palo2) and (color1 <> color2) and (nCarta1 + nCarta2 = 12));
  writeln('F: ', (nCarta1 = nCarta2) and ((palo1 = palo2) or (color1 = color2)));
  writeln('G: ', ((nCarta1 <> nCarta2) and ((palo1 = palo2) and (color1 = color2))));
  writeln('H: ',
                ((color1 = 'Rojo') and (color2 = 'Azul')) or

                 (((color1 = 'Rojo') and (color2 = 'Rojo')) and (palo1 = palo2) and (nCarta1 > nCarta2)) or

                 (((color1 = 'Rojo') and (color2 = 'Rojo')) and
                 (
                           ((palo1 = 'O') and (palo2 <> 'O')) or
                           ((palo1 = 'C') and ((palo2 <> 'O') and (palo2 <> 'C'))) or
                           ((palo1 = 'E') and ((palo2 <> 'O') and (palo2 <> 'C') and (palo2 <> 'E')))
                 )
         ));
  readln();
end.

