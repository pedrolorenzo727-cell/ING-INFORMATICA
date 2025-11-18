program ej4;
Type
  St10=string[10];

Function CadInver3(Cad:st10; n:byte):st10;
Begin
  If n>0 then
    CadInver3:=Cad[n] + CadInver3(Cad,n-1)
  else
    CadInver3:='';
end;

Procedure CadInver2(Cad:st10; Var Aux:st10; n:byte);
Begin
  If n>0 then
    Begin
      If n=length(Cad) then
        Aux:=Cad[n]
      else
        Aux:=Aux+Cad[n];
      CadInver2(Cad,Aux,n-1);
    end;
end;

Procedure CadInver(Cad:st10; Var Aux:st10; n:byte);
Begin
  If n>0 then
    Begin
      Aux:=Aux+Cad[n];
      CadInver(Cad,Aux,n-1);
    end;
end;

Var
  Aux,Cad:st10;
  n:byte;
begin
  writeln('Ingrese una cadena (Max10carac)');
  readln(Cad);
  n:=length(Cad);
  Aux:='';
  CadInver(Cad,Aux,n);
  CadInver2(Cad,Aux,n);
  writeln('La cadena invertida es: ',Aux);
  writeln('La cadena invertida es: ',CadInver3(Cad,n));

  readln;
end.

