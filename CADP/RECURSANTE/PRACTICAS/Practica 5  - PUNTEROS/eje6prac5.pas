 { 
 
 Realizar un programa que ocupe 50 KB de memoria en total. 
 * 50kb ----> 50.0000 bytes.
 
 
a) El programa debe utilizar sólo memoria estática
b) El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica
c) El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4
bytes)

}

// a) El programa debe utilizar sólo memoria estática
{  El programa ocupa 50.000 bytes de memoria estatica porque
* un vector ocupa = ( dimension fisica * tipo de dato ), 
* Teniendo en cuenta que un integer ocupa 2 bytes,entonces haciendo el calculo: 
* 25.000 * 2=  50.000 bytes } 

program incisoA; 

type
	vector = array [1..25000] of integer; 

var 
	v : vector; 
begin

end.

//b) El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica
program incisoB; 

type
	vector = array [1..25000] of boolean; 
	vector2 = array [1..24996] of boolean; 
	
	pVector = ^vector; 
	
var 
	v : vector2; 			{24.996 bytes de memoria estatica}
	puntVector : pVector;  {4 bytes de memoria estatica}
											{ entre estas dos variables sumamos 25.000 bytes de memoria estatica} 
begin
new (puntVector);	{25.000 bytes de memoria dinamica}
end/

{ c) El programa debe minimizar tanto como sea posible el uso de la memoria estática
* (a lo sumo, 4 bytes) }
{si se refiere a bajar solo ma memoria estatica, pero que la dinamica siga igual, se puede hacer:}

{de esta forma vamos a tener 4bytes de memoria estatica y 25.000 bytes de memoria dinamica.}
{de esta forma seguiremos teniendo la mims}
program incisoC;
type
vector2 = array [1..25000] of boolean; 

puntVector = ^vector2

var 

pVector = puntVector; 

begin 
 new (pVector); 
end.

	
	
	
	
	
