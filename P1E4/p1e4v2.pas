
Program p1e4v2;


Type 

  lista = ^nodo;
  nodo = Record
    dato: integer;
    sig: lista;
  End;




















Procedure minimo (l:lista; Var min:integer);
Begin
  If (l <> Nil) Then
    Begin
      If (min > l^.dato) Then
        Begin
          min := L^.dato;
        End;
      minimo (l^.sig, min);
    End;
End;














Procedure cargar_lista (Var l:lista);

Var 
  d: integer;
  aux: lista;
Begin
  writeln ('Ingrese el numero');
  readln (d);
  If (d <> 32000) Then
    Begin
      new (aux);
      aux^.dato := d;
      aux^.sig := l;
      l := aux;
      cargar_lista (l);
    End;
End;


Function maximo (l:lista; max:integer): integer;
Begin
  If (l <> Nil) Then
    Begin
      If (max < l^.dato) Then
        Begin
          max := l^.dato;
        End;
      maximo := maximo (l^.sig,max);
    End
  Else
    maximo := max;
End;

Var 
  l: lista;
  max,min: integer;

Begin
  max := -1;
  min := 32000;
  l := Nil;
  cargar_lista (l);
  minimo(l,min);
  writeln ('el minimo es: ',min);
  writeln ('el maximo es: ', maximo (l,max));
End.
