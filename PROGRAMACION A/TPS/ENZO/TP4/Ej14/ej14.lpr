program ej14;

Type
    St20=string[20];

Procedure Evalua(Var Todas: string; Var Max, cont: byte);
Var
   Arch: Text;
   Car: char;
   Pal: St20;
   i: byte;
Begin
     Assign (Arch, 'Entrada.txt'); Reset(Arch);
     Max:=0;
     Read(Arch, Car);
     While Car <> '.' do
           If Car = ' ' then
              Read(Arch, Car) {si es blanco lee otro caracter}
           else
               begin { es el comienzo de palabra}
                     Pal:= '';
                     i:=0;
                     While (Car <> '.') and (Car <> ' ') do
                     begin {cuenta los caracteres y arma la palabra}
                           i:=i+1;
                           Pal:= Pal + Car;
                           Read(Arch, Car);
                     End;
                     If i>Max then {evalua si es m s larga}
                     begin
                          Todas := Pal;
                          Max := i;
                          cont := 1;
                     End
                     else
                         if i = Max then {evalua si es igual}
                         begin
                            Todas:= Todas + ' '+ Pal;
                            cont := cont + 1;
                         end;
               end;
     Close(Arch);
End;
Var
   Todas: string;
   Max, cont : byte;
Begin
     Evalua(Todas, max, cont);
     Writeln('estas son las palabras mas largas') ;
     writeln(Todas);
     Writeln('Tienen ', Max, ' caracteres') ;
     writeln('Cantidad de palabras mas largas ', cont);
     Readln;
end.

