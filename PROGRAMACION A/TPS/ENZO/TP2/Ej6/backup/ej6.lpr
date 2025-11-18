program ej6;
var
  a, b, c: char;
begin
  writeln('Ingrese tres letras distintas');
  readln(a,b,c);
  (*Inciso A*)
  (*
  if (a > b) and (a > c) and (c > b) then
     writeln(b, ' ', c, ' ', a);
  if (a > b) and (a > b) and (b > c) then
     writeln(c, ' ', b, ' ', a);
  if (b > a) and (b > c) and (a > c) then
     writeln(c, ' ', a, ' ', b);
  if (b > a) and (b > c) and (c > a) then
     writeln(a, ' ', c, ' ', b);
  if (c > a) and (c > b) and (a > b) then
     writeln(b, ' ', a, ' ', c);
  if (c > a) and (c > b) and (b > a) then
     writeln(a, ' ', b, ' ', c);
  *)

  (*Inciso B*)
  if (a < b) and (b < c) then
     writeln(a, ' ', b, ' ', c)
  else
      if (a < b) then
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

  (*Inciso C*)
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
  readln();
end.

