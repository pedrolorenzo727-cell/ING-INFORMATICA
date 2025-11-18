program Ej16;


(*METODO STRING
uses sysutils;

function esCapicua(n : Integer):Boolean;
var
    s, sInv : string;
    i : byte;
begin
    s := intToStr(n);
    sInv := '';
    for i := Length(s) downto 1 do
      sInv := sInv + s[i];

    if s = sInv then
        esCapicua := True
    else
        esCapicua := false;
end;

*)


(*METODO NUMERICO*)
function esCapicua(n:integer):Boolean;
var
    nInv, resto, nOriginal : integer;
begin (*5543*)
    nInv := 0;
    nOriginal := n;
    while n <> 0 do
    begin
        resto := n mod 10; (*Obtengo primer digito*)
        nInv := nInv*10 + resto; (*Ej : 345 lo que hago es que quede 3450 + digito (Ej 5) y ahi queda 3455*)
        n := n div 10; (*Achico el numero, Ej : 5543, usando lo anterior queda ahora 5 div 10 y da 0*)
    end;

    esCapicua := nInv = nOriginal;
end;


var
    n : integer;
begin
    writeln('Ingrese un numero');
    readln(n);
    if esCapicua (n) then
        writeln('El numero ', n, ' es capicua')
    else
        writeln('El numero ', n, ' no es capicua');
    readln();
end.

