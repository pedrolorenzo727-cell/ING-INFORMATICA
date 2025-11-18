program ej5;
CONST
  Terreno=300;
  Baldoza=0.0625;

VAR
  N,M:byte;

begin
  writeln('Ingrese la superficie a embaldozar N x M (Siendo el total 10x30)');
  readln(N,M);
  writeln('La superficie a embaldozar representa un ',N*M/Terreno*100:4:1,'% del terreno');
  writeln('Si cada baldoza es de 0.25x0.25 se deben comprar ',N*M/Baldoza:1:0,' baldozas');
  readln;
end.

