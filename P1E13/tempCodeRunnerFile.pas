Begin
  writeln;
  writeln ('lista2');
  writeln;
  While (l <> Nil) Do
    Begin
      writeln;
      writeln ('codigo: ',l^.dato.codigo,' cantidad: ',l^.dato.vendidas);
      l := l^.sig;
    End;