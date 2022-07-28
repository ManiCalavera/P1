
Program p1e3v3;

Const 
  cant_productos = 6;

Type 
  subrango = 1..cant_productos;
  reg_producto = Record
    cod: integer;
    rubro: integer;
    precio: real;
  End;
  dsff
  lista = ^nodo;
  nodo = Record
    dato: reg_producto;
    sig: lista;
  End;

  vec_productos = array[subrango] Of lista;

Procedure cargar_registro (Var r:reg_producto);
Begin
  With r Do
    Begin
      writeln ('ingrese codigo categoria y precio');
      readln (cod);
      readln (categoria);
      readln (precio);
    End;
End;

Procedure insertar_elemento (Var pri:lista; r:reg_producto);

Var 
  ant,act,nue: lista;
Begin
  ant := pri;
  act := pri;
  new (nue);
  nue^.dato := r;
  While ((act <> Nil) And (act^.dato.cod < r)) Do
    Begin


    End;
End;

Procedure cargar_vector (Var v:vec_productos);

Var 
  ant,ult: lista;
  i: integer;
  r: reg_producto;
Begin
  cargar_registro (r);
  If (r.codigo <> -1) Then
    Begin

    End;
End;

Var 


Begin

End.
