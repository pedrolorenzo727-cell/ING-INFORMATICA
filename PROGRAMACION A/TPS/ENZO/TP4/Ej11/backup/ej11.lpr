program ej11;

function ejeSimetria (a, b : real):real;
begin
  ejeSimetria := -b/(2*a);
end;

function concavidad (a : real):byte;
begin
  if a > 0 then
     concavidad := 1  (*Hacia Arriba*)
  else
    concavidad := 0   (*Hacia Abajo*)
end;

function discriminante (a,b,c : real):real;
begin
  discriminante := b*b - 4*a*c;
end;

procedure raices (a,b,c : real);
var
  x1, x2, d : real;
begin
    d := discriminante(a,b,c);
    if d < 0 then
       writeln('No tiene reaices')
    else
      if d = 0 then
         writeln('X = ', -b/(2*a))
      else
        begin
          writeln('X1 = ', (-b + d)/2*a :4:2);
          writeln('X2 = ', (-b - d)/2*a :4:2);
        end;
end;

function imagen (a,b,c, x : real):real;
begin
    imagen := a*(x*x) + b*x + c;
end;

procedure escribirParabola (a,b,c : real);
begin
    writeln('Y = ', a:4:2, '*x^2 + ', b:4:2, '*x + ', c:4:2);
end;

procedure menu (var op : byte; a, b, c : real);
begin
    write('MENU DE OPCIONES PARA LA PARABOLA: ');
    escribirParabola(a,b,c);
    writeln('Elija una opcion');
    writeln('1 : Eje de Simetria');
    writeln('2 : Concavidad');
    writeln('3 : Raices');
    writeln('4 : Imagen de un conjunto de valores');
    writeln('5 : Salir');
    writeln();
    repeat
      readln(op)
    until (op > 0) and (op <= 5);
end;

var
  a,b,c, x : real;
  op, i, n : byte;
begin
  writeln('Ingrese coeficientes de la parabola');
  readln(a, b, c);
  repeat
        menu(op,a,b,c);
        case op of
             1 : begin
                      writeln('Eje de Siemetria');
                      writeln('X = ', ejeSimetria(a,b):4:2);
                      if concavidad(a) = 1 then
                         writeln('Hay un minimo')
                      else
                        writeln('Hay un maximo');
                 end;
             2:  if concavidad(a) = 1 then
                    writeln('Concava hacia arriba')
                 else
                     writeln('Concava hacia abajo');
             3: raices(a,b,c);
             4: begin
                     writeln('Ingrese n');
                     readln(n);
                     for i := 1 to n do
                     begin
                         writeln('Ingrese X');
                         readln(x);
                         writeln('F(',x:4:2,') = ', imagen(a,b,c,x):4:2);
                     end;
                end;
        end;
        writeln();
  until op = 5;
  readln();
end.

