program ej1;
//function potencia (X, n : integer):real;
//begin
//  if n = 0 then
//     potencia := 1
//  else
//    if n > 0 then
//       potencia := X*potencia(X,n - 1)
//    else
//        if n < 0 then
//           potencia := 1/potencia(X,-n);
//end;

procedure potencia (X, n : integer; i : byte; var res : real);
begin
  if n >= 0 then
  begin
     if i <= n then
     begin
          res := res*x;
          potencia(X,n, i + 1, res);
     end
  end
  else
      begin
           potencia(x, -n, i, res);
           res := 1/res;
      end;
end;

var
  X, n : integer;
  i : byte;
  res : real;

begin
  readln(X, n);
  //writeln(potencia(X,n):4:2);
  res := 1;
  potencia(X,n,1,res);
  writeln(res:4:2);
  readln();
end.

