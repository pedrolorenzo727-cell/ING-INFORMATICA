program ej10;
const
  maxElem = 100;

type
  TV = array[1..maxElem] of integer;

procedure insertaOrdenadoRec (var V : TV; var n : byte; i : byte; x : integer);
begin
  if i > 0 then
     if V[i] > x then
     begin
       V[i + 1] := V[i];
       insertaOrdenadoRec(V, n, i - 1, x);
     end
     else
     begin
         V[i + 1] := X;
         n := n + 1;
     end
  else
      begin
           V[i + 1] := x;
           n := n + 1;
      end;
end;

procedure leerVectorA (var A : TV; var n : byte);
var
  archE : text;
  x : integer;
begin
  assign(archE, 'EntradaA.txt');
  reset(archE);
  n := 0;
  while not eof(archE) do
  begin
       read(archE, x);
       insertaOrdenadoRec(A,n,n,x)
  end;
end;

procedure leerVectorB (var B : TV; var m : byte);
var
  archE : text;
  x : integer;
begin
  assign(archE, 'EntradaB.txt');
  reset(archE);
  m := 0;
  while not eof(archE) do
  begin
       read(archE, x);
       insertaOrdenadoRec(B,m,m,x)
  end;
end;

procedure intercalarAB (A, B : TV; i, n, j, m : byte; var C : TV; var k : byte);
begin
     if i <= n then
        if j <= m then
        begin
             k := k + 1;
             if A[i] < B[j] then
             begin
                  C[k] := A[i];
                  intercalarAB(A,B, i + 1, n, j, m, C, k);
             end
             else
                 if A[i] > B[j] then
                 begin
                      C[k] := B[j];
                      intercalarAB(A,B, i, n, j + 1, m, C, k);
                 end
                    else
                        begin
                             C[k] := A[i];
                             intercalarAB(A,B,i + 1, n, j + 1, m, C, k);
                        end
        end
        else
            begin
                 k := k + 1;
                 C[k] := A[i];
                 intercalarAB(A,B, i + 1, n, j, m, C, k);
            end
     else
         if j <= m then
         begin
             k := k + 1;
             C[k] := B[j];
             intercalarAB(A,B, i, n, j + 1, m, C, k);
         end;
end;

procedure mostrarVector (V : TV; n : byte);
begin
  if n = 1 then
     write(V[n], ' ')
  else
    begin
        mostrarVector(V,n - 1);
        write(V[n], ' ');
    end;
end;

var
  A, B, C : TV;
  n , m, k : byte;

begin
  leerVectorA(A,n);
  write('A : ');
  mostrarVector(A,n);
  writeln();
  leerVectorB(B,m);
  write('B : ');
  mostrarVector(B,m);
  writeln();
  k := 0;
  intercalarAB(A,B,1,n,1,m,C,k);
  write('C : ');
  mostrarVector(C,k);
  readln();
end.

