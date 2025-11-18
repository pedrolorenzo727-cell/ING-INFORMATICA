program ej6;

uses unit1;

const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of byte;

procedure generarCuaMag (var mat : TM; n : byte);
var
  i,k, j : byte;
begin
  i := 1;
  j := n div 2 + 1;
  for k := 1 to n*n do
  begin
    mat[i,j] := k;
    if k mod n = 0 then
       i := i + 1
    else
      begin
        if i = 1 then
           i := n
        else
          i := i - 1;
        if j = n then
           j := 1
        else
          j := j + 1;
      end;
  end;
end;

function verMat (mat : TM; n : byte):boolean;
var
  i, j , k : byte;
  sum : word;
  esCua : boolean;
begin
     i := 1;
     j := n div 2 + 1;
     k := 1;
     esCua := mat[i,j] = k;
     while (k < n*n) and esCua do
     begin
          if k mod n = 0 then
             i := i + 1
          else
          begin
               if i = 1 then
                  i := n
               else
                   i := i - 1;
               if j = n then
                  j := 1
               else
                   j := j + 1;
          end;
          k := k + 1;
          esCua := mat[i,j] = k;
     end;
     verMat := esCua;
end;

procedure mostrarMatriz (mat : TM; n: byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
      for j := 1 to n do
          write(mat[i,j]:4);
      writeln();
  end;
end;

var
  mat : TM;
  n : byte;
begin
  repeat
        readln(n);
  until n mod 2 <> 0;

  generarCuaMag(mat,n);
  mat[5,4] := 10;
  mostrarMatriz(mat,n);

  if verMat(mat,n) then
     writeln('Es cuadrado magico')
  else
      writeln('No es cuadrado magico');
  readln();
end.

