program ej7;
Var
  Color1,Color2:string[4];
  Palo1,Palo2:char;
  Num1,Num2:byte;

begin
 //Inciso A
   ((Palo1='C') or (Palo2='C')) and ((Num1=1) or (Num2=1));
 //Inciso B
   ((Color1='Rojo') or (Color2='Rojo')) and ((Num1>=10) or (Num2>=10));
 //Inciso C
   (Palo1=Palo2) and (Num1=Num2) and (Color1<>Color2);
 //Inciso D
   (Palo1=Palo2) and (Abs(Num1-Num2)=1);
 //Inciso E
   (Palo1<>Palo2) and (Color1<>Color2) and (Num1+Num2=12);
 //Inciso F
   (Num1=Num2) and ((Color1=Color2) or Palo1=Palo2));
 //Inciso G
   (Num1<>Num2) and (Palo1=Palo2) and (Color1=Color2);
 //Inciso H
     //Predomina color
    ((color1 = 'Rojo') and (color2 = 'Azul')) or
     //En caso de color y palo iguales determina el numero
    (((color1 = 'Rojo') and (color2 = 'Rojo')) and (palo1 = palo2) and (Num1 > Num2)) or
     //En caso de color igual y palo distinto determina el palo por orden de supremacia(O,C,E,B)
    (((color1 = 'Rojo') and (color2 = 'Rojo')) and
                (
                           ((palo1 = 'O') and (palo2 <> 'O')) or
                           ((palo1 = 'C') and ((palo2 <> 'O') and (palo2 <> 'C'))) or
                           ((palo1 = 'E') and ((palo2 <> 'O') and (palo2 <> 'C') and (palo2 <> 'E')))
                )

end.

