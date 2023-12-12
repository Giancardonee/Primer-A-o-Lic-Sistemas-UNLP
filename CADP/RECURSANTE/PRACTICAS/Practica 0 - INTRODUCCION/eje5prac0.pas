{5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades
iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60.} 


{Para resolver este programa debo usar variables enteras (PARA PODER USAR DIV Y MOD)
* Y una variable REAL, para el inciso b (dinero a cobrar)}

{Con la operacion DIV, nos traemos la parte entera, es decir
* la cantidad de caramelos IGUALES para cada cliente}

{Con la operacion MOD, nos traemos el resto, es decir
* la cantidad de caramelos QUE SOBRAN, en este caso se los queda el kiosquero}

{Voy a usar una CONSTANTE, con el precio de cada caramelo
* ya que el precio por unidad va a seguir siendo el mismo a lo largo del programa. }


program cinco;

const
Precio_caramelo = 1.60; 
var
cant_Caramelos,cant_Clientes,caramelosCliente,caramelosKiosquero: integer; 
Precio_a_cobrar: real; 
begin
write ('Ingrese la cantidad de caramelos: '); 
readln (cant_Caramelos); 
write('Ingrese la cantidad de clientes: '); 
readln(cant_Clientes); 

//Cantidad de caramelos para cada cliente (Cantidad Igual)
caramelosCliente:= (cant_Caramelos DIV cant_Clientes); 
caramelosKiosquero:= (cant_Caramelos MOD cant_Clientes); 

{Si la cantidad de caramelos es mayor, o igual a la de los clientes alcanzan los caramelos. 
* Si la cantidad de caramelos es menor a la de los clientes, NO alcanzan los caramelos.}

	if (cant_Caramelos >= cant_Clientes) then 
		begin
			writeln; // linea en blanco
			writeln('---> A cada cliente le corresponden ',caramelosCliente, ' caramelos'); 
			writeln('---> Al kiosquero le sobraron ',caramelosKiosquero, ' caramelos'); 
			Precio_a_cobrar:= (Precio_caramelo * (cant_Caramelos - caramelosKiosquero)); 
			writeln;  // linea en blanco
			writeln('El precio a cobrar es de: $',Precio_a_cobrar:3:2); 
		end
		else
			writeln('No hay suficientes caramelos para todos los clientes :( '); 
end.

