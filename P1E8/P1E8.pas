
Program p1e8;



Type 

  arbol = ^nodo;

  nodo = Record
    dato: integer;
    hi: arbol;
    hd: arbol;
  End;


Procedure crear_arbol (Var a:arbol; d:integer);

Begin
  If  (d <> -1) Then
    Begin
      If (a = Nil) Then
        Begin
          new (a);
          a^.dato := d;
          a^.hd := Nil;
          a^.hi := Nil;
        End
      Else
        If (d < a^.dato) Then
          Begin
            crear_arbol (a^.hi,d);
          End
      Else
        crear_arbol (a^.hd, d);
    End;
End;


Procedure en_orden (a:arbol);



Begin
  If (a <> Nil) Then
    Begin
      en_orden (a^.hi);
      writeln (a^.dato);
      en_orden (a^.hd);
    End;
End;

Procedure pos_orden (a:arbol);

Begin
  If (a <> Nil) Then
    Begin
      pos_orden (a^.hd);
      writeln (a^.dato);
      pos_orden (a^.hi);
    End;
End;



Function maximo (a:arbol): integer;
Begin
  If (a = Nil) Then

    maximo := -1
  Else
    If (a^.hd = Nil) Then
      maximo := a^.dato
  Else
    maximo := maximo (a^.hd);
End;

Function minimo (a:arbol): integer;
Begin

  If (a^.hi = Nil) Then
    minimo := a^.dato
  Else
    minimo := minimo (a^.hi);

End;

Function cuenta_nodos (a:arbol): integer;
Begin
  If (a=Nil) Then
    cuenta_nodos := 0
  Else
    cuenta_nodos := 1 + cuenta_nodos (a^.hi) + cuenta_nodos (a^.hd);
End;



Var 
  a: arbol;
  d: integer;
Begin
  writeln ('ingrese el numero');
  readln (d);

  While (d <> -1) Do
    Begin
      crear_arbol (a, d);
      writeln ('ingrese el numero');
      readln (d);
    End;

  en_orden (a);
  writeln;
  pos_orden (a);
  writeln;
  writeln ('la cantidad de nodos es ',cuenta_nodos (a));
  writeln;
  writeln (maximo (a));
  writeln (minimo (a));


End.
