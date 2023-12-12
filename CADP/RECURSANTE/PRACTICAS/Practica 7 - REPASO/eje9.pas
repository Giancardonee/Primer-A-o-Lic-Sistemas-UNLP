{
9.
 Un cine posee la lista de películas que proyectará durante el mes de Febrero.
 De cada película se tiene: código de película, título de la película
 código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) 
 y puntaje promedio otorgado por las críticas. 
 Dicha estructura no posee orden alguno.

Se pide:

a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico,
apellido y nombre del crítico, código de película y el puntaje otorgado.
 La lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por código de película.

DEBO ACTUALIZAR EL PROMEDIO DE LAS CRITICAS DE LA LISTA QUE SE DISPONE

TENDRIA QUE GUARDARME EL TOTAL DE LAS CRITICAS LEIDAS Y LA SUMA DE LAS CRITICAS,
PARA DESPUES SACAR EL PROMEDIO Y ACTUALIZAR EN LA LISTA QUE SE DISPONE

COMO TODO ESTO VIENE ORDENADO POR CODIGO DE PELICULA, LO CALCULO Y ACTUALIZO 
A MEDIDA QUE PROCESE CADA PELICULA

b) Informar el código de género que más puntaje obtuvo entre todas las críticas.

c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.

d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como
parámetro (el mismo puede no existir). 

}
	program eje9; 
	const
		cantGeneros = 8; 
	type
		str20 = string[20]; 
		rangoCodGenero = 1..cantGeneros; 
		
		pelicula = record
			codigo : integer; 
			titulo : str20; 
			codGenero : rangoCodGenero; 
			puntajeCriticas : real;   
		end; 
		
		vContGenero = array [1..cantGeneros] of real; 
		
		listaPeliculas = ^nodo; 
		nodo = record
				elemento : pelicula; 
				siguiente : listaPeliculas; 
		end; 
		
		critico = record 
				dni : integer; 
				nombreCompleto : string[40]; 
				codPelicula : integer; 
				puntajeOtorgado : real; 
		end; 
		
		listaCriticos = ^nodo2; 
		nodo2 = record
				elemento : critico;
				siguiente : listaCriticos; 
		end;
		
		procedure crearListaPeliculas ( var L : listaPeliculas); 
		begin
			L:= nil 
		end; 
		
		procedure crearListaCriticos ( var L : listaCriticos); 
		begin
				L:= nil; 
		end; 
		
		procedure inicializarVcontador ( var v : vContGenero);
		var
			i : integer; 
		begin
				for i:= 1 to cantGeneros do 
					v[i]:= 0 ; 
		end;  
		
		procedure LeerCriticas ( var c : critico); 
		begin
				write ('Ingrese el codigo de pelicula: '); readln (c.codPelicula); 
					if ( c.codPelicula <> -1 ) then 	
						begin
							write ('Ingrese el dni del critico: '); readln (c.dni); 
							write ('Ingrese el nombre completo: '); readln (c.nombreCompleto); 
							write ('Ingrese el puntaje otorgado: '); readln (c.puntajeOtorgado); 
						end; 
		end; 
	
		procedure agregarAlFinal (var pI,pU : listaCriticos; dato : critico); 
		var
			nuevo : listaCriticos; 
		begin
			new (nuevo); 
			nuevo^.elemento:= dato;
				if ( pI = nil ) then 
					pI:= nuevo
				else
					pU^.siguiente:=nuevo; 
				pU:= nuevo; 
		end; 

		function cumpleDigDni( dni : integer ): boolean; 
		var
			cantP, dig,cantI : integer;
		begin
			cantP:= 0; cantI:= 0; 
			while ( dni <> 0 ) do
				begin
					dig:= dni mod 10; 
					
					if ( dig mod 2 = 0 ) then 
						cantP:= cantP + 1
					else
						cantI:= cantI + 1; 
						
				dni:= dni div 10;
				end; 
			cumpleDigDni:= ( cantP = cantI ); 
		end;  
		
		{ esta lista viene ordenada por codigo de pelicula  }
		procedure cargarListaCriticas (var pI: listaCriticos); 
		var
			c : critico;
			pU : listaCriticos;  
		begin
			LeerCriticas(c); 
			while ( c.codPelicula <> -1 ) do 
				begin
					agregarAlFinal(pI,pU,c); 
					LeerCriticas(c); 
				end; 
		end;  
		
		procedure Buscar_Actualizar ( puntaje : real; codPelicula : integer; L : listaPeliculas); 
		begin
			{ avanzo en la lista  mientras no se termine la lista y mientras no encuentre el cod de pelicula }
			while ( (L <> nil ) and (codPelicula <> L^.elemento.codigo) )  do 
				begin
						L:= L^.siguiente; 
				end; 
				
			{esto lo hago por si la pelicula no existe}
			if ( L <> nil ) then { es porque encontro el codigo de pelicula }
				L^.elemento.puntajeCriticas:= puntaje;  
		
		end; 
	
		function encontrarGeneroMasPuntaje ( v : vContGenero): rangoCodGenero; {devuelve codMax} 
		var
			i : integer; { preguntar si es valido usar el subrango de rangoCodGeneros en vez de integer}
			codMax :  rangoCodGenero; 
			max : real;
		begin
			max:= -1; 
				for i:= 1 to cantGeneros do 
					if ( v[i] > max ) then 
						begin 
							max := v[i]  ;  
							codMax:= i;
						end; 
				encontrarGeneroMasPuntaje:= codMax; 		
		end; 
		
		procedure procesarListaCriticas (pI : listaCriticos; ListaP : listaPeliculas); 
		var
			peliculaActual : integer; 
			cantCriticas : integer; 
			puntaje : real;
			v : vContGenero;  
		begin
			inicializarVcontador(v); 
			while ( pI <> nil ) do 
				begin
					cantCriticas:= 0;
					puntaje:= 0;
					peliculaActual:= pI^.elemento.codPelicula; 
					while ( ( pI <> nil ) and ( pI^.elemento.codPelicula = peliculaActual) )  do 
						begin
								
								{ calculo el código de género que más puntaje obtuvo entre todas las críticas.}
								{ lo voy calculando aca, para despues recorrer el vector y sacar el maximo }
								v[pI^.elemento.codPelicula]:= v[pI^.elemento.codPelicula] + pI^.elemento.puntajeOtorgado; 
								
								{ Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que impares en su DNI.}
									if ( cumpleDigDni(pI^.elemento.dni) ) then 
										writeln ('El critico ',pI^.elemento.nombreCompleto, ' tiene en su dni la misma cantidad de digitos pares que impares.' ); 
	
									cantCriticas:= cantCriticas + 1; 
									puntaje:= puntaje + pI^.elemento.puntajeOtorgado; 
												
								pI:= pI^.siguiente; 
						end; 
						
							{ aca calculo el promedio del puntaje de las criticas de la pelicula ( peliculaActual ) }
							puntaje:= ( puntaje / cantCriticas ); 
							Buscar_Actualizar(puntaje,peliculaActual,ListaP);
		
			end; 
					writeln ('El genero con mas puntaje es: ',encontrarGeneroMasPuntaje(v)); 
	end; 
	
	
		procedure eliminarPelicula (var L : listaPeliculas; codigoEliminar : integer; var pude : boolean); 
		var 
			anterior,actual : listaPeliculas; 
		begin
			pude:= False;
				anterior:= L ; 
				actual:= L ; 
				while (( actual <> nil) and (actual^.elemento.codigo <> codigoEliminar) ) do 
					begin
						anterior:= actual; 
						actual:= actual^.siguiente;
					end; 
					if ( actual <> nil ) then 
						begin
							if ( actual = anterior ) then { esta en la primer posicion }
									L:= L^.siguiente
							else
								anterior^.siguiente:= actual^.siguiente; {en el medio o al final }
						
							dispose (actual); { elimino}
							pude:= True; 
						end; 
		end;
	
		procedure incisoD (var L : listaPeliculas); 
		var
			codigoEliminar: integer; 
			pude : boolean; 
		begin
				write ('Ingrese el codigo a eliminar: '); readln (codigoEliminar); 
					eliminarPelicula (L,codigoEliminar,pude); 
						if (pude) then 
							writeln ('La pelicula se elimino correctamente.')
						else
							writeln ('La pelicula no existe, '); 
		end; 
	
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		{ programa principal }
		var 
		ListaP : listaPeliculas;
		ListaC : listaCriticos; 
		begin
			crearListaPeliculas(ListaP); 
			crearListaCriticos(ListaC); 
			
			cargarListaPeliculas (ListaP); // se dispone. 
			cargarListaCriticas(ListaC); 
			
			procesarListaCriticas(ListaC,ListaC); 
			
			IncisoD (ListaP); 
		end. 
		
