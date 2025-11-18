program ej9;

procedure suma (n1, d1, n2, d2 : integer; var sumN3, sumD3 : integer);
begin
  if d2 = d1 then
  begin
     sumD3 := d1;
     sumN3 := n1 + n2;
  end
  else
    begin
         sumD3 := n1*n2;
         sumD3 := n1*d2 + n2*d1;
    end;
end;

procedure producto (n1, d1, n2, d2 : integer; var prodN3, prodD3 : integer);
begin
  prodN3 := n1*n2;
  prodD3 := d1*d2;
end;

procedure mostrarOperacion (n3, d3 : integer);
begin
  writeln(n3, '/', d3);
end;

procedure menu (var op : char);
begin
     repeat
           writeln('Ingrese una opcion');
           writeln('S : Suma');
           writeln('P : Producto');
           writeln('F : Finalizar');
           writeln('Opcion: ');
           readln(op);
           op := upcase(op);
     until (op = 'S') or (op = 'P') or (op = 'F');
end;

var
  archE : text;
  n1, d1, n2, d2, n3, d3 : integer;
  op : char;

begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n1,d1,n2,d2);
  menu(op);
  while op <> 'F' do
  begin
        if op = 'S' then
        begin
           suma(n1,d1,n2,d2, n3, d3);
           write('Suma: ');
        end
        else
        begin
            producto(n1,d1,n2,d2,n3,d3);
            write('Producto: ');
        end;
        mostrarOperacion(n3,d3);
        menu(op);
  end;
  close(archE);
  readln();
end.

