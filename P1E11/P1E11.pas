
Program p1e11;
Const 
  tope = 8;

Type 
  subrango = 1..tope;
  registro_pelicula = Record
    codigo: integer;
    genero: subrango;
    puntaje: real;

  End;

  arbol = ^nodo;
  nodo = Record
    dato: registro_pelicula;
    hi: arbol;
    hd: arbol;
  End;

  vector = array [subrango] Of arbol;

Procedure insertar_ordenado (Var a:arbol; r:registro_pelicula);
Begin
  If (a = Nil) Then
    Begin
      new (a);
      a^.dato := r;
      a^.hd := Nil;
      a^.hi := Nil;
    End
  Else
    Begin
      If (r.codigo > a^.dato.codigo) Then
        insertar_ordenado (a^.hd, r)
      Else
        insertar_ordenado (a^.hi,r);
    End;
End;

Procedure llenar_registro (Var r:registro_pelicula);
Begin
  writeln ('ingrese codigo');
  readln (r.codigo);
  If (r.codigo <> -1) Then
    Begin
      writeln ('ingrese genero y puntaje')     ;
      readln (r.genero);
      readln (r.puntaje);
    End;
End;

Procedure llenar_vector (Var v:vector) ;

Var 
  r: registro_pelicula;
Begin
  llenar_registro (r);
  If (r.codigo <> -1) Then
    Begin
      insertar_ordenado (v[r.genero],r);
      llenar_vector (v);
    End;
End;

Procedure insertar_arbol_insiso_b (Var a2:arbol; a1:arbol);

Begin
  If  (a1 <> Nil) Then
    Begin
      insertar_arbol_insiso_b (a2,a1^.hi);
      insertar_ordenado (a2, a1^.dato);
      insertar_arbol_insiso_b (a2,a1^.hd);
    End;
End;

Procedure crear_arbol_b (Var a2:arbol; v:vector);

Var 
  i: integer;
Begin
  For i:=1 To tope Do
    Begin
      insertar_arbol_insiso_b (a2, v[i]);
    End;
End;

Procedure informar_enorden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      informar_enorden (a^.hi);
      writeln (a^.dato.codigo);
      informar_enorden (a^.hd);
    End;
End;

Var 
  v: vector;
  a2: arbol;
  i: integer;
Begin
  For i:=1 To tope Do
    Begin
      v[i] := Nil;
    End;
  a2 := Nil;
  llenar_vector (v);
  For i:=1 To tope Do
    Begin
      WRITELN ('----SE IMPRIME EL GENERO ',I,'-----------');
      informar_enorden (v[i]);
    End;
  crear_arbol_b (a2,v);
  Writeln ('----Se imprime arbol insiso b------');
  informar_enorden (a2);
End.
