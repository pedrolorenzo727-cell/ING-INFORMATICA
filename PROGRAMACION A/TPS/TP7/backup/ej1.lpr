program ej1;
Const
  MAXVEC=2000;
Type
  St15=string[15];

  TregF= record
    Dia,Mes:byte;
    Anio:word;
  end;

  TregEmp= record
    Nomb:St15;
    Fecha:TregF;
  end;

  TVR=array[1..MAXVEC] of TregEmp;

Procedure CalculaEstacion(VEmp:TVR; i:word; Var Inv,Ver,Oto,Pri:word);
Begin
  Case VEmp[i].Fecha.Mes of
    1,2: Ver:=Ver+1;
    4,5: Oto:=Oto+1;
    7,8: Inv:=Inv+1;
    10,11: Pri:=Pri+1;

    3:  If VEmp[i].Fecha.Dia < 21 then
          Ver:=Ver+1
        else
          Oto:=Oto+1;
    6:  If VEmp[i].Fecha.Dia < 21 then
          Oto:=Oto+1
        else
          Inv:=Inv+1;
    9:  If VEmp[i].Fecha.Dia < 21 then
          Inv:=Inv+1
        else
          Pri:=Pri+1;
    12:  If VEmp[i].Fecha.Dia < 21 then
          Pri:=Pri+1
        else
          Ver:=Ver+1;
   end;
end;

Procedure LeeDatos(Var VEmp:TVR; Var N, Inv, Ver, Oto, Pri:word);
Var
  Arch:text;
Begin
  Oto:=0;
  Ver:=0;
  Inv:=0;
  Pri:=0;
  N:=0;
  Assign(Arch,'ej1.txt'); reset(Arch);
  while not eof(Arch) do
    Begin
      N:=N+1;
     // Read(Arch,VEmp[N].Nomb);
      readln(Arch,VEmp[N].Nomb,VEmp[N].Fecha.Dia,VEmp[N].Fecha.Mes,VEmp[N].Fecha.Anio);
      CalculaEstacion(VEmp, N, Inv, Ver, Oto, Pri);
    end;
  Close(Arch);
end;

Function Maximo(Ver,Oto,Inv,Pri:word):char;
Var
  Max:word;
  Car:char;
Begin
  Max:=Ver; Car:='V';
  If Oto>Max then
    Begin
      Max:=Oto;
      Car:='O';
    end;
  If Inv>Max then
    Begin
      Max:=Inv;
      Car:='I';
    end;
  If Pri>Max then
    Car:='P';

  Maximo:=Car;
end;

Var
  VEmp:TVR;
  N,Inv,Ver,Oto,Pri:word;

Begin
  LeeDatos(VEmp, N, Inv, Ver, Oto, Pri);
  Case Maximo(Ver, Oto, Inv, Pri) of
    'V': writeln('La estacion con mas cumpleanios es verano');
    'O': writeln('La estacion con mas cumpleanios es otoño');
    'I': writeln('La estacion con mas cumpleanios es invierno');
    'P': writeln('La estacion con mas cumpleanios es primavera');
  end;
  readln;
end.

