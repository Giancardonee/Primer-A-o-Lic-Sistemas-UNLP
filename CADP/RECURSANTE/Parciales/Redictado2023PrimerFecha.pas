{
Una empresa de ventas de pasajes aereos esta analizando la informacion de los viajes realizados por sus aviones.
Para ello, se dispone de una estructura de datos, con la informacion de todos los viajes. 
De cada viaje se conoce: Codigo de avion (entre 100 y 2500), año en que se realizo el viaje, 
cantidad de pasajeros que viajaron, y ciudad destino. La informacion no se encuentra ordenada por ningun criterio. 
Ademas, la empresa dispone de una estructura de datos con informacion sobre la capacidad maxima de cada avion. 

Realizar un programa que procese la informacion de los viajes e: 
1) Informe el codigo de avion que realizo la mayor cantidad de viajes. 
2) Genere una nueva lista con los viajes realizados en años multiplos de 10
con destino "Punta Cana", cuya capacidad no alcanzo a la capacidad maxima. 
3) Para cada avion, informe el promedio de pasajeros que viajaron entre todos sus viajes.
}

{Buenp este parcial me lo tomaron en la primer fecha del redicado 2023 y lo aprobe. Dejo una forma muy parecida a como lo resolvi}

{
Como lo plantee: Primero, la estructura que se dispone con la informacion de los viajes es una lista.
*
*se dispone de una estructura sobre la capacidad max de cada avion : VECTOR DE (1000 A 2500). 
* importante que el vector sea de tipo integer. Asi aprovechamos y usamos otras variables del mismo tipo de vector : 
* 
* 1) para poder almacenar la cantidad de viajes de cada avion 
* 2) para almacenar la cantidad de pasajeros totales de cada avion.
* 
* Para hacer el inciso 1 y 3, hay varias formas de hacerlo, es decir, se podria recorrer una sola vez
* el vector (si informarmos el promedio y sacamos el avion con  mas viajes en el mismo recorrido del for)
* 
* Pero en el parcial lo hice recorriendo dos veces, y no me lo marcaron como mal. 
* Por lo que entiendo, la catedra se enfoca mas en modularizar, y que cada proceso cumpla con lo suyo,
* sin darle "demasiada" importancia a la eficiencia. Yo creo que si buscamos otros metodos, este parcial 
* se podria resolver de otras formas mas eficiente, de eso estoy seguro. 
 }
program parcialRedicado2023; 
const
	dimF = 2500; 
type
	str20 = string[20]; 
	rangoCod = 1000..dimF; 
	
	viaje = record
		ciudadDestino : str20;
		anhoViaje : integer;
		cantPasajeros: integer; 
		codAvion : rangoCod;
	end; 
	
	listaViajes = ^nodo;
	nodo = record
		elemento : viaje; 
		siguiente : listaViajes;
	end;
	
	vector = array [1000..dimF] of integer; 
	
	procedure inicializarVectores (var v1,v2: vector); 
	var
		i : integer;
	begin
			for i:= 1000 to dimF do 
				begin
					v1[i]:= 0; 
					v2[i]:= 0; 
				end; 
	end;
	
	procedure crearLista(var L : listaViajes); 
	begin
		L := nil; 
	end; 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	{procesos que se deberian disponer}
	procedure cargarLista(var L : listaViajes); 
	begin end;
	procedure cargarVectorCapacidad (var v : vector); 
	begin end;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	procedure agregarAdelante (var LN : listaViajes; dato:viaje); 
	var
		nuevo: listaViajes;
	begin
		new(nuevo); 
		nuevo^.elemento:= dato; 
		nuevo^.siguiente:= LN; 
		LN:= nuevo; 
	end; 
	
	function esCiudadPuntaCana (ciudad : str20): boolean; 
	begin
		esCiudadPuntaCana:= ( ciudad = 'Punta Cana'); 
	end;
	
	function esAnhoMultiplo10(anhoViaje : integer): boolean; 
	begin
		esAnhoMultiplo10:= ((anhoViaje mod 10) = 0); 
	end; 
	
	function notCapacidadMax(cantPasajeros : integer; capacidadMax : integer): boolean;
	begin
		notCapacidadMax:= ( cantPasajeros < capacidadMax); 
	end; 
	
	{LD = ListaDispone , LN = ListaNueva, vP = vPasajeros, vV= vViajes, vD = vDispone}
	procedure procesarLista (LD: listaViajes; var LN: listaViajes; var vP,vV : vector; vD  : vector );
	begin
		while (LD <> nil) do 
			begin
				{incremento los viajes de cada avion }
				vV[LD^.elemento.codAvion]:= vV[LD^.elemento.codAvion] + 1 ; 
				
				{incremento la cantidad de pasajeros por cada avion}
				vP[LD^.elemento.codAvion]:= vP[LD^.elemento.codAvion] + LD^.elemento.cantPasajeros; 
				
				{genero la nueva lista, si cumple con las condiciones}
				{podriamos usar una sola funcion CUMPLE , y hacer todo en una sola tamb}
				{lo estoy resolviendo de la forma mas parecida a mi parcial que aprobe :) }
				if (  (esAnhoMultiplo10(LD^.elemento.anhoViaje) ) and (esCiudadPuntaCana (LD^.elemento.ciudadDestino) ) and (notCapacidadMax(LD^.elemento.cantPasajeros,vD[LD^.elemento.codAvion])) ) then 
					agregarAdelante(LN,LD^.elemento); 
					
				LD:= LD^.siguiente; { avanzamos al sig nodo en la lista }
			end; 
	end; 
	
	procedure informarPromedio(vP,vV : vector); 
	var
		i : integer; 
		prom : real; 
	begin
		for i := 1000 to 2400 do 
			begin
					prom:= ( vP[i] / vV[i] ) ;  
					writeln ('El promedio de pasajeros del avion ',i, ' es: ',prom ); 
			end; 
	end; 
	
	function avionMasViajes(vV : vector): integer;
	var
		i ,max: integer; 
		codMax : rangoCod;
	begin
		max:= -1;
		for i:= 1000 to 2400 do
			begin
				if ( vV[i] > max ) then 
					begin
						max:= vV[i]; 
						codMax:= i;
					end; 
			end; 
		avionMasViajes:= codMax; 
	end; 
	
	procedure informar (vP,vV : vector); 
	begin
		informarPromedio(vP,vV); 
		writeln ('El avion que realizo mas cantidad de viajes, tiene el codigo: ',avionMasViajes(vV)); 
	end; 
	
	{ programa principal }
	var
	vDispone , vCantPasajeros, vViajes : vector; 
	ListaDispone,ListaNueva : listaViajes; 
	begin
	crearLista(ListaDispone); {se deberia disponer} 
	crearLista(ListaNueva); 
	cargarLista(ListaDispone); { se dispone }
	cargarVectorCapacidad(vDispone); { se dispone }
	inicializarVectores(vCantPasajeros,vViajes); 
	procesarLista(ListaDispone,ListaNueva,vCantPasajeros,vViajes,vDispone); 
	informar (vCantPasajeros,vViajes); 
	end. 
