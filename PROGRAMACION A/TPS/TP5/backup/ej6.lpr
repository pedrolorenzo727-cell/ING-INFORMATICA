program ej6;
Const
  MAXVEC=100;
Type
  St15= string[15];
  TVSt15= array[1..MAXVEC] of St15;
  TVB= array['A'..'Z'] of byte;

Procedure LeeFrase(Var VecFrase:TVSt15; Var N:byte);
Var
  Arch:text;
  Car:char;

Begin
  Assign(Arch,'ej6.txt'); reset(Arch);
  N:=0;
  while not eof(Arch) do
    Begin
      read(Arch,Car);
      If (Car<>'.') and (Car<>' ') and (Car<>',') then //es palabra nueva
        Begin
           N:=N+1;
           VecFrase[N]:='';
           while (Car<>'.') and (Car<>' ') and (Car<>',') do
             Begin
               VecFrase[N]:=VecFrase[N]+Car;
               read(Arch,Car);
             end;
        end;
    end;
  Close(Arch);
end;

Function LongitudMasLarga(VecFrase:TVSt15; N:byte):byte;
Var
  Max,i:byte;
Begin
  Max:=Length(VecFrase[1]);
  For i:=2 to N do
    If Length(VecFrase[i])>Max then
      Max:=Length(VecFrase[i]);

  LongitudMasLarga:=Max;
end;

Function ApareceAntes(VecFrase:TVSt15;N:byte):St15;
Var
  i:byte;
  Min:St15;
begin
  Min:=VecFrase[1];
  For i:=2 to N do
    If VecFrase[i]<Min then
      Min:=VecFrase[i];
  ApareceAntes:=Min;
end;

Procedure InicializaVector(Var VecFrecu:TVB);
Var
  i:char;
Begin
  For i:='A' to 'Z' do
    VecFrecu[i]:=0;
end;

Procedure FrecuenciaDeLasLetras(VecFrase:TVSt15; N:byte; Var VecFrecu:TVB);
Var
  i,j:byte;
Begin
  For i:=1 to N do
    For j:=1 to Length(VecFrase[i]) do
      VecFrecu[Upcase(VecFrase[i][j])]:= VecFrecu[Upcase(VecFrase[i][j])] + 1;
end;

Procedure MuestraVecFrecu(VecFrecu:TVB);
Var
  i:char;
Begin
  For i:='A' to 'Z' do
    If VecFrecu[i]<>0 then
      writeln(i,' ',VecFrecu[i]);
end;

Procedure Menu(Var Op:char);
Begin
  writeln('Menu de opciones');
  writeln('A - El numero de palabras que contiene');
  writeln('B - La longitud de la palabra mas larga');
  writeln('C - De todas las palabras la que aparece antesen el diccionario');
  writeln('D - La frecuencia de cada letra en la frase');
  writeln('F - Finalizar');
  writeln('Ingrese una opcion para calcular sobre la frase leida');
  readln(op);
end;

Var
VecFrase:TVSt15;
VecFrecu:TVB;
N:byte;    op:char;
Begin
  LeeFrase(VecFrase,N);
  repeat
    Menu(op);
    Case op of
      'A': writeln('La frase contiene ',N,' palabras');
      'B': writeln('La longitud de la palabra mas larga es ',LongitudMasLarga(VecFrase,N));
      'C': writeln('La que aparece antes en el diccionario es ',ApareceAntes(VecFrase,N));
      'D': Begin
             writeln('La frecuencia para cada letra que aparece en la frase es la siguiente: ');
             InicializaVector(VecFrecu);
             FrecuenciaDeLasLetras(VecFrase,N,VecFrecu);
             MuestraVecFrecu(VecFrecu);
           end;
  end;
  readln;
end.

