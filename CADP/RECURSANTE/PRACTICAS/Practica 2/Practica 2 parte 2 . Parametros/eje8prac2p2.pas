{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee. }

program ocho; 
const 
 corte = 12345; 
 
 procedure descomponer (var sumaDigitosPares: integer; var cantDigImpares : integer ; num : integer); 
 var
 dig : integer; 
 begin
	while ( num <> 0 )do 
		begin
				dig:= num mod 10; 
				if (( dig mod 2)= 0 ) then 
						 sumaDigitosPares:= sumaDigitosPares + dig
			   else 
						cantDigImpares:= cantDigImpares +  1; 
				
				num:= num div 10;        
		end;
 end;
 


var
num,sumaPares,cantImpares: integer; 
begin
sumaPares:= 0 ;
cantImpares:= 0 ; 
write('Ingrese un numero: '); 
 readln(num); 
  while ( num <> corte ) do 
    begin
	descomponer (sumaPares,cantImpares,num); 
      writeln; 
     
    writeln ('La suma de los digitos pares es: ',sumaPares); 
    writeln ('La cantidad de digitos impares es: ',cantImpares); 
    write ('Ingrese un numero: ') ; 
     readln (num); 
    end; 

end. 
