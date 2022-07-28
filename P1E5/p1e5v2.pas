
Program p1e5v2;

Type 

  vector = array [1..20] Of integer;

Function buscarposicion (v:vector; n,diml:integer): integer;

Var 
  pos: integeR;
Begin
  pos := 1;
  While (v[pos] < n) And (diml >= pos) Do
    Begin
      pos := pos+1;
    End;
  buscarposicion := pos;
End;

Procedure insertar (Var v:vector; n:integer; Var diml:integer);

Var 
  i,pos: integer;
Begin
  pos := buscarposicion ( v, n, diml);
  For i:=diml Downto pos Do
    Begin
      v[i +1] := v[i];
    End;
  v[pos] := n;
  diml := diml +1;
End;

Procedure llenar_vector (Var v:vector; Var diml:integer);

Var 
  n: integer;
Begin
  writeln ('ingrese numero');
  readln (n);
  If (n <> 32000) Then
    Begin
      insertar (v,n,diml);
      llenar_vector (v,diml);
    End;
End;


Function maximo (v:vector; diml:integer ; max:integer): integer;
Begin
  If (diml >=1) Then
    Begin
      If (v[diml] > max) Then
        max := v[diml];
      diml := diml-1;
      maximo := maximo (v,diml,max);
    End
  Else
    maximo := max;
End;

Function minimo (v:vector;diml: integer; Var min:integer): integer;
Begin
  If (diml >= 1) Then
    Begin
      If (v[diml] < min) Then
        min := v[diml];
      diml := diml -1;
      minimo := minimo (v,diml,min);
    End
  Else
    minimo := min;
End;





{Function suma (v:vector; diml:integer): integer;
Begin
  If (diml =0 ) Then
    suma := 0
  Else
    suma := suma (v, diml -1) + v[diml];


End;}


Function suma (v:vector; diml:integer): integer;
Begin
  If (diml >=1) Then
    Begin
      suma := suma (v, diml -1) + v[diml];
    End
  Else
    suma := 0;
End;

Procedure busquedadicoto (v:vector; pri,ult:integer;Var pos:integer;n:integer);

Var 
  medio: integer;
Begin
  pri := 1;
  ult := 5;
  medio := (pri + ult) Div 2;
  While (pri <=ult) And (n <> v[medio]) Do
    Begin
      If (n < v[medio]) Then
        ult := medio -1
      Else
        pri := medio +1;
      medio := (pri + medio) Div 2;
    End;
  If (pri <= ult) Then
    pos := medio
  Else
    pos := -1;
End;

Procedure imprimir (v:vector; diml:integer);

Var 
  i: integer;
Begin
  writeln ('se imprime vector');
  For i:=1 To diml Do
    Begin
      writeln (v[i]);
    End;
End;


Var 
  v: vector;
  max,diml,min: integer;
  pri,ult,pos: integer;
Begin
  max := -32001;
  min := 32000;
  diml := 0;
  llenar_vector (v,diml);
  imprimir (v,diml);
  max := maximo (v,diml,max);
  min := minimo (v,diml,min);
  writeln (max, ' ', min,' ', suma (v,diml));
  busquedadicoto (v,pri,ult,pos,4);
  writeln (pos);
End.
