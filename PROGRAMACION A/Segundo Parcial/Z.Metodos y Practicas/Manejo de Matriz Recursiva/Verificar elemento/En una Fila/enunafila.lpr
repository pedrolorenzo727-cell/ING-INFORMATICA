program enunafila;
const
  maxElem = 100;

type
  TM = array[1..maxElem, 1..maxElem] of integer;

procedure leerMatriz (var mat : TM; var n, m : byte);
var
   archE : text;
   i, j : byte;
begin
     assign(archE, 'Entrada.txt');
     reset(archE);
     readln(archE, n, m);
     for i := 1 to n do
     begin
         for j := 1 to m do
             read(archE, mat[i,j]);
         readln(archE);
     end;
     close(archE);
end;

function estaFila (mat : TM;  i, j, m : byte; x : integer):boolean;
begin
     if i = 0 then
        estaFila := true
     else
         if mat[i,j] = x then
            estaFila := estaFila(mat, i - 1, m, m, x)
         else
             if j > 1 then
                estaFila := estaFila(mat, i, j - 1, m, x)
             else
                 estaFila := false;
end;

procedure mostrarMatriz (mat : TM; i, j, m : byte);
begin
     if i > 0 then
        if j > 0 then
        begin
             mostrarMatriz(mat, i , j - 1, m);
             write(mat[i,j]:4);
        end
        else
            begin
                 mostrarMatriz(mat, i - 1, m, m);
                 writeln();
            end
end;

var
   mat : TM;
   n, m : byte;
   x : integer;

begin
     leerMatriz(mat,n,m);
     readln(x);
     writeln(estaFila(mat,n,m,m,x));
     mostrarMatriz(mat,n,m,m);
     readln();
end.

