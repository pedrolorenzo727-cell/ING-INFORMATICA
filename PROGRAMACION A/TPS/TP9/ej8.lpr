program ej8;
Type
  St4=string[4];
  St20=string[20];
  TregSTK=record
    CodArt:St4;
    Talle:char;
    Color:byte;
    CantPren:word;
    Precio:Real;
  end;
  TregCOMP=record
    CodArt:st4;
    Talle:char;
    Color:byte;
    CantPren:word;
  end;

  TarSTK= file of TregSTK;
  TarCOMP= file of TregCOMP;

Procedure CargaStock(Var AStock:TarSTK);
Var
  R:TregSTK;  Car:char;
  ArchE:text;
Begin
  rewrite(AStock); Assign(ArchE,'ej4Stock.txt'); reset(ArchE);
  while not eof(ArchE) do
    Begin
      readln(ArchE,R.CodArt,Car,R.Talle,R.Color,R.CantPren,R.Precio);
      write(AStock,R);
    end;
  Close(ArchE); Close(AStock);
end;

Procedure CargaCompras(Var ArComp:TarCOMP);
Var
  R:TregCOMP;
  Arch:text; car:char;
Begin
  assign(Arch,'ej8Pedidios.txt'); reset(Arch); rewrite(ArComp);
  while not eof(Arch) do
    Begin
      readln(Arch,R.CodArt,Car,R.Talle,R.Color,R.CantPren);
      write(ArComp,R);
    end;
  Close(Arch); Close(ArComp);
end;

Procedure MuestraArch(Var Temp:TarSTK);
Var
  R:TregSTK;
Begin
  reset(Temp); read(Temp,R);
  while not eof(Temp) do
    Begin
     writeln(R.CodArt,R.Talle:3,R.Color:3,R.CantPren:3,R.Precio:10:2);
     read(Temp,R);
    end;
  writeln(R.CodArt,R.Talle:3,R.Color:3,R.CantPren:3,R.Precio:10:2);
  Close(Temp);
end;

Function Compara(RS:TregSTK; RC:TregCOMP):byte;
Var
  Res:byte;
Begin
  If RS.CodArt=RC.CodArt then
    Begin
      If RS.Talle=RC.Talle then
        Begin
          If RS.Color=RC.Color then
            Res:=0
          else
            Begin
              If RS.Color<RC.Color then
                Res:=1
              else
                Res:=2
            end;
        end
      else
        Begin
          If RS.Talle<RC.Talle then
            Res:=1
          else
            Res:=2
        end;
    End
  else
    Begin
      If RS.CodArt<RC.CodArt then
        Res:=1
      else
        Res:=2;
    end;
  Compara:=Res;
end;

Procedure ActualizaEInforma(Var ArComp:TarCOMP; Var ArStock:TarSTK; Nombre:St20);
Var
  Temp:TarSTK;
  RS:TregSTK; RC:TregCOMP;
  Res:byte;
Begin
  Assign(Temp,'TEMPSTK.DAT'); rewrite(Temp); reset(ArComp); Reset(ArStock);
  read(ArStock,RS); read(ArComp,RC);
  writeln('Articulo  Talle  Color  Cantidad');
  while not eof(ArComp) or not eof(ArStock) do
    Begin
      Res:=Compara(RS,RC);
      Case Res of
        0:  Begin
            writeln(RS.CodArt,RS.Talle:9,RS.Color:7,RS.CantPren:9);
              If RS.CantPren-RC.CantPren>0 then
                Begin
                  RS.CantPren:=RS.CantPren-RC.CantPren;
                  write(Temp,RS);
                end
              else
                If RS.CantPren-RC.CantPren<0 then
                  Begin
                    writeln(RC.CodArt,RC.Talle:9,RC.Color:7,RC.CantPren:9);
                    writeln('No se puede entregar la totalidad de los articulos, se adeudan ',Abs(RS.CantPren-RC.CantPren),' prendas');
                  end;
                  //el else no tiene sentencias es el caso que queda stock cero, entonces no se escribe en el temporal
              read(ArStock,RS); read(ArComp,RC);
            end;
        1:  Begin
              write(Temp,RS);
              read(ArStock,RS);
            end;
        2: Begin
             writeln(RS.CodArt,RS.Talle:9,RS.Color:7,RS.CantPren:9);
             writeln(RC.CodArt,RC.Talle:9,RC.Color:7,RC.CantPren:9);
             writeln('No se encuentra en stock lo solicitado, se adeudan ',RC.CantPren,' Prendas');
             read(ArComp,RC);
           end;
      end;
    end;
  write(Temp,RS);
  Close(ArStock); Close(ArComp);  Close(Temp);
  MuestraArch(Temp);
  erase(ArStock); rename(Temp,Nombre);
end;

Var
  ArStock:TarSTK; ArComp:TarCOMP;

begin
  Assign(ArStock,'STOCKCAMPERAS.DAT'); Assign(ArComp,'COMPRASCAMPERAS.DAT');
  CargaStock(ArStock); CargaCompras(ArComp);
  ActualizaEInforma(ArComp,ArStock,'STOCKCAMPERAS.DAT');
  readln;
end.

