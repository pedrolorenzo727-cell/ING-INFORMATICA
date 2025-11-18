program ej8;
Const
  DtoO=0.05;
  DtoC=0.10;
  DtoS=0.15;

Function Descuento(TipoCompra:char;Dia:byte;Monto:real):real;
Var
  Desc:real;
Begin
  Desc:=0;
  Case TipoCompra of
    'C': if Dia>15 then
         Desc:=Monto*DtoC;
    'S': if Dia<15 then
         Desc:=Monto*DtoS;
    'O': if ((Dia=10) or (Dia=20) or (Dia=30)) and (Monto>300) then
         Desc:=Monto*DtoO
  end;
  Descuento:=Desc;
end;

Var
  Arch:text;
  Codigo:string[3];
  Tipo:char;
  i,N,Dia,ContDto3R:byte;
  Monto,MontoTotal,TotAhorro,Desc:real;
  DtoOtros,DtoCombus,DtoSuper:boolean;

begin
  Assign(Arch,'ej8.TXT'); reset(Arch);
  ContDto3R:=0;
  readln(Arch,N);
  For i:=1 to N do
    Begin
      MontoTotal:=0;
      TotAhorro:=0;
      DtoOtros:=False;
      DtoCombus:=False;
      DtoSuper:=False;
      readln(Arch,Codigo);
      read(Arch,Tipo);
      while Tipo<>'F' do
        Begin
          readln(Arch,Dia,Monto);
          Desc:=Descuento(Tipo,Dia,Monto);
          If Desc<>0 then
            Begin
              Case Tipo Of
                'C': DtoCombus:=true;
                'S': DtoSuper:=true;
                'O': DtoOtros:=true;
              end;
              TotAhorro:=TotAhorro+Desc;
            end
          else
            MontoTotal:=MontoTotal+Monto;
          read(Arch,Tipo);
        end;
      readln(Arch);
      If (DtoCombus=true) and (DtoSuper=true) and (DtoOtros=true) then
        ContDto3R:=ContDto3R+1
      else
        If (DtoCombus=False) and (DtoSuper=false) and (DtoOtros=false) then
          writeln(Codigo,'  Total Abonado: ',MontoTotal:0:2); //Inciso a
      writeln('El cliente ahorro: ',TotAhorro:0:2);
    end;
  writeln('Obtuvieron dto en los tres rubros ',ContDto3R,' clientes');
  readln;

  Close(Arch);
end.

