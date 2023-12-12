{ 7 Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener
una longitud máxima de 50 caracteres.


a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.} 

{esta estructura, requiere ( 2500 * 51 ) bytes = 127.500 bytes de memoria ESTATICA}
program eje7; 
type 
	nombreCiudades = string[50]; 
	
	vector = array [1..2500] of nombreCiudades; 
	
	procedure cargarVector ( var v : vector) ; 
	var 
		 i : integer; 
	begin
				for i:= 1 to  2500 do 
				readln (v[i]); 
	end;
var 
	v : vector; 
begin
cargarVector(v);
end.

{ b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:} 

Type 

Nombre = String[50];
Puntero = ^Nombre;
ArrPunteros = array[1..2500] of Puntero;

Var
Punteros: ArrPunteros;

{ b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.} 
El tamaño de la variable puntero ,al comenzar el programa es de 4 bytes en memoria estatica.

{ b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica? } 

Este programa, reserva memoria para todo el vector. Por lo que es un vector de punteros
Esto ocuparia, en memoria DINAMICA = ( 51 * 2500) bytes.
procedure reservarMem (var v : ArrPuntero); 
var 
	i : integer;
begin
	for i:= 1 to 2500 do 
		new(v[i]); 
end;




{ b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.} 
De esta manera, estamos leyendo nombres y almacenandolo en donde apunte cada puntero del vector
procedure cargarVector (var v : ArrPuntero); 
var 
	i : integer;
begin
		for i := 1 to 2400 do 
			readln (v[i]^);
end;



