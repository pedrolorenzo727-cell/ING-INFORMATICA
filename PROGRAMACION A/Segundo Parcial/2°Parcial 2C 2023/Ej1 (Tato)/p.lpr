program p;
const
  maxelem=20;
  dolar=360;
type
   st10=string[10];
   tm=array[1..10,1..maxelem]of real ;
   rexpo=record
       cod:byte;
       tipo:st10;
       tons:real;
   end;
   rcereal=record
        tipo:st10;
        precio:real;
   end;
   rimporte=record
        silo:byte;
        precio:real;
   end;
   tv=array[1..maxelem] of rcereal;
   tv2=array[1..maxelem]of rimporte;
procedure creavec(var vcereal:tv;var i:byte);
var
  aCereal:text;
begin
    assign(acereal,'Cereales.txt'); reset(acereal);
    i:=0;
    while not eof(acereal) do
          begin
              i:=i+1;
              with vcereal[i] do
                   readln(acereal,tipo,precio);
          end;
    close(acereal);
end;
procedure iniciamat(var mat:tm; m:byte);
var
  i,j:byte;
begin
    for i:=1 to 10 do
         begin
             for j:=1 to m do
                 mat[i,j]:=0
         end;
end;
function buscacereal(tipo:st10; vcereal:tv; m:byte):byte;
var
  i:byte;
begin
    i:=1;
    while (i<=m) and (tipo<>vcereal[i].tipo) do
          i:=i+1;
    if i<=m then
       buscacereal:=i
    else
        buscacereal:=0;
end;
procedure lectura (var mexportaciones:tm; vcereal:tv; m:byte);
var
  aExpo:text;  registro:rexpo;     col:byte; car : char;
begin
     assign(aExpo,'exportaciones.txt'); reset(aexpo);
     iniciamat(mexportaciones,m);
     while not eof(aexpo) do
           with registro do
           begin
                readln(aexpo,cod, car, tipo,tons);
                col:= buscacereal(tipo,vcereal,m);
                if col<>0 then                 //valida que el codigo exista
                   mexportaciones[cod,col]:=mexportaciones[cod,col]+tons;
           end;
     close(aexpo);
end;
function cuantossilos(c:st10;mexportaciones:tm; vcereal:tv; m:byte):byte; //a
var
  i,col,cont:byte;
begin
    col:=buscacereal(c,vcereal,m);
    if col=0 then
       cuantossilos:=0
    else
        begin
             cont:=0;
             for i:=1 to 10 do
                 if mexportaciones[i,col]<>0 then
                    cont:=cont+1;
             cuantossilos:=cont
        end;
end;

procedure generarV (mat : tm; VCereal : tv; m : byte; var supX : tv2; var k : byte; x : real);
var
  i, j : byte;
  sum, precio : real;
begin
    for i := 1 to 10 do
    begin
        sum := 0;
        precio := 0;
        for j := 1 to m do
        begin
            sum := sum + mat[i,j];
            precio := precio + mat[i,j]*VCereal[j].precio*dolar;
        end;
        if sum > x then
        begin
             k := k + 1;
             supX[k].silo:= i;
             supX[k].precio:= precio;
             if precio > 100000000 then
                supX[k].precio := supX[k].precio*1.25
             else
                 supX[k].precio := supX[k].precio*0.95;
        end;
    end;
end;

procedure muestrav(v:tv2; k:byte);
var
  i:byte;
begin
    writeln('El vector resultante queda:');
    writeln('Silo Importe en pesos');
    for i:=1 to k do
        with v[i] do
             writeln(silo,'  ',precio:15:2);
end;
var
   mexportaciones:tm; vcereal:tv; m,k,cant:byte; C:st10; Z:real; vImportes:tv2;
begin
     creavec(vcereal,m);
     lectura(mexportaciones,vcereal,m);
     //a
     writeln('Ingrese tipo de cereal a buscar'); readln(c);
     cant:= cuantossilos(c,mexportaciones,vcereal,m);
     if cant=0 then
          writeln('El tipo de cereal ingresado no se guardo en ningun silo')
     else
          writeln('El tipo de cereal ingresado se guardo en: ',cant,' silo/s');
     //b
       writeln('Ingrese cantitad minima de toneladas'); readln(Z);
       generarV(mexportaciones,vcereal,m,vimportes,k,z);
       muestrav(vimportes,k);
readln;
end.
