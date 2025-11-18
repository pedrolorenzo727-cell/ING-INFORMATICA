program ej7;
Const
  IVAS=0.21;
  IVAN=0.10;

Function Impuesto(Importe:real; Tipo:char):real;
Begin
  If Tipo='S' then
    Impuesto:=Importe*IVAS
  else
    Impuesto:=Importe*IVAN;
end;
Var
  Arch:text;
  Nombre,NombMinFact:string[30];
  Tipo:char;
  N,i:byte;
  AcumImporte,Importe,MinFact:real;

begin
  Assign(Arch,'ej7.txt'); reset(Arch);
  readln(Arch,N);
  MinFact:=1000000000;
  writeln('          NOMBRE              TIPO    IVA');
  while not eof(Arch) do
    Begin
      AcumImporte:=0;
      readln(Arch,Nombre);
      readln(Arch,Tipo);
      For i:=1 to N do
        Begin
          readln(Arch,Importe);
          AcumImporte:=AcumImporte+Importe
        end;
      writeln(Nombre:20,Tipo:5,Impuesto(AcumImporte,Tipo):15:2);
      If (Tipo='S') and (AcumImporte<MinFact) then
        Begin
          MinFact:=AcumImporte;
          NombMinFact:=Nombre;
        end;
    end;
    writeln('El nombre del comercio RI que menos facturo es: ',NombMinFact);
    readln;
  Close(Arch);
end.

