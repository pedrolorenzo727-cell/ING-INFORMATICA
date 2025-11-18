program ej4;
Const
 LimInf = 10;
 LimSup = 255;

Var
 X,Y: real;
 N,M: integer;
 Cadena: string;
 Car: char;
 Mayus, Cumple, Ok: boolean;

begin

{Analizar si son sintáctica y semánticamente
correctas, o si son redundantes, las siguientes
sentencias}
  //a
  Mayus := upcase(car)=car; //Correcta, analiza mediante la variable mayus si el valor en la variable car está en mayuscula
  //b)
  Cumple := (X<=LimInf) and (X>=LimSup); //Semanticamente Incorrecta, un valor nunca podra ser menor a 10 y mayor a 255 simultaneamente
  //c)
  Mayus := ‘A’=car or car=’B’or TRUE;  //Semanticamente Incorrecta, siempre devuelve true
  //d)
  Cumple := length(cadena)>LimSup; //Sintacticamente incorrecto, una cadena no puede ser mayor a 255 caracteres
  //e)
  M := N / LimInf;  //Sintacticamente incorrecto, M debe ser real ya que la division genera numeros con decimales, entonces no se pueden guardar en una variable de tipo integer
  //f)
  Ok := LimInf< M <LimSup;  //Sintacticamente incorrecto, no se permiten comparaciones multiples. Forma correcta: (LimInf< M) AND (M <LimSup)
  //g)
  Ok := Odd (n * (n-1));  //Semanticamente Incorrecto, siempre devuelve falso

  {Evaluar cuál es el resultado de cada asignación si
   Cumple=True, N=20,M=1,X=5.8,Y=12.7 y car=’B’}
  //a)
  Ok := Not cumple or (N>LimInf) and(X<>Y); //TRUE
  //b)
  X := N / 3 + M*Y; // 20/3+1*12.7 = 19.366
  //c)
  Mayus := Cumple or (car=’S’) and(odd(N)); //TRUE
  //d)
  N := trunc(X)+LimInf; //15

end.

