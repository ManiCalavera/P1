Function suma (v:vector; diml:integer): integer;
Begin
  If (diml =0 ) Then
    suma := 0
  Else
    suma := suma (v, diml -1) + v[diml];


End;