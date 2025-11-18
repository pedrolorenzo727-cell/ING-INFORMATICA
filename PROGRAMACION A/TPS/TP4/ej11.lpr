program ej11;
Function IncisoA(a,b:real):real;
Begin
  IncisoA:=(-b)/2*a;

end;

Function IncisoB(a:real):boolean;
Begin
  IncisoB:=a>0;
end;

Procedure IncisoC(a,b,c:real; Var X1,X2:real);
Var
  Raiz,Raiz2,D:real;
Begin
  D:=sqr(B)-4*A*C; //podria ser funcion
  If D<0 then
    writeln('No existen raices reales')
  else
    Begin
      Raiz:=(-B+sqrt(D)/2*A);
      If D=0 then
        writeln('Posee 2 raices reales iguales, X1=X2=',Raiz:0:2)
      else
        Begin
          Raiz2:=(-B-sqrt(D)/2*A);
          writeln('Posee 2 raices reales distintas, X1=',Raiz:0:2,' X2=',Raiz2:0:2);
        end;
    end;
end;

Function Imagen(a,b,c,X:real):real;
Begin
 Imagen:=a*sqr(X)+b*X+c;
end;

Procedure IncisoD(a,b,c:real; Var X:real);
Var
  i,N:byte;
Begin
 writeln('Ingrese la cantidad de valores que quiere averiguar su imagen');
 readln(N);
  For i:=1 to N do
    Begin
      writeln('Ingrese un valor de X');
      readln(X);
      writeln('Su imagen es y=',Imagen(a,b,c,X):0:2);
    end;
end;

Procedure MenuIterativo(a,b,c:real);
Var
  Op:char;
  X1,X2,X:real;
Begin
 writeln('Ingrese la opcion segun lo que desea averiguar(F para finalizar)');
 writeln('A) Eje de simetria  B)Hacia donde es abierta la parabola  C) Raices  D)Encontrar imagenes');
  repeat
    readln(Op);
    Case Op of
      'A': writeln('El eje de simetria es X=',IncisoA(a,b):0:2);
      'B': If IncisoB(a) then
             writeln('La parabola es abierta hacia arriba')
           else
             writeln('La parabola es abierta hacia abajo');
      'C': IncisoC(a,b,c,X1,X2);
      'D': IncisoD(a,b,c,X);
    end;
  until op='F'
end;

Var
  a,b,c:real;
begin
  writeln('Ingrese los terminos a,b,c de la parabola');
  readln(a,b,c);
  MenuIterativo(a,b,c);
  readln;
end.

