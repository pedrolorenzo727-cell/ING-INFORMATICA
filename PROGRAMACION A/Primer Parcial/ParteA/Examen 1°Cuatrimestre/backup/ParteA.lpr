program ParteA;
type
    ST10 = string[10];

var
    archE : text;
    i, n, d1, d2, suma, contJug, cont6 : byte;
    nombre : ST10;
    puntaje, X : word;
    sacoSeis : boolean;
begin
    assign(archE, 'Juego.txt');
    reset(archE);
    writeln('Ingrese X');
    readln(x);
    contJug := 0;
    cont6 := 0;
    readln(archE, n);
    readln(archE, nombre);
    while nombre <> 'XXX' do
    begin
        sacoSeis := false;
        puntaje := 0;
        for i := 1 to n do
        begin
            readln(archE, d1, d2);
            suma := d1 + d2;
            if d1 = d2 then
              suma := 3*suma
            else
                if (d1 = d2 + 1) or (d2 = d1 + 1) then
                    suma := 2*suma;
            if (d1 = 6) or (d2 = 6) then
                sacoSeis := true;
            puntaje := puntaje + suma;
        end;
        if puntaje < x then
        begin
            contJug := contJug + 1;
            if sacoSeis then
                cont6 := cont6 + 1;
        end;
        writeln('El jugador ', nombre, ' saco ', puntaje, ' puntos');
        readln(archE, nombre);
        writeln(contJug);
    end;
    close(archE);
    writeln(contJug);
    if contJug <> 0 then
       writeln('Porcentaje de jugadores con puntaje menor a ', x, ' que sacaron 6 : ', ((cont6*100)/contJug):4:2, '%');
    readln();
end.
