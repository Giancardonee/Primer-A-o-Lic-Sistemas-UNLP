{ 4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse }


{ dejo los tres casos dentro del programa, si queremos probar caso por caso, debemos comentar
* los casos que no usemos}

program cuatro; 
const 
 numeros_a_leer = 1000 ;
var
i,num,min1,min2: integer; 
begin
min1:= 9999; 
min2:= 9999; 

{El programa lee 1000 numeros enteros ( usamos un for
 porque sabemos la cantidad de veces que se va a leer numeros) } 
  for i := 1 to numeros_a_leer do 
	  begin
	   write ('Ingrese un numero: '); 
	      readln (num); 
	         if ( num < min1 ) then 
	           begin
	              min2:= min1; 
	               min1:= num; 
	            end
	         else if ( num < min2 ) then 
	             min2:= num; 
	  end;  // fin del for
 
 { Inciso a) en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.}
repeat 
 write ('Ingrese un numero: '); 
	      readln (num); 
	         if ( num < min1 ) then 
	           begin
	              min2:= min1; 
	               min1:= num; 
	            end
	         else if ( num < min2 ) then 
	             min2:= num; 
until ( num = 0 ); 

{ inciso b)  en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse }
  write ('Ingrese un numero: '); 
	   readln (num);  
	      while ( num <> 0 ) do 
	          begin
	                if ( num < min1 ) then 
							   begin
								  min2:= min1; 
								   min1:= num; 
								end
							 else if ( num < min2 ) then 
								 min2:= num; 
	           write ('Ingrese un numero: '); 
	            readln (num); 
	          end;    
 

 writeln('Los dos numeros minimos leidos son: ',min1, ' y ' ,min2); 

end.
