{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}

// Debe procesarse = REPEAT UNTIL

program cinco ; 
var
min,max,num,suma_total: integer; 
begin
suma_total:= 0 ; 
min:= 9999;
max:= -1; 

 repeat
  write('Ingrese un numero: '); 
   readln(num); 
   suma_total:= suma_total + num ; 
     if ( num > max ) then 
         max:= num 
     else if (num < min ) then 
            min:= num ;
          
 until ( num = 100 );

writeln; // salto de linea 

writeln (' ---> El numero maximo leido fue: ',max); 
writeln (' ---> El numero minimo leido fue: ',min); 
writeln ('----> La suma total de los numeros leidos es: ',suma_total); 

end.
