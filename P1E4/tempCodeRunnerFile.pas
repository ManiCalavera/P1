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