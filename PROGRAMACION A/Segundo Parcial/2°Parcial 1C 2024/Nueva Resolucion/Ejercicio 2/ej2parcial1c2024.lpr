program ej2parcial1c2024;
const
  maxELem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;
  Treg = record
    i, j : byte;
  end;
  TV = array[1..maxElem] of TReg;

procedure leerMatriz (var mat : TM; var n, m : byte);
var
  archE : text;
  i, j : byte;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE,n,m);
  for i := 1 to n do
  begin
      for j := 1 to m do
          read(archE, mat[i,j]);
      readln(archE);
  end;
  close(archE);
end;

function sum (mat : TM; i, j : byte):integer;
begin
  if j = 1 then
     sum := mat[i,j]
  else
    sum := mat[i,j] + sum(mat, i, j - 1);
end;

procedure min (mat : TM; i, j : byte; var posMin : TReg);
begin
  if j = 1 then
  begin
    posMin.i := i;
    posMin.j := j;
  end
  else
  begin
      min(mat, i, j - 1, posMin);
      if mat[i,j] < mat[posMin.i,posMin.j] then
      begin
        posMin.i := i;
        posMin.j := j;
      end;
  end;
end;

procedure generarV (var V : TV; var k : byte; mat : TM; n, m : byte);
var
  posMin : TReg;
begin
  if n > 0 then
  begin
    generarV(V,k,mat,n - 1,m);
    if sum(mat,n,m) > 0 then
    begin
      k := k + 1;
      min(mat,n,n,posMin);
      V[k] := posMin;
    end;
  end
  else
      k := 0;
end;

procedure mostrarMatriz (mat : TM; i, j , m : byte);
begin
  if i > 0 then
     if j > 0 then
     begin
       mostrarMatriz(mat,i, j - 1, m);
       write(mat[i,j]:4);
     end
     else
     begin
         mostrarMatriz(mat, i - 1, m, m);
         writeln();
     end;
end;

procedure mostrarVector (V : TV; n : byte);
begin
  if n > 0 then
  begin
    mostrarVector(V,n - 1);
    writeln(V[n].i, ' ', V[n].j);
  end;
end;

var
  mat : TM;
  V : TV;
  n, m, k : byte;

begin
  leerMatriz(mat,n,m);
  mostrarMatriz(mat,n,m,m);
  writeln();
  generarV(V,k,mat,n,m);
  mostrarVector(V,k);
  readln();
end.
                                                                                                                                   x
