program ej8;
type
  st5 = string[5];

function descuento (tipo : char; dia : byte; monto : real):real;
begin
  descuento := 0;
  case tipo of
       'C' : if dia > 15 then
             descuento := monto*0.1;
       'S' : if dia <= 15 then
             descuento := monto*0.15;
       'O' : if (dia in [10,20,30]) and (monto > 300) then
             descuento := monto*0.05;
  end;
end;

var
  archE : text;
  i, n, dia, cont : byte;
  codigo : st5;
  tipo : char;
  monto, total, descTot, desc : real;
  descCom, descSup, descOtr : boolean;
begin
  assign(archE, 'Entrada.txt');
  reset(archE);
  readln(archE, n);
  cont := 0;
  for i := 1 to n do
  begin
      readln(archE, codigo);
      readln(archE, tipo, dia, monto);
      tipo := upcase(tipo);
      descTot := 0;
      total := 0;
      descCom := false;
      descSup := false;
      descOtr := false;
      while tipo <> 'F' do
      begin
          desc := descuento(tipo,dia,monto);
          if desc <> 0 then
          begin
            descTot := descTot + desc;
            case tipo of
                 'C' : descCom := true;
                 'S' : descSup := true;
                 'O' : descOtr := true;
            end;
          end;
          total := total + monto - desc;
          readln(archE, tipo, dia, monto);
      end;
      if descTot = 0 then
        writeln(codigo, ' no se beneficio con ningun descuento y debe pagar $ ', total:4:2)
      else
          writeln(codigo, ' ahorro $ ', descTot:4:2);
      if descCom and descSup and descOtr then
         cont := cont + 1;
  end;
  writeln('Cantidad de clientes que tuvieron descuento en los tres rubros: ', cont);
  close(archE);
  readln();
end.

