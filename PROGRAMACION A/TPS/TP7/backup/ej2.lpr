program ej2;
Const
  MaxTabl=8;

Type
  St10=string[10];
  TregPieza=record
    Color:byte;
    Tipo:Char;
  end;

  TMTabl= array[1..MaxTabl,1..MaxTabl] of TregPieza;

Procedure IniciaTablero(Var Tablero:TMTabl);
Var
  i,j:byte;
Begin
  For i:=1 to MaxTabl do
    For j:=1 to MaxTabl do
      Begin
        Tablero[i,j].Color:=0;
        Tablero[i,j].Tipo:='Z';
      end;
end;

Procedure CargaPiezas(Var Tablero:TMTabl; Var iT,jT:byte);
Var
  i,j:byte; Car:char;
  Arch:text;
Begin
  Assign(Arch,'ej2.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      read(Arch,i,j,Car);
      readln(Arch,Tablero[i,j].Tipo,Tablero[i,j].Color);
      If (Tablero[i,j].Tipo='T') and (Tablero[i,j].Color=2) then
        Begin
          iT:=i; jT:=j;
        end;
    end;
  Close(Arch);
end;

Procedure MuestraMatriz(Tablero:TMTabl);
Var
  i,j:byte;
Begin
  For i:=1 to MaxTabl do
    Begin
      For j:=1 to MaxTabl do
        write(Tablero[i,j].Color,Tablero[i,j].Tipo,' ');
      writeln;
    end;
end;

Function DevuelvePieza(Tablero:TMTabl; i,j:byte):St10;
Begin
  Case Tablero[i,j].Tipo of
    'R':  DevuelvePieza:='Rey';
    'Q':  DevuelvePieza:='Reina';
    'A':  DevuelvePieza:='Alfil';
    'T':  DevuelvePieza:='Torre';
    'C':  DevuelvePieza:='Caballo';
    'P':  DevuelvePieza:='Peon';
  end;
end;

Procedure AmenazaDefiendeArriba(Tablero:TMTabl; iT,jT:byte);
Var
  i:byte;
  P:st10;
Begin
  i:=iT+1;
  while(i<MaxTabl) and ((Tablero[i,jT].Color=0) or (Tablero[i,jT].Tipo='Z')) do
    i:=i+1;

  If (Tablero[i,jT].Color<>0) or (Tablero[i,jT].Tipo<>'Z') then
    Begin
      P:=DevuelvePieza(Tablero,i,jT);
      If Tablero[i,jT].Color=1 then
        writeln('Ataca al ',P,' blanco')
      else
        writeln('Defiende al ',P,' negro');
    end
  else
    writeln('Arriba de la torre negra no hay ninguna pieza');
end;

Procedure AmenazaDefiendeAbajo(Tablero:TMTabl; iT,jT:byte);
Var
  i:byte;
  P:St10;
Begin
  i:=iT-1;
  while(i>1) and ((Tablero[i,jT].Color=0) or (Tablero[i,jT].Tipo='Z')) do
    i:=i-1;

  If (Tablero[i,jT].Color<>0) or (Tablero[i,jT].Tipo<>'Z') then
    Begin
      P:=DevuelvePieza(Tablero,i,jT);
      If Tablero[i,jT].Color=1 then
        writeln('Ataca al ',P,' blanco')
      else
        writeln('Defiende al ',P,' negro');
    end
  else
    writeln('Abajo de la torre negra no hay ninguna pieza');
end;

Procedure AmenazaDefiendeDer(Tablero:TMTabl; iT,jT:byte);
Var
  j:byte;
  P:St10;
Begin
  j:=jT+1;
  while(j<MaxTabl) and ((Tablero[iT,j].Color=0) or (Tablero[iT,j].Tipo='Z')) do
    j:=j+1;

  If (Tablero[iT,j].Color<>0) or (Tablero[iT,j].Tipo<>'Z') then
    Begin
      P:=DevuelvePieza(Tablero,iT,j);
      If Tablero[iT,j].Color=1 then
        writeln('Ataca al ',P,' blanco')
      else
        writeln('Defiende al ',P,' negro');
    end
  else
    writeln('A la derecha de la torre negra no hay ninguna pieza');
end;

Procedure AmenazaDefiendeIzq(Tablero:TMTabl; iT,jT:byte);
Var
  j:byte;
  P:St10;
Begin
  j:=jT-1;
  while(j>1) and ((Tablero[iT,j].Color=0) or (Tablero[iT,j].Tipo='Z')) do
    j:=j-1;

  If (Tablero[iT,j].Color<>0) or (Tablero[iT,j].Tipo<>'Z') then
    Begin
      P:=DevuelvePieza(Tablero,iT,j);
      If Tablero[iT,j].Color=1 then
        writeln('Ataca al ',P,' blanco')
      else
        writeln('Defiende al ',P,' negro');
    end
  else
    writeln('A la izquierda de la torre negra no hay ninguna pieza');
end;

Var
  Tablero:TMTabl;
  iT,jT:byte;
begin
  IniciaTablero(Tablero);
  CargaPiezas(Tablero, iT, jT);
  MuestraMatriz(Tablero);
  AmenazaDefiendeArriba(Tablero, iT, jT);
  AmenazaDefiendeAbajo(Tablero, iT, jT);
  AmenazaDefiendeDer(Tablero, iT, jT);
  AmenazaDefiendeIzq(Tablero, iT, jT);
  readln;
end.

