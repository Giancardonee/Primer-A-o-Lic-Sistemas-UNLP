{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

program dos; 
var
numero: Real; 
begin
write ('Ingrese un numero: '); 
	readln(numero); 
		if ( numero >= 0 )then 
			writeln('El valor absoluto del numero ingresado es: ',numero:2:0)
	    else 
			writeln('El valor absoluto del numero ingresado es: ',-numero:2:0); 
			// tambien lo podemos hacer multiplicando el numero por -1 
end.
