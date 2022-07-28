
Program P1E4;

Const 
  corte = -1;

Type 
  lista = ^nodo;

  nodo = Record
    dato: integer;
    sig: lista;
  End;

Procedure cargar_lista (Var l:lista);

Var 
  d: integer;
  aux: lista;
Begin
  writeln ('Ingrese el numero');
  readln (d);
  If (d<> corte) Then
    Begin
      new (aux);
      aux^.dato := d;
      aux^.sig := l;
      l := aux;
      cargar_lista (l);
    End;
End;

Procedure informar_maximo (l:lista; Var max:integer);
Begin
  If (l <> Nil) Then
    Begin
      If (max<l^.dato) Then
        max := l^.dato;
      l := l^.sig;
      informar_maximo (l, max);
    End;
End;

Procedure informar_minimo (l:lista;  Var min:integer);
Begin
  If (l <> Nil) Then
    Begin
      If (min>l^.dato) Then
        min := l^.dato;
      l := l^.sig;
      informar_minimo (l, min);
    End;
End;

Procedure existe (l:lista; num:Integer; Var esta:boolean);
Begin
  If (l <> Nil) And (esta=false) Then
    Begin
      If (l^.dato = num) Then
        Begin
          esta := true;
          writeln ('el numero se encuentra en la lista');
        End
      Else
        Begin
          l := l^.sig;
          existe (l,num,esta);
        End;
    End
  Else
    If (esta=false) Then
      writeln ('El numero no se encuentra en la lista');
End;




Var 
  l: lista;
  max,min,num: integer;
  esta: boolean;
Begin
  max := -1;
  min := 32000;
  cargar_lista (l);
  informar_maximo (l,max);
  writeln ('el maximo es: ',max);
  informar_minimo (l,min);
  writeln ('El minimo es: ',min);
  writeln ('indique que numero desea buscar');
  readln (num);
  existe (l, num, esta);
End.
