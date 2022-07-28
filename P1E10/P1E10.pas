
Program p1e10;

Const 
  menora = 20;
  mayora = 5;

Type 
  arbol = ^nodo;
  alumno = Record
    legajo: integer;
    nombre: string;
    apellido: string;
    dni: integeR;
    anio_ingreso: integer;
  End;

  nodo = Record
    dato: alumno;
    hd: arbol;
    hi: arbol;
  End;

Procedure insertar_ordenado (Var a:arbol; r:alumno);
Begin
  If (a=Nil) Then
    Begin
      new (a);
      a^.dato := r;
      a^.hd := Nil;
      a^.hi := Nil;
    End
  Else
    If (r.legajo >= a^.dato.legajo) Then
      insertar_ordenado (a^.hd,r)
  Else
    insertar_ordenado (a^.hi,r);
End;

Procedure llenar_arbol (Var a:arbol);

Var 
  r: alumno;
Begin
  writeln ('ingrese legajo, nombre, apellido, dni y anio de ingreso');
  readln (r.legajo);
  readln (r.nombre);
  readln (r.apellido);
  readln (r.dni);
  readln (r.anio_ingreso);
  If (r.legajo <> -1) Then
    Begin
      insertar_ordenado (a,r);
      llenar_arbol (a);
    End;
End;

Procedure informar_enorden (a:arbol);
Begin
  If (a <> Nil) Then
    Begin
      informar_enorden (a^.hi);
      writeln (a^.dato.legajo);
      informar_enorden (a^.hd);
    End;
End;

Procedure informar_especial (a:arbol; menora:integer);
Begin
  If (a<> Nil) Then
    Begin
      If (a^.dato.legajo <= menora) Then
        Begin
          informar_especial (a^.hi,menora);
          writeln (a^.dato.nombre,' ',a^.dato.apellido);
          informar_especial (a^.hd,menora);
        End
      Else
        informar_especial (a^.hi, menora);
    End;
End;


Procedure informar_especial_c (a:arbol; menora,mayora:integer);
Begin
  If (a<> Nil) Then
    Begin
      If (a^.dato.legajo <= menora) And (a^.dato.legajo >= mayora) Then
        Begin
          informar_especial_c (a^.hi,menora, mayora);
          writeln (a^.dato.nombre,' ',a^.dato.apellido);
          informar_especial_c (a^.hd,menora, mayora)
        End
      Else
        If (a^.dato.legajo < menora) Then
          informar_especial_c (a^.hd, menora, mayora)
      Else
        informar_especial_c (a^.hi, menora, mayora);
    End;
End;


Var 
  a: arbol;

Begin
  llenar_arbol (a);
  writeln ('------------Arbol en eorden---------------');
  informar_enorden (a);
  writeln ('--------------Arbol espcial b-----------------');
  informar_especial (a,menora);
  writeln ('------------------Arbol especial C-----------------');
  informar_especial_c (a,menora,mayora);
End.
