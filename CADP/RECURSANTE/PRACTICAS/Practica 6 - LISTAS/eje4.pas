{
4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.
}

{ si el inciso a y b se hacen en modulos distintos, se necesitaria recorrer la lista una vez por cada incsiso 
* y usamos una funcion. 
* Pero si se debe recorrer una sola vez para hacer estos incisos, usamos un procedimiento y recorremos todo 1 vez
* 
* Yo voy a seguir el enunciado y voy a hacer una funcion para cada inciso.
* con los parametros que indica cada inciso. 
* 
* En total recorreria 3 veces la lista: 
* 1era vez) para sacar maximo 
* 2da vez ) para sacar minimo
* 3era vez)para hacer inciso c  
* 
* }


	program eje4; 
	type
		listaEnteros = ^nodo; 
		
		nodo = record
				elemento : integer;
				siguiente : listaEnteros; 
		end;  

	procedure crearLista (var pI : listaEnteros); 
	begin
			pI:= nil; 
	end;
	
	procedure agregar_AlFinal (var pI,pU : listaEnteros; valor : integer); 
	var
		nuevo : listaEnteros; 
	begin
		new (nuevo); 
		nuevo^.elemento:= valor; 
		nuevo^.siguiente:= nil; 
		
		if (pI = nil) then 
			begin
				pI:= nuevo; 
				pU:= nuevo; 
			end
		else
			begin
			pu^.siguiente:= nuevo; 
			pU:= nuevo; 
			end; 
			
	end;
	
	procedure cargarLista (var pI,pU : listaEnteros); 
	var
		valor: integer; 
	begin
		write ('Ingrese un numero: '); readln (valor); 
		while (valor <> 0) do 
			begin
					agregar_AlFinal(pI,pU,valor); 
					write ('Ingrese un numero: '); readln (valor); 
			end; 
	end; 
	
	procedure imprimirLista (pI : listaEnteros); 
	begin
		while (pI <> nil) do 
			begin
					writeln (pI^.elemento); 
					
					pI:= pI^.siguiente;
			end; 
	
	end; 
	
	{inciso a}
	function numeroMaximo (pI : listaEnteros): integer; 
	var
		max : integer; 
	begin
		max:= -1; 
			while (pI <> nil) do 
				begin
				
					if (pI^.elemento > max) then     {calculo max} 
						max:= pI^.elemento; 				
				
					pI:= pI^.siguiente;							{incremento nodo en lista} 
				end; 
			numeroMaximo:= max; 
	end ; 
	
	{inciso b}
	function numeroMinimo (pI :  listaEnteros): integer; 
	var 
		minimo : integer; 
	begin
		minimo:= 9999; 
		while (pI <> nil) do 
			begin
				
				if (pI^.elemento < minimo) then  {calculo minimo}
					minimo:= pI^.elemento; 
					
					pI:= pI^.siguiente; 						{avanzo al sig nodo}
			end; 
		numeroMinimo:= minimo; 	
	end;  
	
	function esMultiplo (multiplo,valor : integer): boolean; 
	begin
		esMultiplo:= (( valor mod multiplo) = 0 ) ; 
	end; 
	
	function cantMultiplos (pI : listaEnteros ; multiplo : integer): integer; 
	var
		cant : integer; 
	begin
		cant:= 0 ; 
		while (pI <> nil) do 
			begin
					
					if (esMultiplo(multiplo,pI^.elemento)) then {pregunto si es multiplo}
						cant:= cant + 1;  
						
						pI:= pI^.siguiente; 					{avanzo al sig nodo}
			end;
		cantMultiplos:= cant; 
	end;
	
	{ programa principal }
	
	var 
		pI,pU : listaEnteros; 
		multiplo : integer; 
	begin
		crearLista(pI); 
		cargarLista(pI,pU); 
		imprimirLista(pI); 
		writeln ('El numero maximo en la lista es: ',numeroMaximo(pI)); 
		writeln ('El numero minimo en la lista es: ',numeroMinimo(pI)); 
		
		write ('Ingrese un numero para buscar multiplos: '); readln (multiplo); 
		writeln ('La cantidad de multiplos de ',multiplo, ' son: ',cantMultiplos(pI,multiplo)); 
	end. 
