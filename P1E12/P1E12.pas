
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


  arbol = ^nodo;
  nodo = Record
    dato: registro_venta;
    hd: arbol;
    hi: arbol;
  End;

  vector = array [subrango] Of arbol;

Procedure insertar_ordenado (Var a:arbol; r:registro_venta);
Begin
  If (a <> Nil) Then

End;
