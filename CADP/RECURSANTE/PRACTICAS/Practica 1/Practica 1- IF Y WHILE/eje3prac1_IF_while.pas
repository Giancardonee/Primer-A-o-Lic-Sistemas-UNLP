{. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10}
program tres; 
var
n1,n2,n3: integer; 
begin
	write('Ingrese el primer numero: '); 
		readln(n1); 
	write('Ingrese el segundo numero: '); 
		readln(n2);
	write('Ingrese el tercer numero: '); 
		readln(n3);  
		
	    if ( n1 >= n2 ) then 
							 if( n2>= n3 ) then 
								 write('Los numeros en forma descendente son: ',n1, ' ' ,n2, ' ' ,n3)
							 else if ( n1>= n3 ) then
								  write ('Los numeros en forma descendente son: ',n1, ' ' ,n3, ' ' ,n2)
							 else 
									write ('Los numeros en forma descendente son: ',n3, ' ',n1, ' ',n2 )
		else if ( n2>= n3 ) then 
							if ( n1 >= n3 ) then 
								write ('Los numeros en forma descendente son: ' ,n2, ' ' ,n1, ' ' ,n3)
							else 
								 write ('Los numeros en forma descendente son: ',n2, ' ' ,n3, ' ' ,n1) 
	     else 
				write ('Los numeros en forma descendente son: ' ,n3, ' ' ,n2, ' ',n1); 			
end.
