program ej8;
Var
 Arch: text;
 A, Sum, Cont : integer;
Begin (*El programa devuelve el promedio de positivos*)
     Assign( Arch, 'datos.TXT' );
     Reset ( Arch );
     Sum :=0;
     Cont := 0;
     While NOT eof ( Arch ) do
     Begin
          Readln( Arch, A );
          If A > 0 then
          begin
               Sum := Sum + A ;
               Cont := Cont + 1;
          End;
     End;
     Close( Arch );
     writeln(sum, ' ',cont);
     If Cont <> 0 then
        Writeln( Sum / Cont : 4:2)
     Else
         Writeln('no hay numeros positivos');
     readln();
End.

