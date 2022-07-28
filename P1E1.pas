
Program Edificio;

Const 
  oficinas = 300;
  //cantidad de oficinas

Type 

  //registro de oficina
  oficina = Record
    cod: integer;
    dniProp: integer;
    valorExpensa: real;
  End;

  //vector de oficinas   
  vectorOficinas = array[1..oficinas] Of oficina;

  archivo_maestro = file Of vectorOficinas;


  //carga el registro de oficina con los datos 
Procedure cargarOficina(Var o: oficina);
Begin
  With o Do
    Begin
      writeln('Introduzca el código de identificación');
      readln(cod);
      If (cod <> -1)Then
        Begin
          writeln('Introduzca el DNI del propietario');
          readln(dniProp);
          writeln('Introduzca el valor de la expensa');
          readln(valorExpensa);
        End;
    End;
End;































//carga el vector vec con los datos de las oficinas o, mientras el vector no este completo y el codigo sea distinto de -1
Procedure cargarVector(Var vec: vectorOficinas; Var dimL: integer);

Var 
  o: oficina;
Begin
  dimL := 0;
  cargarOficina(o);
  While ((dimL < oficinas) And (o.cod <> -1)) Do
    Begin
      dimL := dimL + 1;
      vec[dimL] := o;
      cargarOficina(o);
    End;
End;

//ordena el vector vec de menor a mayor según el código de la oficina
Procedure ordenarporseleccion(Var vec: vectorOficinas; dimL: integer);

Var 
  i, j: integer;
  actual: oficina;
Begin
  For i:=2 To diml Do
    Begin
      actual := vec[i];
      j := i-1;
      While ((j>0)And (vec[j].cod>actual.cod)) Do
        Begin
          vec[j+1] := vec[j];
          j := j-1;
        End;
      vec[j+1] := actual;
    End;
End;

Procedure ordenarporinsercion (Var vec:vectorOficinas; diml:integer);

Var 
  i,j: integer;
  actual : oficina;
  menor: integer;
Begin
  For i:=1 To diml-1 Do
    Begin
      actual := vec [i];
      menor := i;
      For j:=i+1 To diml Do
        Begin
          If (vec[j].cod<vec[menor].cod) Then
            Begin
              menor := j;
            End;
        End;
      vec[i] := vec[menor];
      vec[menor] := actual;
    End;
End;

Procedure informar (vec:vectorOficinas; diml:integer);

Var 
  i: integer;
Begin
  writeln ('codigos ordenados');
  For i:=1 To dimL Do
    Begin
      writeln (vec[i].cod);
    End;
End;

Var 
  vec: vectorOficinas;
  dimL: integer;
  mae: archivo_maestro;
Begin
  diml := 8;

  assign (mae,'C:\Users\manue\Documents\FacuInfo\Taller\P1E1');
  reset(mae);
  read (mae, vec);
  informar (vec,diml);
  writeln;

  //cargarVector(vec, dimL);
  //write (mae, vec);
  ordenarporinsercion(vec, dimL);
  informar (vec,diml);
  close (mae);
End.
