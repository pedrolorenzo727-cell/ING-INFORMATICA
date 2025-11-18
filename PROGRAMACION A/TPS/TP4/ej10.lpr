program ej10;

ProcedureAAA(var C : char; var N:byte; x,y:real ); //falta un espacio entre procedure y el nombre
………………….
Function BBB( M:integer; B:boolean): char;
…………………
Function CCC(Car : char; W:real):Boolean;
……………………
Procedure DDD(varN,M:integer);  //Falta espacio entre var y N
………………………
Var
Car: char;
 M, Z, W : real;
 P: byte;
 N: integer;
Begin
  Readln(Z, W);
  AAA (‘c’{si o si variable}, P, Z, W);
    If CCC( BBB( N, Z<> W), 5.4) then
      DDD(N, M)  //el parametro m no coincide en TIPO
    Else
      DDD(12.5, N-2);  //el valor 12.5 no coincidecon el tipo del parametro que espera el procedimiento y tiene que ser variable
  Write (BBB(20, P=0));
  Write (AAA(Car, P, M, Z)); //No se puede escribir un procedimiento
..........
end.

