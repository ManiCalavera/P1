
Program p1e12;

Const 
  cantidad_sucursales = 4;

Type 
  subrango = 1..cantidad_sucursales;
  registro_venta = Record
    fecha: integer;
    codigo_producto: integer;
    codigo_sucursal: integer;
    cantidad_vendida: integeR;
  End;


  lista = ^nodo;
  nodo = Record
    dato: registro_venta;
    sig: lista;
  End;


  vector_minimos = array [subrango] Of registro_venta;
  vector = array [subrango] Of lista;

Procedure insertar_ordenado (Var l:lista; r:registro_venta);

Var 
  aux,act,ant: lista;
Begin
  new (aux);
  aux^.dato := r;
  act := l;
  ant := act;
  While (act <> Nil) And (act^.dato.codigo_producto < r.codigo_producto) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (ant=act) Then
    l := aux
  Else
    ant^.sig := aux;
  aux^.sig := act;
End;

Procedure llenar_registro (Var r:registro_venta);
Begin
  writeln ('ingrese codigo');
  readln (r.codigo_producto);
  If (r.codigo_producto <> -1) Then
    Begin
      writeln ('ingrese codigo de sucursal y cantidad vendida');
      ReadLn (r.codigo_sucursal);
      Readln (r.cantidad_vendida);
    End;
End;

Procedure llenar_vector (Var v:vector);

Var 
  r: registro_venta;
Begin
  llenar_registro (r);
  If (r.codigo_producto <> -1) Then
    Begin
      insertar_ordenado (v[r.codigo_sucursal],r);
      llenar_vector (v);
    End;
End;

Procedure leer (l:lista; Var r:registro_venta);
Begin
  If (l = Nil) Then
    r.codigo_producto := 32000
  Else
    Begin
      r := l^.dato;
      l := l^.sig;
    End;
End;

Procedure buscar_minimo (Var v:vector; Var vm:vector_minimos; Var min:
                         registro_venta);

Var 
  i,pos: integer;
Begin
  min.codigo_producto := 32000;
  For i:=1 To cantidad_sucursales Do
    Begin
      If (vm[i].codigo_producto<min.codigo_producto) Then
        Begin
          min := vm[i];
          pos := i;
        End;
    End;
  If ( min.codigo_producto <> 32000) Then
    Begin
      leer (v[pos],vm[pos]);
      v[pos] := v[pos] ^.sig;
    End;
End;

Procedure merge (v:vector; Var l:lista);

Var 
  min,actual: registro_venta;
  i: integer;
  vm: vector_minimos;
  suma: integer;
Begin
  l := Nil;
  For i:=1 To cantidad_sucursales Do
    leer (v[i],vm[i]);
  writeln ('se cargo vm');
  buscar_minimo (v,vm,min);
  writeln ('se busco minimo y es ',min.codigo_producto);
  While (min.codigo_producto <> 32000 ) Do
    Begin
      actual := min;
      suma := 0;
      While (min.codigo_producto= actual.codigo_producto) Do
        Begin
          suma := suma+min.cantidad_vendida;
          buscar_minimo (v,vm,min);
          writeln  ('dsf');
        End;
      actual.cantidad_vendida := suma;
      insertar_ordenado (l,actual);
    End;
End;

Procedure informar_lista (l:lista);
Begin
  While (l <> Nil) Do
    Begin
      writeln;
      writeln ('--------------------')     ;
      writeln ('Codigo: ',l^.dato.codigo_producto);
      writeln ('Codigo  de sucursal: ',l^.dato.codigo_sucursal);
      writeln ('cantidad de ventas ',l^.dato.cantidad_vendida);
      writeln;
      l := l^.sig;
    End;
End;

Var 
  v: vector;
  l: lista;
  i: integer;
Begin
  For i:=1 To cantidad_sucursales Do
    v[i] := Nil;
  llenar_vector (v);
  For i:=1 To cantidad_sucursales Do
    informar_lista (v[i]);
  merge (v,l);
  informar_lista (l);

End.
