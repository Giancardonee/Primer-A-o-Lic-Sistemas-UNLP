{3. Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62}

program tres; 
var
n1,n2,res: real; 
begin
	write('Ingrese el primer numero: '); 
	readln(n1); 
	write('Ingrese el segundo numero: '); 
	readln(n2);
	res:= ( n1 / n2); 
	writeln('El resultado de dividir ',n1:2:2, ' entre ',n2:2:2, ' es: ' ,res:2:2); 
end.
