program ej6;

type
  ST5 = string[5];
  TRegVen = record
    legajo : ST5;
    n : word;
    valor : real;
  end;

  ST15 = string[15];
  TRegLeg = record
    legajo : ST5;
    nombre : ST15;
    total, mayorV : real;
    nMayorV : byte;
  end;

  TArchLeg = file of TRegLeg;
  TArchVen = file of TRegVen;

procedure actualizarArchivo (var legajos : TArchLeg; var ventas : TArchVen; nombre : ST15);
var
   temp : TArchLeg;
   RL : TRegLeg;
   RV : TREGVen;
begin
     assign(temp, 'temp.dat');
     rewrite(temp);
     reset(legajos);
     reset(ventas);
     read(legajos, RL);
     read(ventas, RV);
     while not eof(legajos) or not eof(ventas) do
     if RL.legajo = RV.legajo then
     begin
       while RL.legajo = RV.legajo do
       begin
         RL.total := RL.total + RV.valor;
         if RV.valor > RL.mayorV then
         begin
           RL.mayorV := RV.valor;
           RL.nMayorV := RV.n;
         end;
         read(ventas, RV);
       end;
       writeln(RL.legajo, ' ', RL.total*0.5:4:2);
       write(temp, RL);
       read(legajos, RL);
     end
     else
         if RL.legajo < RV.legajo then
         begin
           write(temp, RL);
                  writeln(RL.legajo, ' ', RL.total*0.5:4:2);
           read(legajos, RL);
         end
         else
             read(ventas, RV);
     write(temp, RL);
     close(legajos);
     close(ventas);
     close(temp);
     erase(legajos);
     rename(temp,nombre);
end;

var
   legajos : TArchLeg;
   ventas : TArchVen;

begin
  assign(legajos, 'Legajos.dat');
  assign(ventas, 'ventas.dat');
  actualizarArchivo(legajos,ventas,'LegajosAct.dat');
  readln();
end.

