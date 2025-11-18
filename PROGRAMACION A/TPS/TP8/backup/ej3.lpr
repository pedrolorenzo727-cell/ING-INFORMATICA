program ej3;
function confuso(a,b:integer):integer;
begin
 if (b = 0) then
   confuso := 0
 else
   if (b mod 2 = 0) then
     confuso := confuso(a+a, b div 2)
   else
     confuso := confuso(a+a, b div 2) + a;
end;

Var
  a,b:integer;
begin
  writeln('Ingrese a,b'); readln(a,b);
  writeln('Resultado: ',Confuso(a,b));
  readln;
end.

