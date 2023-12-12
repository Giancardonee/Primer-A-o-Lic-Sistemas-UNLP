Program cuatro;

Const 
  cantClientes = 3;
  precioMinuto = 3.40;
  precioMB = 1.35;

Type 
  Facturar = Record
    Nro_Telefono : integer ;
    MinutosConsumidos : real ;
    MbConsumidos : real ;

  End;
  cliente = Record
    codCliente : integer ;
    cantLineas : integer ;
  End;

  // a. Realizar un módulo que lea la información de una línea de teléfono.
Procedure leerCliente ( Var c : cliente );
Begin
  write ('Ingrese el codigo de cliente: ');
  readln (c.codCliente);
  write ('Ingrese la cantidad de lineas que tiene a su nombre: ');
  readln (c.cantLineas);
  writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - -');
End;

Function FacturarMBs ( mbs : real ): real ;
Begin
  FacturarMBs := ( mbs * precioMB);
End;

Function FacturarMin ( m : real ): real;
Begin
  FacturarMin := (m * precioMinuto);
End;

Function FacturacionFinal ( a,b: real  ): real;
Begin
  FacturacionFinal := ( a + b );
End;

Procedure leerLineas ( c : cliente; Var mbTotal,minTotal: real);

Var 
  i : integer ;
  f : Facturar;
Begin
  minTotal := 0;
  minTotal := 0;
  For i:= 1 To c.cantLineas Do
    Begin
      write ('Ingrese el numero de telefono de la linea ',i, ' : ');
      readln (f.Nro_Telefono);
      write ('Ingrese la cantidad de MB consumidos: ');
      readln(f.MbConsumidos);
      write ('Ingrese la cantidad de minutos consumidos: ');
      readln (f.MinutosConsumidos);
      writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - -');
      mbTotal := mbTotal + f.MbConsumidos;
      minTotal := minTotal + f.MinutosConsumidos;
    End;
End;



Var 
  i : integer;
  c : cliente;
  mbTotal: real;
  minTotal: real;
  
  precioMB_final , precioMin_final : real ;  
Begin
  For i:= 1 To cantClientes Do 
    Begin
      leerCliente ( c );
      leerLineas(c,mbTotal,minTotal);
      Writeln('La cantidad de mb consumidos del cliente ',i,' es: ',mbTotal:2:2);
      Writeln('La cantidad de min consumidos del cliente ',i,' es: ',minTotal:2:2);
      
	  precioMB_final:= FacturarMBs(mbTotal) ;
	  precioMin_final := FacturarMin(minTotal) ; 
      
      writeln ('--> El precio de la cant Total de  MB es: $',precioMB_final: 2: 2, ' pesos');
      writeln ('--> El precio de la cant total de minutos es: $',precioMin_final: 2: 2, ' pesos' );
       writeln ('--> El precio final es: $',FacturacionFinal(precioMB_final,precioMin_final): 2: 2, ' pesos' );
    End;
End.

