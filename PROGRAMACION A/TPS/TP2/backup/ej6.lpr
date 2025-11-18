program ej6;
Var
  L1,L2,L3:char;

begin
  writeln('Ingrese las 3 letras');
  readln(L1,L2,L3);
  L1:=UpCase(L1);
  L2:=Upcase(L2);
  L3:=UpCase(L3);
  writeln('las letras ordenadas en forma ascendente quedan: ');

  //Inciso a Secuencial
  If (L1>L2) and (L2>L3) then
    writeln(L3,L2,L1);
  If (L1>L3) and (L3>L2) then
    writeln(L2,L3,L1);
  If (L2>L1) and (L1>L3) then
    writeln(L3,L1,L2);
  If (L2>L3) and (L3>L1) then
    writeln(L1,L3,L2);
  If (L3>L1) and (L1>L2) then
    writeln(L2,L1,L3);
  If (L3>L2) and (L2>L1) then
    writeln(L1,L2,L3);

  //Inciso b
  If (L1>L2) and (L2>L3) then
    writeln(L3,L2,L1)
  else
    If (L1>L3) and (L3>L2) then
      writeln(L2,L3,L1)
    else
      If (L2>L1) and (L1>L3) then
        writeln(L3,L1,L2)
      else
        If (L2>L3) and (L3>L1) then
          writeln(L1,L3,L2)
        else
          If (L3>L1) and (L1>L2) then
            writeln(L2,L1,L3)
          else
           If (L3>L2) and (L2>L1) then
             writeln(L1,L2,L3);

  //Inciso c
  If (L1<L2) then
    If (L2<L3) then
      writeln(L1,L2,L3)
    else
      If (L1<L3) then
        writeln(L1,L3,L2)
      else
        writeln(L3,L1,L2)
  else
    If (L2<L1) then
      If(L1<L3) then
        writeln(L2,L1,L3)
      else
        If (L2<L3) then
          writeln(L2,L3,L1)
        else
          Writeln(L3,L2,L1);
readln;
end.

if (a < b)then
       if (b < c) then
          writeln(a, ' ', b, ' ', c)
       else
         if (a < c) then
            writeln(a, ' ', c, ' ', b)
         else
            writeln(c, ' ', a, ' ', b)
    else
        if (b < c) then
           if (a < c) then
                writeln(b, ' ', a, ' ', c)
           else
               writeln(b, ' ', c, ' ', a)
        else
            writeln(c, ' ', b, ' ', a);

