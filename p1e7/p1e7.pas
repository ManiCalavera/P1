
Program p1e7;

Procedure pasarabinario (n:integer);

Var 
  i: integer;
Begin
  If (n <> 0) Then
    Begin
      i := n Mod 2;
      pasarabinario (n Div 2);
      write(i);
    End;
End;

Begin
  pasarabinario (23);
End.
