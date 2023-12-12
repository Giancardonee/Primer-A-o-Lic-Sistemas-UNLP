{Hacer un programa que muestre el resultado de la suma de dos numeros:
a) Utilizando una variable
b) Sin utilizar ninguna variable adicional. }

program dos; 
var
n1,n2,suma: integer; 
begin
	suma:= 0 ; 
	write('Ingrese el primer numero: '); 
	readln(n1); 
	write('Ingrese el segundo numero: '); 
	readln(n2); 
	// a)
	suma:= n1 + n2 ; 
	writeln('El resultado de la suma es: ',suma); 
	
	//b
	writeln('El resultado de la suma es: ',n1 + n2); 
end. 
