program ej5;
Type
  TregALU=record
    Matri:word;
    NMate,NFis,NQuim:byte;
  end;

  TregINS=record
    Matri:word;
    Quim,Fis:byte;
  end;

  TarALU= file of TregALU;
  TarINS= file of TregINS;

Procedure CargaAlumnos(Var ArAlu:TarALU);
Var
  R:TregALU;
  Arch:text;
Begin
  Assign(Arch,'ej5Alumnos.txt'); reset(Arch); rewrite(ArAlu);
  while not eof(Arch) do
    Begin
      readln(Arch,R.Matri,R.NMate ,R.NFis,R.NQuim);
      write(ArAlu,R);
    end;
  Close(Arch); Close(ArAlu);
end;

Procedure CargaInscrip(Var ArInsc:TarINS);
Var
  R:TregINS;
  Arch:text;
Begin
  Assign(Arch,'ej5Inscripciones.txt'); reset(Arch); Rewrite(ArInsc);
  while not eof(Arch) do
    Begin
      readln(Arch,R.Matri,R.Quim,R.Fis);
      write(ArInsc,R);
    end;
  Close(Arch); Close(ArInsc);
end;

Procedure Listado(Var ArAlu:TarALU; Var ArInsc:TarINS);
Var
  RA:TregALU; RI:TregINS;
Begin
  reset(ArAlu); reset(ArInsc);
  read(ArAlu,RA); read(ArInsc,RI);
  writeln('Listado de matriculas');
  while not eof(ArAlu) or not eof(ArInsc) do
    If RA.Matri=RI.Matri then
      Begin
        //incorporar un OR para que no muestre las matriculas mas de una vez. Ok Listo
        If (RA.NQuim<4) and (RI.Quim=1) or (RI.Fis=1) and ((RA.NMate<4) or (RA.NFis<4))  then
            writeln(RI.Matri,' no cumple con los requisitos de equivalencia exigidos');
        Read(ArAlu,RA); Read(ArInsc,RI);
      end
    else
      If RA.Matri<RI.Matri then //Caso: se informan notas pero no inscripcion
        read(ArAlu,RA)
      else  //Caso: error, esta inscripto un alumno que no reporto notas en materias previas
        Begin
          writeln(RI.Matri,' no cumple con los requisitos de equivalencia exigidos');
          read(ArInsc,RI);       //este caso es de error de matriculacion. Bien
        end;

  Close(ArAlu); Close(ArInsc);
end;

Var
  ArAlu:TarALU; ArInsc:TarINS;

begin
  Assign(ArAlu,'ALUMNOS.DAT'); Assign(ArInsc,'INSCRIPTOS.DAT');
  CargaAlumnos(ArAlu); CargaInscrip(ArInsc);
  Listado(ArAlu,ArInsc);
  readln;
end.

