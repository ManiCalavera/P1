
Program p1e3;

Const 
  maximo = 30;

Type 
  subrango = 1..8;

  registro_producto = Record
    codigo: integer;
    rubro: subrango;
    precio: real;
  End;

  lista_productos = ^nodo;

  nodo = Record
    dato: registro_producto;
    sig: lista_productos;
  End;

  vector_productos = array [subrango] Of lista_productos;
  vector_rubro_3 = array [1..30] Of registro_producto;

Procedure cargar_registro (Var reg_pro:registro_producto);
Begin
  Randomize;
  writeln ('Ingrese el codigo');
  readln (reg_pro.codigo);
  If (reg_pro.codigo <> -1) Then
    Begin
      reg_pro.precio := Random (500);
      reg_pro.rubro := Random (7)+1;
    End;
End;

Procedure agregar_detras (Var l:lista_productos; reg_pro:registro_producto);

Var 
  aux: lista_productos;

Begin
  new (aux);
  aux^.dato := reg_pro;
  aux^.sig := l;
  l := aux;
End;

Procedure crear_vector (Var v:vector_productos);

Var 
  reg_pro: registro_producto;
Begin
  cargar_registro (reg_pro);
  While (reg_pro.codigo <> -1) Do
    Begin
      Case reg_pro.rubro Of 
        1: agregar_detras (v[reg_pro.rubro], reg_pro);
        2: agregar_detras (v[reg_pro.rubro], reg_pro);
        3: agregar_detras (v[reg_pro.rubro], reg_pro);
        4: agregar_detras (v[reg_pro.rubro], reg_pro);
        5: agregar_detras (v[reg_pro.rubro], reg_pro);
        6: agregar_detras (v[reg_pro.rubro], reg_pro);
        7: agregar_detras (v[reg_pro.rubro], reg_pro);
        8: agregar_detras (v[reg_pro.rubro], reg_pro);
      End;
      cargar_registro (reg_pro);
    End;
End;

Procedure informar_vector (vec:vector_productos);

Var 
  i: integer;
  aux: lista_productos;
Begin
  writeln ;
  writeln ('Se informa el vecto de productos');
  For i:=1 To 8 Do
    Begin
      aux := vec[i];
      While (aux <> Nil) Do
        Begin
          writeln;
          writeln ('codigo:', aux^.dato.codigo);
          writeln ('El precio es', aux^.dato.precio);
          writeln ('la posicion es:', i);
          aux := aux^.sig;
        End;
    End;
End;

Procedure crear_vector_rubro3 (Var v:vector_rubro_3; l:lista_productos; Var cont
                               :integer);


Begin
  cont := 1;
  While (l <> Nil) And (cont <=30) Do
    Begin

      v[cont] := l^.dato;
      cont := cont+1;
      l := l^.sig;

    End;

End;

Procedure informar_rubro3 (v:vector_rubro_3; diml:integer);

Var 
  i: integer;
Begin
  writeln ;
  writeln ('Se informa el vector de productos rubro 3');
  For i:=1 To diml Do
    Begin
      writeln;
      writeln ('codigo:', v[i].codigo);
      writeln ('El precio es', v[i].precio);
    End;


End;



Var 
  v1: vector_productos;
  v2: vector_rubro_3;
  diml: integer;
Begin
  crear_vector (v1);
  informar_vector (v1);
  crear_vector_rubro3 (v2,v1[3],diml);
  informar_rubro3 (v2,diml);
End.
