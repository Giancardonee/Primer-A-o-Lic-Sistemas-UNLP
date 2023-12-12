{6. Realice un programa que informe el valor total en pesos de una transacción en dólares. Para
ello, el programa debe leer el monto total en dólares de la transacción, el valor del dólar al día
de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la transacción. Por
ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 189,32 pesos y el
banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%)}

{ingresar cantidad de dolares, ingresar precio del dolar,convertir
* a pesos, y sumarle la comision del banco. Luego informar en pantalla}

program seis; 
const
comision = 0.04; 
var
cant_Dolar,precio_Dolar,convertir_a_pesos,precio_Final: real; 
begin
	write('---> Ingrese la cantidad de dolares: '); 
		readln(cant_Dolar); 
	write('---> Ingrese el valor del dolar hoy: '); 
		readln(precio_Dolar); 
		
		// convierto los dolares a pesos
		convertir_a_pesos:= (cant_Dolar * precio_Dolar); 
		
		// le sumo la comision del  %4 (es lo mismo que multiplicar por 0.04 y sumarlo)
		precio_Final:= ( convertir_a_pesos + (convertir_a_pesos * comision)); 

		write('-----> La transaccion sera de : $',precio_Final:2:2, ' pesos argentinos'); 
end.
