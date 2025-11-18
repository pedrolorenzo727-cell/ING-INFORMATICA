program eliminacionrec;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure leerVector (var v : TV; var n : byte);
var
  archE : text;
  i : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE,n);
  for i := 1 to n do
      read(archE, v[i]);
  close(archE);
end;

procedure eliminaRec (var v : TV; pos : byte; var n : byte);
begin
  if pos <> n then
  begin
     v[pos] := v[pos + 1];
    eliminaRec(v,pos + 1, n);
  end
  else
       n := n - 1;
end;

procedure mostrarVector (v : TV; n : byte);
begin
  if n > 0 then
  begin
    mostrarVector(v,n - 1);
    write(v[n]:4);
  end;
end;

var
  v : TV;
  n, pos : byte;

begin
  leerVector(v,n);
  mostrarVector(v,n);
  writeln();
  readln(pos);
  eliminaRec(v,pos,n);
  writeln();
  mostrarVector(v,n);
  readln();
end.

