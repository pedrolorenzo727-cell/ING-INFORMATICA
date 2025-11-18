program ej13;

begin
 //Estructura con while
  Readln( Tipo, Precio); Tipo := Upcase(Tipo);
 {P=panadería, F=fiambrería, A=almacén}
 While (Tipo<>’P’) and (Tipo<>’F’) and (Tipo<>’A’) do
 Begin
 Readln (Tipo); Tipo := Upcase(Tipo);
 End;

 //Estructura con repeat
 repeat
   Readln( Tipo, Precio); Tipo := Upcase(Tipo);
 until (Tipo<>'P') or (Tipo<>'F') or (Tipo<>'A')  ;
end.

//Conclusion: con repeat no se repite codigo y realiza menos pasos
