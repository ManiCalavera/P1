
Program p2e2;

Type 



  pelicula = Record
    codigo: integer;
    genero: integer;
    puntaje: real;
  End;

  lista = ^nodo;
  nodo = Record
    dato: pelicula;
    siguiente: lista;
  End;

  vector = array [1..8] Of lista;

  archivo = file Of lista;

  puntajes = array [1..8] Of real;

Procedure cargarregistro (Var reg:pelicula);
Begin
  Randomize;
  writeln ('Ingrese el codigo');
  readln (reg.codigo);
  If (reg.codigo <> -1) Then
    Begin
      reg.genero := Random (7)+1;
      reg.puntaje := Random (10);
    End;
End;

Procedure agregardetras (Var l:lista; reg:pelicula);

Var 
  aux: lista;
Begin
  new (aux);
  aux^.dato := reg;
  aux^.siguiente := l;
  l := aux;
End;


Procedure informar (l:lista);
Begin
  While (l <> Nil) Do
    Begin
      writeln;
      writeln (l^.dato.codigo);
      writeln (l^.dato.genero);
      writeln (l^.dato.puntaje);
      l := l^.siguiente;
    End;
End;

Procedure cargarvector (Var v:vector; l:lista);

Var 
  reg: pelicula;

Begin
  cargarregistro (reg);
  While (reg.codigo <> -1) Do
    Begin

      Case reg.genero Of 
        1: agregardetras (v[1], reg);
        2: agregardetras (v[2], reg);
        3: agregardetras (v[3], reg);
        4: agregardetras (v[4], reg);
        5: agregardetras (v[5], reg);
        6: agregardetras (v[6], reg);
        7: agregardetras (v[7], reg);
        8: agregardetras (v[8], reg);
      End;
      cargarregistro (reg);
    End;

End;

Procedure informarvector( vec:vector);

Var 
  i: integer;
Begin
  For i:=1 To 8 Do
    Begin
      informar (vec[i]);
    End;
End;

Procedure crearvectorporpuntaje (vec:vector; Var p:puntajes);

Var 
  i: integer;
  max: real;
  aux: lista;
Begin

  For i:=1 To 8 Do
    Begin
      max := -1;
      aux := vec[i];
      While (aux <> Nil) Do
        Begin
          If (aux^.dato.puntaje > max) Then
            Begin
              max := aux^.dato.puntaje;
            End;
          aux := aux^.siguiente;
        End;
      p[i] := max;
    End;
End;

Procedure informarvectorpuntajes (v:puntajes);

Var 
  i: integer;
Begin
  writeln;
  writeln ('Se infroma el vector de puntajes');
  For i:=1 To 8 Do
    Begin
      writeln;
      writeln ('En la posicion ', i, ': ');
      writeln (v[i]);
    End;
End;

Procedure ordenarpuntajes (Var vec:puntajes);

Var 
  i,j: integer;
  actual: real;
Begin
  For i:=2 To 8 Do
    Begin
      actual := vec[i];
      j := i-1;
      While (j>0) And (vec[j]>actual) Do
        Begin
          vec[j+1] := vec[j];
          j := j-1;
        End;
      vec[j+1] := actual;
    End;
End;



Var 
  mae: archivo;
  vec: vector;
  vec2: puntajes;
  aux,ult: lista;

Begin
  cargarvector (vec, ult);
  informarvector (vec);
  crearvectorporpuntaje (vec, vec2);
  informarvectorpuntajes (vec2);
  ordenarpuntajes (vec2);
  informarvectorpuntajes (vec2);
End.
