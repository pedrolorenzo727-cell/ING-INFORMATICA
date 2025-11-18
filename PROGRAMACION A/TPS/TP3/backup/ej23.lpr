program ej23;
Var
  Contra,NoValidaMasLarga:string[30];
  ContNoValidas,ContContra,MaxNoValida,ContDigitos:byte;
  LMayus,LMinus,CaracErroneo:boolean;
  ArchE,ArchS: text;
  Car:char;

begin
  Assign(ArchE,'ej23E.TXT'); reset(ArchE);
  Assign(ArchS,'ej23S.txt'); rewrite(ArchS);
  NoValidaMasLarga:='';
  ContNoValidas:=0;
  ContContra:=0;
  MaxNoValida:=0;

  while not eof(ArchE) do
    Begin
      repeat
        read(ArchE,Car);
      until eof(ArchE) or (Car<>' ') ;
      ContContra:=ContContra+1;
      Contra:='';
      CaracErroneo:=False;
      LMinus:=False;
      LMayus:=False;
      ContDigitos:=0;
      while (not eof(ArchE)) and (Car<>' ') do
        Begin
          If (Car in ['A'..'Z']) or (Car in['a'..'z']) then   //Controla si es caracter y en tal caso analiza si es mayus o minus
            If UpCase(Car)=Car then
              LMayus:=True
            else
              LMinus:=true
          else
            If (Car in['0'..'9']) then
              ContDigitos:=ContDigitos+1
            else
              CaracErroneo:=True;

          Contra:=Contra+Car;
          read(ArchE,Car);
        end;

        If (not CaracErroneo) and (Length(Contra)>=8) and LMayus and LMinus and (ContDigitos=4) then
          write(ArchS,Contra,' ')
        else
          Begin
            ContNoValidas:=ContNoValidas+1;
            If length(Contra)>MaxNoValida then
              Begin
                MaxNoValida:= length(Contra);
                NovalidaMasLarga:=Contra;
              end;
          end;
    end;
  writeln('El porcentaje de contraseñas invalidas es ',ContNoValidas/ContContra*100:0:2,'%');
  If NoValidaMasLarga='0' then
    writeln('No hubo contraseñas invalidas')
  else
    writeln('La contraseña invalida mas larga fue ',NoValidaMasLarga,' con ',length(NoValidaMasLarga),' caracteres');

  readln;
  Close(ArchE);
  Close(ArchS);
end.

