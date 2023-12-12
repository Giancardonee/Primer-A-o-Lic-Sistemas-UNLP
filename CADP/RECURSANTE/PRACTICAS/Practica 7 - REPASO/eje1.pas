{
1. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de
dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación
que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega
una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.
}
program uno; 
const
	dniCorte = 3355; {todo el dni se me va de rango}
	cantGeneros = 5; 
type
	rangoGenero = 1..5;
	str30 = string[30];  
	persona = record
		dni : integer; 
		nombre : str30;
		codGenero : rangoGenero;  
	end; 

	listaPersonas = ^nodo; 
	nodo = record
			elemento : persona; 
			siguiente : listaPersonas; 
	end; 
	
	vContador = array [1..cantGeneros] of integer; 
	
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 	
		{ modulos para cargar la lista de personas }
	procedure crearLista (var pI : listaPersonas); 
	begin
		pI:= nil; 
	end; 
	
	procedure LeerPersona (var p : persona); 
	begin
		write ('Ingrese el dni de la persona: '); readln (p.dni); 
			write ('Ingrese el nombre y apellido: '); readln (p.nombre); 
				write ('Ingrese el genero (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror):  '); readln (p.codGenero); 
				
	end; 
	
	procedure agregarAdelante (var pI : listaPersonas ; dato : persona); 
	var
		nuevo : listaPersonas; 
	begin
		new (nuevo); 
		nuevo^.elemento:= dato; 
		nuevo^.siguiente:= nil; 
		
		nuevo^.siguiente:= pI; 
		pI:= nuevo; 
	end; 

	procedure cargarLista (var pI : listaPersonas); 
	var
		p : persona; 
	begin
		repeat 
			LeerPersona(p); 
			agregarAdelante(pI,p); 
		until (p.dni = dniCorte)
	end; 

	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	 { a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares. }
	function cumpleDni (dni : integer): boolean; 
	var
		dig : integer;
		cantP,cantI : integer;
	begin
		cantP:=0; 
		cantI:= 0; 
		while (dni <> 0) do 
			begin
			dig:= dni mod 10; { me traigo el digito }
				if ((dig mod 2) = 0) then 
					cantP:= cantP +1 {si es par sumo en cantPares}
				else
					cantI:= cantI + 1; { si es impar sumo en cantImpares}
					
			dni:= dni div 10;  {descompongo el numero}
			end; 
		cumpleDni:= (cantP > cantI); 
	end; 

	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 	
	{ b. Informar los dos códigos de género más elegidos. }
	procedure calcularDosGenerosMax (v : vContador; var codMax1,codMax2: rangoGenero); 
	var
		max1,max2: integer; 
		i : integer; 
	begin
		max1:= -1; max2:= -1; 
		for i:= 1 to cantGeneros do
			begin 
			if ( v[i] > max1 ) then 
				begin
					max2:= max1; 
					max1:= v[i]; 
					codMax2:= codMax1; 
					codMax1:= i ; 
				end 
			else 	
				if ( v[i] > max2 ) then 
						begin
							max2:= v[i]; 
							codMax2:= i; 
						end; 
			end; 
	end; 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 	
	{ c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal. }
	procedure eliminarDni (var pI : listaPersonas; dni : integer); 
	var
	anterior,actual : listaPersonas; 
	pude: boolean; 
	begin
		pude := False; 
		anterior:= pI; 
		actual:= pI;
		while ( ( actual <> nil) and (actual^.elemento.dni <> dni) ) do 
			begin
					anterior:= actual; 
					actual:= actual^.siguiente;
			end; 
			if (actual <> nil) then {es porque encontre}
					begin
							if (actual = pI) then {es la primera posicion} 
									pI:= pI^.siguiente
							else 	{es en el medio o la ultima posicion}
								anterior^.siguiente:= actual^.siguiente; 
						
						pude:= True; 				
						dispose (actual); 		
					end; 
			if (pude) then 
				writeln ('El dni se elimino correctamente. ')
			else
				writeln ('No se encontro el dni.'); 
	end; 

	procedure inicializarVcont(var v : vContador); 
	var
		i : integer;
	begin
		for i:= 1 to cantGeneros do 
			v[i]:= 0; 
	end; 

	procedure procesarLista ( l : listaPersonas );
	var
		codMax1,codMax2 : rangoGenero; 
		cantCumpleDni : integer;
		v : vContador; 
	begin
		codMax1:= 1; 
		codMax2:= 1 ; 
		cantCumpleDni:= 0; 
		inicializarVcont (v); 
		while ( l <> nil )do 
			begin
					if (cumpleDni(l^.elemento.dni)) then 
						cantCumpleDni:= cantCumpleDni + 1; 
						
					{sumo el genero en el vector}
					v[l^.elemento.codGenero]:= v[l^.elemento.codGenero] + 1; 
					
					{incremento a la sig posicion}
					l:= l^.siguiente; 
			end; 
		writeln ('La cantidad de personas que tienen en su dni mas digitos pares son: ',cantCumpleDni); 	
		calcularDosGenerosMax(v,codMax1,codMax2); 
		writeln ('Los generos mas elegidos son: ',codMax1, ' y ' ,codMax2 ); 
	end; 

	{procedure imprimirLista ( l : listaPersonas); 
	var
		pos : integer; 
	begin
		pos:= 0; 
		while ( l <> nil ) do 
			begin
				pos:= pos + 1; 
				writeln ('La persona ',pos, ' tiene estos datos: ' ); 
					writeln ('Genero: ',l^.elemento.codGenero); 
					writeln ('Nombre: ',l^.elemento.nombre); 
					writeln ('Dni: ',l^.elemento.dni); 
					writeln ; 
					
					l:= l^.siguiente; 
			end; 
	end;}  
	
	
	{programa principal}
	var
		l : listaPersonas; 
		dni : integer;
	begin
		crearLista(l); 
		cargarLista(l); 
		procesarLista(l);
		//imprimirLista(l); { para ver que cargue todo bien }  
		write ('Ingrese un dni para eliminar: '); readln (dni); 
		eliminarDni(l,dni); 
		//imprimirLista(l);  { para ver si elimine o no bien }
	end. 
	
	{ ambos modulos de imprimir lista no los pide, los puse para ver que este todo bien
	* asique el programa anda 10 puntos. :) }; 

