program ej;
type
  ST3 = string[3];
  TVN = array[1..4] of ST3;
  TRegGru = record
    grupo : 'A'..'Z';
    paises : TVN;
    goles, empates : byte;
  end;
  TRegRes = record
    grupo : 'A'..'F';
    cod1, cod2 : ST3;
    goles1, goles2 : byte;
  end;
  TReg = record
    cod : ST3;
    puntos : byte;
  end;
  TRegPri = record
    primero, segundo : ST3;
  end;

  TV = array[1..4] of TReg;
  TArchGru = file of TRegGru;
  TArchRes = file of TRegRes;

procedure llenarVector(var V : TV; paises : TVN);
var
  i : byte;
begin
  for i := 1 to 4 do
  begin
    V[i].cod := paises[i];
    V[i].puntos := 0;
  end;
end;

function buscCod (V : TV; cod : ST3):byte;
var
  i : byte;
begin
  i := 1;
  while (i <= 4) and (V[i].cod = cod) do
        i := i + 1;
  if i <= 4 then
     buscCod := i
  else
    buscCod := 0;
end;

procedure max (V : TV; var primeros : TRegPri);
var
  i, posPri, posSeg : byte;
begin
  if V[1].puntos > V[2].puntos then
  begin
    posPri := 1;
    posSeg := 2;
  end
  else
  begin
    posPri := 2;
    posSeg := 1;
  end;
  for i := 3 to 4 do
      if V[i].puntos > V[posPri].puntos then
      begin
        posPri := i;
        posSeg := posPri
      end
      else
          if V[i].puntos > V[posSeg].puntos then
             posSeg := i;
  primeros.primero := V[posPri].cod;
  primeros.segundo := V[posSeg].cod;
end:

procedure actualizarGrupos (var grupos, gruposAct : TArchGru; var resultados : TArchRes);
var
  RG : TRegGru;
  RR : TRegRes;
  pos1, pos2 : byte;
  primeros : TRegPri;
begin
  reset(grupos);
  reset(resultados);
  rewrite(gruposAct);
  while not eof(grupos) or not eof(resultados) do
        if RG.grupo = RR.grupo then
        begin
          llenarVector(V, RG.paises);
          while RG.grupo = RR.grupo do
          begin
            RG.goles := RG.goles + RR.goles1 + RR.goles2;
            if RR.goles1 = RR.goles2 then
            begin
                 RG.empates := RG.empates + 1;
                 pos1 := buscCod(V,RR.cod1);
                 pos2 = buscCod(V,RR.cod2);
                 if RR.goles1 > RR.goles2 then
                    V[pos1].puntos := V[pos1].puntos + 3
                 else
                   if RR.goles2 > RR.goles1 then
                      V[pos2].puntos := V[pos2].puntos + 3
                   else
                     begin
                       V[pos1].puntos := V[pos1].puntos + 1;
                       V[pos2].puntos := V[pos2].puntos + 1;
                     end;
            end;
            read(resultados, RR);
          end;
          write(gruposAct,RG);
          max(V,primeros);
          writeln(RG.grupo, ' ', primeros.primero, ' ', primeros.segundo);
        end
        else
            if RG.grupo < RR.grupo then
            begin
              write(gruposAct, RG);
              read(grupos, RG);
            end
            else
                read(resultados, RR);
  close(grupos);
  close(gruposAct);
  close(resultados);
end;

begin
end.

