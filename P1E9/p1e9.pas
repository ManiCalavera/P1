
Program p1e9;

Type 

  arbol = ^nodo;
  nodo = Record
    dato: string;
    hd: arbol;
    hi: arbol;
  End;

Procedure insertar_ordenado (Var a:arbol; p:String);

Begin

  If (p <> 'zzz') Then
    Begin
      If (a = Nil) Then
        Begin
          new (a);
          a^.dato := p;
          a^.hd := Nil;
          a^.hi := Nil;
        End
      Else
        If (p >= a^.dato) Then
          insertar_ordenado (a^.hd,p)
      Else
        insertar_ordenado (a^.hi,p);
    End;
End;

Procedure crear_arbol (Var a:arbol);

Var 
  p: string;
Begin

  writeln ('inserte string');
  readln (p);
  If (p <> 'zzz') Then
    Begin
      insertar_ordenado (a,p);
      crear_arbol (a);
    End;
End;

Procedure en_orden (a:arbol);
Begin
  If (a<>Nil) Then
    Begin
      en_orden (a^.hi);
      writeln (a^.dato);
      en_orden (a^.hd);
    End;
End;

Function existe (a:arbol; p:String): boolean;
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato = p ) Then
        existe := true
      Else
        Begin
          If (p >= a^.dato) Then
            existe := existe (a^.hd, p)
          Else
            existe := existe (a^.hi,p);
        End;

    End
  Else
    existe := false;
End;

Var 
  a: arbol;
Begin
  crear_arbol(a);
  en_orden (a);
  write (existe(a,'fff'));
End.
