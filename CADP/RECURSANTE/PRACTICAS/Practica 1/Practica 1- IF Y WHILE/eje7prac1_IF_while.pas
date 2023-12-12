{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”}
program siete;
var
codigo: integer; 
precio_actual, precio_nuevo,precio_comparar: real ; 
aumento: boolean ;
begin
repeat 
aumento:= false; 
write ('Ingrese el codigo del producto: '); readln (codigo); 
write ('ingrese el precio actual: '); readln(precio_actual); 
write ('ingrese el precio con aumento: '); readln(precio_nuevo); 
precio_comparar:= precio_actual + (precio_actual * 0.10); 
	if (precio_nuevo > precio_comparar) then 
		aumento:= true; 
	
	if (aumento) then 
			writeln ('El precio con el aumento supera al %10')
	else
			writeln ('El precio con el aumento NO supera al %10');

writeln(' - - - - - - - - - - - - - - - - - - - - - - - -')	
	
until (codigo = 32767)
end.
