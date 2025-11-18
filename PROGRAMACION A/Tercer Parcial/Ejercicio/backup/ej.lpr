program ej;
const
  maxElem = 100;

type
  ST15 = string[15];
  ST8 = string[8];
  TRegUsu = record
    nombre : ST15;
    contrasenia : string;
  end;
  TRegLog = record
    fecha : ST8;
    nombre : ST15;
    contrasenia : ST15;
    accion :  char;
  end;

  TArchUsu = file of TRegUsu;
  TArchLog = file of TRegLog;

  TV = array[1..maxElem] of TRegUsu;

procedure leerVector (var V : TV; var n : byte; var usuarios : TArchUsu);
var
  reg : TRegUsu;
begin
  reset(usuarios);
  n := 0;
  read(usuarios, reg);
  while not eof(usuarios) do
  begin
    n := n + 1;
    V[n] := reg;
    read(usuarios, reg);
  end;
  close(usuarios);
end;

function buscCod (V : TV; pri, med, ult : byte; cod : ST15):byte;
begin
  if pri <= ult then
     if V[med].nombre = cod then
        buscCod := med
     else
       if cod > V[med].nombre then
          buscCod := buscCod(V, med + 1, (med + 1 + ult) div 2, ult, cod)
       else
         buscCod := buscCod(V, pri, (pri + med - 1) div 2, med - 1, cod)
  else
      buscCod := 0;
end;

procedure insertaOrdenado (var V : TV; i : byte; var n, pos : byte; usuario : ST15; contrasenia : string);
begin
  if i = 0 then
  begin
     V[i + 1].nombre := usuario;
     V[i + 1].contrasenia := contrasenia;
     pos := i + 1;
     n := n + 1;
  end
  else
      if V[i].nombre > usuario then
      begin
         V[i + 1] := V[i];
         insertaOrdenado(V, i - 1, n, pos, usuario, contrasenia);
      end
      else
      begin
           V[i + 1].nombre := usuario;
           V[i + 1].contrasenia := contrasenia;
           pos := i + 1;
           n := n + 1;
      end;
end;

procedure generarListado (var login : TArchLog; var rechazados : TArchUsu; V : TV; n : byte);
var
  reg : TRegLog;
  cantI, cantC, cantR, cantN, pos, max : byte;
  fechaAct, fechaMax : ST8; usuarioAct : ST15; regR : TRegUsu;
begin
  reset(login);
  rewrite(rechazados);
  cantN := 0;
  max := 0;
  read(login, reg);
  while not eof(login) do
  begin
    cantI := 0;
    cantC := 0;
    cantR := 0;
    fechaAct := reg.fecha;
    writeln('Fecha', 'Usuarios Nuevos':20, 'Inicios de Sesion':20, 'Cierre de Sesion':20);
    while fechaAct = reg.fecha do
    begin
         usuarioAct := reg.nombre;
         pos := buscCod(V,1,(1+n) div 2, n, reg.nombre);
         while (usuarioAct = reg.nombre) and (fechaAct = reg.nombre) do
         begin
              if reg.accion = 'I' then
              begin
                 if (V[pos].contrasenia = reg.contrasenia) and (pos <> 0) then
                    cantI := cantI + 1
                 else
                   begin
                      regR.nombre := reg.nombre;
                      regR.contrasenia := reg.contrasenia;
                      write(rechazados, regR);
                   end;
              end
              else
                if reg.accion = 'C' then
                   cantC := cantC + 1
                else
                  if pos = 0 then
                  begin
                     cantR := cantR + 1; (*El nuevo usuario, se inserta ordenado en el vector y luego se recorre para crear el nuevo archivo*)
                     insertaOrdenado(V,n,n,pos,reg.nombre, reg.contrasenia);
                  end;
              read(login,reg);
         end;
    end;
    writeln(cantR:20, cantI:20, cantC:20);
    if cantR > max then
    begin
         max := cantR;
         fechaMax := fechaAct;
    end;
    cantN := cantN + cantR;
  end;
  close(login);
  close(rechazados);
end;

var
  usuarios, rechazados : TArchUsu;
  login : TArchLog;
  V : TV;
  n : byte;
begin
  assign(usuarios, 'Usuarios.dat');
  assign(login, 'Login.dat');
  assign(rechazados, 'Rechazados.dat');
  leerVector(V,n,usuarios);
  generarListado(login,rechazados,V,n);
  readln();
end.

