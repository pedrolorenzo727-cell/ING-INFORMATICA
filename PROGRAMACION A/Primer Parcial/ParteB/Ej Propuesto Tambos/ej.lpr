program ejPropuestoTambos;
const
  maxElem = 10;

type
  st4 = string[4];
  TVCod = array[1..maxElem] of st4;
  TVEnt = array[1..maxElem] of byte;
  TVTot = array[1..maxElem] of real;

function buscCod (cod : TVCod; n : byte; codigo : st4):byte;
var
   i : byte;
begin
     i := 1;
     while (i <= n) and (cod[i] <> codigo) do
           i := i + 1;
     if i > n then
        buscCod := 0
     else
       buscCod := i;
end;

procedure leerVectores (var cod : TVCod; var tot : TVTot; var entregas : TVEnt; var n : byte);
var
   codigo : st4;
   dia, pos : byte;
   lit : real;
   archE : text;
begin
     assign(archE, 'Tambos.txt');
     reset(archE);
     n := 0;
     while not eof(archE) do
     begin
          readln(archE, codigo, dia, lit);
          pos := buscCod(cod,n,codigo);
          if pos <> 0 then
          begin
            tot[pos] := tot[pos] + lit;
            entregas[pos] := entregas[pos] + 1;
          end
          else
              begin
                   n := n + 1;
                   cod[n] := codigo;
                   tot[n] := lit;
                   entregas[n] := 1;
              end;
     end;
     close(archE);
end;

function masLitros (tot : TVTot; n : byte):byte;
var
   i, pos : byte;
begin
     pos := 1;
     for i := 1 to n do
         if tot[i] > tot[pos] then
            pos := i;
     masLitros := pos;
end;

function supX (tot : TVTot; entregas : TVEnt; n : byte; x : real):byte;
var
   i, cant : byte;
begin
     cant := 0;
     for i := 1 to n do
         if tot[i]/entregas[i] > x then
            cant := cant + 1;
     supX := cant;
end;

var
   cod : TVCod;
   tot : TVTot;
   entregas : TVEnt;
   n, pos : byte;
   x : real;
   codigo : st4;
begin
  leerVectores(cod,tot,entregas,n);
  writeln('Tambo que mas leche entrego: ', cod[masLitros(tot,n)]);
  writeln('Ingrese X');
  readln(x);
  writeln('Cantidad de tambos que superaron ', x:4:2, 'L: ', supX(tot,entregas,n,x));
  writeln('Ingrese codigo');
  readln(codigo);
  pos := buscCod(cod,n, codigo);
  if pos = 0 then
     writeln('No existe el codigo ingresado')
  else
    begin
      writeln(tot[pos]:4:2);
      writeln(tot[pos]/entregas[pos]:4:2);
    end;
  readln();
end.

