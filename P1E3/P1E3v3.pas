
Program p1e3v3;

Const 
  cant = 6;
  cant_rubro = 3;
  rubro = 3;

Type 
  subrango = 1..cant;
  subrango_rubro = 1..cant_rubro;

  reg_prod = Record
    cod: integer;
    cat: integeR;
    precio: real;
  End;

  lista = ^nodo;
  nodo = Record
    dato: reg_prod;
    sig: lista;

  End;

  vec_producto = array [subrango] Of lista;
  vec_rubro = array [subrango_rubro] Of reg_prod;



Procedure cargar_registro (Var r:reg_prod);
Begin
  writeln ('ingrese codigo categoria y precio');
  readln (r.cod);
  readln (r.cat);
  readln (r.precio);
End;


Procedure agregar_ordenado (Var pri:lista; r:reg_prod);

Var 
  ant,act,aux: lista;
Begin
  act := pri;
  ant := pri;
  new (aux);
  aux^.dato := r;
  While (act<>Nil) And (r.cod > act^.dato.cod) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then
    Begin
      pri := aux;
    End
  Else
    ant := aux;
  aux^.sig := act;
End;


Procedure cargar_vector (Var v:vec_producto);

Var 
  r: reg_prod;

Begin

  cargar_registro (r);
  If (r.cod <> -1) Then
    Begin
      agregar_ordenado (v[r.cat],r);
      cargar_vector (v);
    End;
End;


Procedure mostrar_vector (v:vec_producto);

Var 
  i: integer;
Begin
  For i:=1 To cant Do
    Begin
      writeln;
      writeln ('Categoria; ',i);
      writeln;
      While (v[i] <> Nil) Do
        Begin
          writeln ('codigo: ',v[i]^.dato.cod,' precio: ',v[i]^.dato.precio);
          v[i] := v[i]^.sig;
        End;
    End;
End;

Procedure cargar_vector_rubro (v0:vec_producto ;Var v:vec_rubro; Var diml:
                               integer);

Var 
  i: integer;
Begin
  diml := 0;
  While (v0[rubro] <> Nil) And (diml<=cant_rubro) Do
    Begin
      diml := diml+1;
      v[diml] := v0[rubro]^.dato;
      v0[rubro] := v0[rubro]^.sig;
    End;
End;

Procedure mostrar_vector_rubro (v:vec_rubro; diml:integer);

Var 
  i: integer;
Begin
  For i:=1 To diml Do
    Begin
      writeln ;
      writeln (v[i].cod,' ',v[i].precio);
    End;
End;

Var 
  i: integer;
  v: vec_producto;
  diml: integer;
  v2: vec_rubro;
Begin
  For i:=1 To cant Do
    Begin
      v[i] := Nil;
    End;
  cargar_vector (v);
  mostrar_vector (v);
  writeln;
  cargar_vector_rubro (v,v2,diml);
  mostrar_vector_rubro (v2,diml);
End.
