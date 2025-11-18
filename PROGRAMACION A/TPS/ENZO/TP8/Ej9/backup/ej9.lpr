program ej9;

function digCre (n : word; var valor : boolean; dig : word);
begin
  if n < 10 then
  begin
    dig := n;
    digCrE := true;
  end
  else
      begin
        digCre(n div 10,valor,dig);
        if dig <= n mod 10 then
           dig := n mod 10
        else
          valor := false;
      end;
end;

var
  n, dig : word;
  valor : boolean;

begin
  readln(n);
  digCre(n,valor,dig);
  writeln(valor);
  readln();
end.

