{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}

program uno; 
const
cant_numeros = 10 ; 
var
num,suma,i,cant_mayores5: integer; 
begin
suma:= 0 ; 
cant_mayores5:= 0 ; 
	for i := 1 to cant_numeros do 
		 begin
			write ('Ingrese un numero: '); 
			  readln(num); 
		       suma:= suma + num; 
		          if ( num > 5 ) then 
		            cant_mayores5:= cant_mayores5 + 1; 
		 end; 
	writeln ('---> La suma de todos los numeros leidos es: ',suma); 
	writeln ('---> La cantidad de numeros mayores que 5 fueron: ',cant_mayores5); 
end.
