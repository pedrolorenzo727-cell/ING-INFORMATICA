program ej5;
var
  n1, n2 , n3 : integer;
begin
     writeln('Ingrese los tres numeros');
     readln(n1,n2,n3);
  (*Inciso A Asumo que no puede venir, ej : 4 4 1*)
  (*
  if (n1 > n2) and (n1 > n2) then
     writeln(n1, ' es el mayor');
  if (n2 > n1) and (n2 > n3) then
     writeln(n2, ' es el mayor');
  if (n3 > n1) and (n3 > n2) then
     writeln(n3, ' es el mayor');
  if (n1 = n2) and (n1 = n3) then
     writeln('Los numeros son iguales');
  readln();
  *)

  (*Inciso B*)
  (*
   if (n1 > n2) and (n1 > n3) then
      writeln(n1, ' es el mayor')
   else
     if (n2 > n1) and (n2 > n3) then
        writeln(n2, ' es el mayor')
     else
       if (n3 > n1) and (n3 > n2) then
          writeln(n3, ' es el mayor')
       else
         if (n1 = n2) and (n1 = n3) then
            writeln('Son iguales')
         else
           writeln('No nay mayor');
     *)

   (*Inciso C*)
   if n1 > n2 then
      if n1 > n3 then
         writeln(n1, ' es el mayor')
      else
          writeln(n3, ' es el mayor')
   else
       if n2 > n3 then
          writeln(n2, ' es el mayor')
       else
        if n3 > n2 then
           writeln(n3, ' es el mayor')
        else
            writeln('Son iguales');
   readln();
end.

