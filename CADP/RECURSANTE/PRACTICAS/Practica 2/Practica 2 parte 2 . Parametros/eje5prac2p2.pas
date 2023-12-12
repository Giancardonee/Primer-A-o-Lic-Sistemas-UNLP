{5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program cinco; 
 function esDoble (numA,numB: integer): boolean;
  var
  doble:integer;
  ok: boolean;
  begin
  doble:= numA * 2 ;
   if ( numB = doble ) then 
     ok:= True
   else 
      ok:= False; 
  
  esDoble:= ok; 
  end;
  
  procedure LeerNumeros (var cant_doble, nros_leidos: integer); 
  var
  numA,numB: integer; 
  begin
   cant_doble:=0;
   nros_leidos:=0; 
    write ('Ingrese un numero: '); 
     readln (numA); 
    write ('Ingrese un numero: '); 
     readln(numB); 
      while ( numA <> 0 ) and ( numB <> 0 ) do 
        begin
        
			writeln;// salto de linea
           nros_leidos:= nros_leidos+ 1; 
            if (esDoble(numA,numB)) then 
                cant_doble:= cant_doble + 1 ; 
           
     write ('Ingrese un numero: '); 
       readln (numA); 
      write ('Ingrese un numero: '); 
       readln(numB); 
        end; 
   writeln;// salto de linea
  end;

var
cant_doble, nros_leidos: integer; 
begin
LeerNumeros (cant_doble,nros_leidos); 
 writeln ('---> La cantidad de pares leidos son: ',nros_leidos); 
 writeln('----> La cantidad de pares que el numB es el doble que numA es: ',cant_doble);
end.
