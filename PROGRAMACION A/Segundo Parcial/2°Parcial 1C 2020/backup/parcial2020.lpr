program parcial2020;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of char;
  TReg = record
    j : byte;
    PM : real;
  end;
  TV = array[1..maxElem] of TReg;

procedure leerMatriz (var mat : TM; var n, m : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n,m);
  for i := 1 to n do
  begin
      for j := 1 to m do
          read(archE,mat[i,j]);
      readln(archE);
  end;
  close(archE);
end;

function cantMayus (mat : TM; i, j : byte):byte;
begin
  if i = 0 then
     cantMayus := 0
  else
    if mat[i,j] in ['A'..'Z'] then
       cantMayus := 1 + cantMayus(mat, i - 1, j)
    else
      cantMayus := cantMayus(mat, i - 1, j);
end;

procedure insertaOrdenadoRec (var V : TV; i : byte; var k : byte; C : byte; P : real);
begin
  if i = 0 then
  begin
    V[i + 1].j := C;
    V[i + 1].PM := P;
    k := k + 1;
  end
  else
      if V[i].PM < P then
      begin
        V[i + 1] := V[i];
        insertaOrdenadoRec(V, i - 1, k, C, P);
      end
      else
          begin
              V[i + 1].j := C;
              V[i + 1].PM := P;
              k := k + 1;
          end;
end;

procedure generarV (mat : TM; n, m : byte; var V : TV; var k : byte);
var
  j : byte;
  p: real;
begin
  k := 0;
  for j := 1 to m do
  begin
      P := cantMayus(mat,n,j)*100/n;
      insertaOrdenadoRec(V,k,k,j,P);
  end;
  k := 3;
end;

procedure mostrarVector (V : TV; k : byte);
begin
  if k > 0 then
  begin
    mostrarVector(V, k - 1);
        writeln(V[k].j, ' ', V[k].PM :4:2);
  end;
end;

var
  mat : TM;
  V : TV;
  n, m, k : byte;

begin
  leerMatriz(mat,n,m);
  generarV(mat,n,m,V,k);
  mostrarVector(V,k);
  readln();
end.

