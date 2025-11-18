program ParteA;
type
    ST10 = string[10];

var
    archE : text;
    i, n, d1, d2, contJug, cont6 : byte;
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
    while not eof(archE) do
    begin
        sacoSeis := false;
        readln(archE, nombre);
        for i := 1 to n do
        begin
            readln(archE, d1, d2);
            puntaje := d1 + d2;
            if d1 = d2 then
              puntaje := 3*puntaje
            else
                if (d1 = d2 + 1) or (d2 = d1 + 1) then
                    puntaje := 2*puntaje;
            if (d1 = 6) or (d2 = 6) then
                sacoSeis := true;
        end;
        if puntaje < x then
        begin
            contJug := contJug + 1;
            if sacoSeis then
                cont6 := cont6 + 1;
        end;
        writeln('El jugador ', nombre, ' saco ', puntaje, ' puntos');
    end;
    close(archE);
    if contJug <> 0 then
       writeln('Porcentaje de jugadores con puntaje menor a ', x, ' que sacaron 6 : ', ((cont6*100)/contJug):2:2, '%');
    readln();
end.