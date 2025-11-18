program ej12;
const
  maxElem = 100;

type
  TV1 = array[1..maxElem] of string;
  TV2 = array[1..maxElem] of real;
  TV3 = array[1..maxElem] of char;

procedure leerVectores (var VClave : TV1; var VProm : TV2; var VCar : TV3; var n : byte);
var
  archE : text;
  car, car1 : char;
  num : word;
  prom : real;
  contCar, i : byte;
  pal : string;
begin
     assign(archE, 'Entrada.txt');
     reset(archE);
     while not eof(archE) do
     begin
       contCar := 0;
       prom := 0;
       pal := '';
       read(archE, car);
       while car <> ' ' do
       begin
            if not((car in ['A'..'Z']) or (car in ['a'..'z']) or (car in ['0'..'9'])) then
               contCar := contCar + 1
            else
                pal := pal + car;
            car1 := car;
            read(archE, car);
       end;
       car1 := upcase(car1);

       if contCar <= 3 then
       begin
          for i := 1 to 3 do
          begin
            read(archE, num);
            prom := prom + num;
          end;
          prom := prom/3;

          read(archE, car);
          while car = ' ' do
                read(archE, car);

          if (upcase(car) <> upcase(car1)) and (contCar <= 3) then
          begin
               n := n + 1;
               VClave[n] := pal;
               VProm[n] := prom;
               VCar[n] := car;
          end;
       end;
       readln(archE);
     end;
     close(archE);
end;

procedure mostrarVectores (VClave : TV1; VProm : TV2; VCar : TV3; n : byte);
var
  i : byte;
begin
       for i := 1 to n do
           writeln(VClave[i], ' ', VProm[i]:10:2, VCar[i]:10);
end;

function claveMax (VClave : TV1; VProm : TV2; VCar : TV3; n : byte; letra : char):string;
var
   i, posMax : byte;
begin
     posMax := 1;
     for i := 2 to n do
         if upcase(Vcar[i]) = letra then
            if VProm[posMax] < VProm[i] then
               posMax := i;
     claveMax := VClave[posMax];
end;

function buscPosClave (VClave : TV1; n : byte; clave : string):byte;
var
   i : byte;
begin
     i := 1;
     while (i <= n) and (VClave[i] <> clave) do
           i := i + 1;
     if i <= n then
        buscPosClave := i
     else
         buscPosClave := 0;
end;

var
  VClave : TV1;
  VProm : TV2;
  VCar : TV3;
  n, pos : byte;
  letra : char;
  clave : string;
begin
  leerVectores(VClave,VProm,VCar, n);
  mostrarVectores(VClave,VProm, VCar, n);
  writeln();
  writeln('Ingrese una letra');
  readln(letra);
  letra := upcase(letra);
  writeln('Clave de maximo promedio para la letra ', letra, ' ', claveMax(VClave, VProm, VCar, n, letra));
  writeln('Ingrese una clave');
  readln(clave);
  pos := buscPosClave(VClave,n,clave);
  if pos = 0 then
     writeln('No se encontro la clave')
  else
      begin
         writeln('Promedio: ', VProm[pos]:4:2);
         writeln('Caracter: ', VCar[pos]);
      end;
  readln();
end.

