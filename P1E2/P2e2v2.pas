
Program P2E2v2;

Type 
  subrango = 1..6;

  Reg_pelicula = Record
    cod: integer;
    cat: subrango;
    puntaje: real;
  End;



  lista = ^nodo;
  nodo = Record
    dato: Reg_pelicula;
    sig: lista;
  End;



  vec_peliculas = array [subrango] Of lista;
  vec_maximos = array [subrango] Of Reg_pelicula;

Procedure cargar_registro (Var r:Reg_pelicula);
Begin
  With r Do
    Begin
      writeln ('ingrese codigo categoria y puntaje');
      readln (cod);
      readln (cat);
      readln (puntaje);
    End;
End;

Procedure inicializar_vector (Var v:vec_peliculas);

Var 
  i: integer;
Begin
  For i:=1 To 6 Do
    Begin
      v[i] := Nil;
    End;
End;

Procedure cargar_vector (Var v:vec_peliculas);

Var 
  r: Reg_pelicula;
  aux: lista;
  i: integer;
Begin

  i := 0;
  cargar_registro (r);
  While (r.cod <> -1) Do
    Begin
      new (Aux);
      aux^.sig := v[r.cat];
      aux^.dato := r;
      v[r.cat] := aux;
      i := i+1;
      cargar_registro (r);
    End;
End;

Procedure informar_vector (v:vec_peliculas);

Var 

  i: integer;
Begin
  For i:=1 To 6 Do
    Begin
      writeln ();
      writeln ('categoria: ',i);
      writeln;
      While (v[i] <> Nil) Do
        Begin
          writeln;
          writeln (v[i]^.dato.cod);
          writeln (v[i]^.dato.cat);
          writeln (v[i]^.dato.puntaje);

          v[i] := v[i]^.sig;
        End;
    End;
End;

Procedure cargar_maximos (Var v:vec_maximos; v0:vec_peliculas);

Var 
  i: integer;
  max_puntaje: Reg_pelicula;
Begin

  For i:=1 To 6 Do
    Begin

      max_puntaje.puntaje := -1;
      While (v0[i] <> Nil) Do
        Begin
          If (max_puntaje.puntaje < v0[i]^.dato.puntaje) Then

            max_puntaje := v0[i]^.dato;
          v0[i] := v0[i]^.sig;
        End;
      v [i] := max_puntaje;
    End;
End;

Procedure informar_maximos (v:vec_maximos);

Var 
  i: integer;
Begin
  For i:=1 To 6 Do
    Begin
      writeln ('El maximo de la cat: ',i, ' es: ',v[i].cod,' con puntaje: ',v[i]
               .puntaje:2:2);
    End;
End;

Var 
  v: vec_peliculas;
  v_max: vec_maximos;
Begin
  cargar_vector (V);

  cargar_maximos (v_max,v);
  informar_vector (v);

  informar_maximos (v_max);
End.
