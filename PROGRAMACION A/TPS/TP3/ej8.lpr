program ej8;
Var
 Arch: text;
 A, Sum, Cont : integer;
Begin
 Assign( Arch, 'ej8.TXT' );
 Reset ( Arch );
 Sum:=0;
 Cont := 0;
 While NOT eof ( Arch ) do
   Begin
     Readln( Arch, A );
     If A > 0 then
       begin
         Sum := Sum + A ; Cont := Cont + 1;
       End;
   End;
 Close ( Arch );
 If Cont <> 0 then
   Writeln( Sum / Cont:0:2 )
 Else
   Writeln ('no hay numeros positivos');
 readln;
End.

{la salida es 6.20 y el programa lee desde una archivo numeros enteros
y luego calcula el promedio de los numeros positivos sobre estos mismos,
en caso de no haber positivos en el archivo se informa.

