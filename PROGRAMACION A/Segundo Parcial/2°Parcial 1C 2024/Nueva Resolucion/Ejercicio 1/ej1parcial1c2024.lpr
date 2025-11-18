program ej1parcial1c2024;
const
  maxElem = 100;
  n = 7;

type
  ST5 = string[5];
  TVRubros = array[1..maxElem] of ST5;
  TM = array[1..maxElem, 1..maxElem] of real;
  TReg = record
    cod : ST5;
    monto : real;
  end;
  TV = array[1..maxElem] of TReg;

procedure leerVector (var rubros : TVRubros; var m : byte);
var
  archE : text;
begin
  assign(archE,'rubros.txt');
  reset(archE);
  m := 0;
  while not eof (archE) do
  begin
    m := m + 1;
    readln(archE, rubros[m]);
  end;
  close(archE);
end;

function buscCod (rubros : TVRubros; m : byte; cod : ST5):byte;
var
  i : byte;
begin
  i := 1;
  while (i <= m) and (rubros[i] <> cod) do
        i := i + 1;
  if i <= m then
     buscCod := i
  else
     buscCod := 0;
end;

procedure iniciaMatriz (var mat : TM; m : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
      for j := 1 to m do
          mat[i,j] := 0;
end;

procedure leerMatriz (var mat : TM; rubros : TVRubros; m : byte);
var
  archE : text;
  cod : ST5;
  i, pos : byte;
  monto : real;
begin
  assign(archE, 'ventas.txt');
  reset(archE);
  iniciaMatriz(mat,m);
  while not eof (archE) do
  begin
    read(archE, cod);
    pos := buscCod(rubros,m,cod);
    if pos <> 0 then
    begin
      readln(archE,i,monto);
      mat[i,pos] := mat[i,pos] + monto;
    end;
  end;
 end;
procedure mostrarMatriz (mat : TM; m : byte);
var
  i, j : byte;
begin
  for i := 1 to n do
  begin
      for j := 1 to m do
          write(mat[i,j]:10:2);
      writeln();
  end;
end;

function sumCol (mat : TM; j: byte):real;
var
  i : byte;
  prom : real;
begin
  prom := 0;
  for i := 1 to 5 do
      prom := prom + mat[i,j];
  sumCol := prom;
end;

function minimo (mat : TM; rubros : TVRubros; m : byte):ST5;
var
  j, posMin : byte;
  min, prom : real;
begin
  min := 999999;
  for j := 1 to m do
  begin
       prom := sumCol(mat,j)/n;
      if prom < min then
      begin
         min := prom;
         posMin := j;
      end;
  end;
  minimo := rubros[posMin];
end;

procedure insertaOrdenado (var supX : TV; var k : byte; cod : ST5; monto : real);
var
  i : byte;
begin
  i := k;
  while (i > 0) and (supX[i].monto > monto) do
  begin
        supX[i + 1] := supX[i];
        i := i - 1;
  end;
  supX[i + 1].cod := cod;
  supX[i + 1].monto := monto;
  k := k + 1;
end;

procedure generarSupX (var supX : TV; var k : byte; mat : TM; rubros : TVRubros; m : byte; x : real);
var
  j : byte;
  sum : real;
begin
  k := 0;
  for j := 1 to m do
  begin
      sum := mat[6,j] + mat[7,j];
      if sum > x then
         insertaOrdenado(supX,k,rubros[j],sum);
  end;
end;

procedure mostrarVector (supX : TV; k : byte);
var
  i : byte;
begin
  for i := 1 to k do
      writeln(supX[i].cod, ' ', supX[i].monto:4:2);
end;

var
  mat : TM;
  rubros : TVRubros;
  supX : TV;
  m, k : byte;
  x : real;
begin
  leerVector(rubros,m);
  leerMatriz(mat,rubros,m);
  mostrarMatriz(mat,m);
  writeln(minimo(mat,rubros,m));
  readln(x);
  generarSupX(supX,k,mat,rubros,m,x);
  mostrarVector(supX,k);
  readln();
end.

