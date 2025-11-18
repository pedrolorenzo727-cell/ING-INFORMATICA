program ej6b;

const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure insertaOrdenadoRec (var V : TV; i : byte; var cont, n : byte; x : integer);
begin
  if i = 0 then
  begin
     V[i + 1] := x;
     n := n + 1;
     cont := 0;
  end
  else
      if V[i] > x then
      begin
         V[i + 1] := V[i];
         cont := cont + 1;
         insertaOrdenadoRec(V, n - cont, cont, n, x);
      end
      else
          begin
               V[i + 1] := x;
               n := n + 1;
               cont := 0;
          end
end;

procedure leerVector (var V: TV; var n : byte);
var
  archE : text;
  x : integer;
  cont : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  while not eof (archE) do
  begin
    read(archE, x);
    insertaOrdenadoRec(V, n, cont, n, x);
  end;
end;

procedure mostrarVector (V : TV; n : byte);
begin
     if n > 0 then
     begin
          mostrarVector(V, n - 1);
          write(V[n], ' ');
     end;
end;

function buscBin (V : TV; pri, med, ult : byte; x : integer):byte;
begin
  if ult >= pri then (*En el caso en el que pri = ult, tambien debo preguntar, por ejemplo con este V = [1, 3, 5, 7, 9], si busco el 4. Lo hago asi y no con ult > pri y en el else V[med] = x porque puede ocurrir que si busco un elemento menor a todos, al llegar a esa parte, preguntaria por V[0] y eso no se puede*)
     if V[med] = x then
        buscBin := med
     else
         if x > V[med] then
            buscBin := buscBin(V,med + 1, ((med + 1 + ult) div 2), ult, x)
         else
             buscBin := buscBin(V,pri, (pri + med - 1) div 2, med - 1,x)
  else
      buscBin := 0;
end;

var
  V : TV;
  n : byte;
  x : integer;

begin
  leerVector(V,n);
  mostrarVector(V,n);
  writeln();
  readln(x);
  writeln(buscBin(V,1,(1 + n) div 2, n, x));
  readln();
end.

