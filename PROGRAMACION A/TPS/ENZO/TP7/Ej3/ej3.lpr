program ej3;
const
  maxElem = 100;

type
  TRegPunto = record
    x, y, distC : real;
    cuadrante : byte;
  end;

  TV = array[1..maxElem] of TRegPunto;
  TV2 = array[1..7] of byte;

function distancia (x1, x2, y1, y2 : real):real;
begin
  distancia := sqrt(sqr(x2 - x1) + sqr(y2 - y1));
end;

function tipoCuad (x, y : real):byte; (*Utilizo del 1 al 7 porque al hacer el vector debo tener posiciones positivas*)
begin
  if (x = 0) then
     if y = 0 then
        tipoCuad := 7 (*7 es para Centro*)
     else
       tipoCuad := 6 (*6 es para Eje Y*)
  else
       if y = 0 then
          tipoCuad := 5 (*5 es para Eje X*)
       else
         if x > 0 then
            if y > 0 then
               tipoCuad := 1
            else
              tipoCuad := 4
         else
              if y > 0 then
                 tipoCuad := 2
              else
                tipoCuad := 3;
end;

procedure leerVector (var puntos : TV; var n : byte);
var
  archE : text;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
    n := n + 1;
    with puntos[n] do
    begin
      readln(archE, x,y);
      distC := distancia(x,0,y,0);
      cuadrante := tipoCuad(x,y);
    end;
  end;
  close(archE);
end;

function masLejano (puntos : TV; n : byte):byte;
var
  i, posMax : byte;
begin
  posMax := 1;
  for i := 2 to n do
      if puntos[i].distC > puntos[posMax].distC then
         posMax := i;
  masLejano := posMax;
end;

function masCercano (puntos : TV; n : byte):byte;
var
  i, posMax : byte;
begin
  posMax := 1;
  for i := 2 to n do
      if puntos[i].distC < puntos[posMax].distC then
         posMax := i;
  masCercano := posMax;
end;

procedure iniciaVector (var cuad : TV2; m : byte);
var
  i : byte;
begin
  for i := 1 to m do
      cuad[i] := 0;
end;

function nombrar (i : byte):string;
begin
  case i of
       1: nombrar := 'Primer Cuadrante ';
       2: nombrar := 'Segundo Cuadrante ';
       3: nombrar := 'Tercer Cuadrante ';
       4: nombrar := 'Cuarto Cuadrante ';
       5: nombrar := 'Eje X ';
       6: nombrar := 'Eje Y ';
       7: nombrar := 'Centro ';
  end;
end;

procedure generarVectorCuad (puntos : TV; n : byte; var cuad : TV2; var m : byte);
var
  i : byte;
begin
  m := 7;
  iniciaVector(cuad,m);
  for i := 1 to n do
      cuad[puntos[i].cuadrante] := cuad[puntos[i].cuadrante] + 1;
end;

procedure porcentaje (var cuad : TV2; m, n  : byte);
var
  i : byte;
begin
  for i :=1 to m do
      writeln('Porcentaje de puntos en el ', nombrar(i), cuad[i]*100/n:4:2, '%');
end;

var
  puntos : TV;
  cuad : TV2;
  n, m, posMasL, posMasC : byte;
  x1, y1, x2, y2 : real;

begin
     leerVector(puntos,n);
     posMasL := masLejano(puntos,n);
     posMasC := masCercano(puntos,n);
     writeln('Punto mas lejano al centro: (',puntos[posMasL].x:4:2, ',', puntos[posMasL].y:4:2,')');
     writeln('Punto mas cercano al centro: (',puntos[posMasC].x:4:2, ',', puntos[posMasC].y:4:2,')');
     generarVectorCuad(puntos,n,cuad,m);
     porcentaje(cuad,m,n);
     writeln();
     writeln('Ingrese X1 e Y1');
     readln(x1,y1);
     writeln('Ingrese X2 e Y2');
     readln(x2,y2);
     writeln('La distancia es: ', distancia(x1,x2,y1,y2):4:2);
     readln();
end.
