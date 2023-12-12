{
10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. 
De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). 
Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.

a. Realizar un programa que lea la información de las empresas y sus cultivos. 
Dicha información se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). 
Para cada empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).

 Una vezleída y almacenada la información, calcular e informar:

b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.

c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.

d. La empresa que dedica más tiempo al cultivo de maíz

e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales
}

	program eje10;
		const 
			dimFCultivos = 20; 
		type
			rangoCultivos = 1..dimFCultivos; 
			str20 = string[20]; 
			
			cultivos = record
				tipoCultivo : str20;
				cantHectareas : real;
				cantMeses : integer;
			end;
			
			vCultivo = array [1..dimFCultivos] of cultivos; 
			
			empresa = record
				codigo : integer;
				nombre : str20;
				estatal_privada : str20 ; 
				ciudadRadicada : str20; 
				cultivo : vCultivo; 
				dimL : rangoCultivos; 
			end;
			
			listaEmpresa = ^nodo;
			nodo = record
					elemento : empresa;
					siguiente : listaEmpresa;  
			end;
			
			procedure inicializarListaE (var L : listaEmpresa);
			begin
				L:= nil;
			end;
			
			procedure LeerCultivo (var c : cultivos); 
			begin
					write ('ingrese la cantidad de hectareas: '); readln (c.cantHectareas); 
						if (c.cantHectareas <>0) then 
							begin
								write ('Ingrese el tipo de cultivo: '); readln (c.tipoCultivo);
								write ('Ingrese la cantidad de meses: '); readln (c.cantMeses); 	
							end;
			end;
			
			procedure cargarCultivos (var e : empresa); 
			var
				c : cultivos;
				dim : integer;
			begin
				dim := 0;
				LeerCultivo(c); 
				while ( (dim < dimFCultivos) and (c.cantHectareas <>0) ) do 
					begin
						dim:= dim + 1;
						e.cultivo[dim]:= c; 
						LeerCultivo(c); 
					end;
					e.dimL:= dim; 
			end;
			
			
			procedure LeerEmpresa (var e : empresa); 
			begin
				write ('Ingrese el codigo de empresa: '); readln (e.codigo); 
					if (e.codigo <> -1) then 
						begin
							write ('ingrese el nombre de la empresa: '); readln (e.nombre);
							 write ('Ingrese si es estatal o privada: '); readln (e.estatal_privada); 
							 write ('Ingrese el nombre de la ciudad donde esta radicada: '); readln (e.ciudadRadicada); 
								cargarCultivos(e); 
						end;
			end;

			procedure agregarAlFinal (var pI,pU : listaEmpresa ; dato : empresa); 
			var
					nuevo : listaEmpresa;  
			begin
				new(nuevo);
				nuevo^.elemento:= dato;
					if ( pI = nil ) then
						pI:= nuevo
					else
						pU^.siguiente:= nuevo;
					
					pU:= nuevo;
			end;

			procedure cargarListaEmpresa (var pI : listaEmpresa); 
			var
				e : empresa; 
				pU : listaEmpresa;
			begin
					LeerEmpresa(e); 
					while (e.codigo <> -1) do 
						begin
							agregarAlFinal(pI,pU,e);
							writeln ; // salto de linea
							LeerEmpresa(e); 
						end;
			end;
			
			
			
			{preguntar si hace falta hacer los  3 modulos. 
			 o solo hacer una sola funcion =    if (cumpleCondicion(parametros)) then   }
			
			function radicaEnSanMiguelDelMonte (ciudadRadica : str20): boolean;
			begin
					radicaEnSanMiguelDelMonte:= (ciudadRadica = 'San Miguel del Monte '); 
			end;
			
			function cumpleCodEmpresa (codigo : integer): boolean; 
			var
				dig,cant0 : integer;
				cumple : boolean;
			begin
					cant0:= 0;
					cumple:= False;
						while ( (codigo <> 0 ) and (cumple = false) )do
							begin
								dig:= codigo mod 10;
								
									if ( dig = 0 ) then 
										cant0:= cant0 + 1;
							
								codigo:= codigo div 10;
								
									if ( cant0 = 2 ) then 
										cumple:= True
							end;
					cumpleCodEmpresa:= cumple; 
			end;
			
			function cultivaTrigo ( tipoCultivo : str20) : boolean; 
			begin
				cultivaTrigo:= (tipoCultivo = 'trigo' );
			end; 
			
			function esSoja ( tipo : str20 ): boolean;
			begin
					esSoja:=  ( tipo = 'soja'); 
			end; 
			 
			procedure calcularHa(var haSoja, haTotal : real; v : vCultivo; pos : integer); 
			begin
			
								if (esSoja(v[pos].tipoCultivo) ) then
										haSoja:= haSoja + v[pos].cantHectareas;
										
									haTotal:= haTotal + v[pos].cantHectareas;
					
			end; 
			
			function esMaiz (tipoCultivo : str20): boolean; 
			begin
				esMaiz:= ( tipoCultivo = 'maiz' ); 
			end; 
			
			{ La empresa que dedica más tiempo al cultivo de maíz }
			procedure empresaMasTiempoMaiz ( nombreEmpresa : str20; tiempo : integer ; var empresaMax : str20; var tiempoMax: integer); 
			begin
				if ( tiempo > tiempoMax) then 
					begin
						tiempoMax:= tiempo;
						empresaMax:= nombreEmpresa; 
					end; 
			end; 
			
				{ e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
						hectáreas de todas las empresas que no son estatales }
			function cumpleIncisoE (tipoCultivo : str20; cantHa : real; tipoEmpresa : str20): boolean; 
			begin
				cumpleIncisoE:= ( (tipoCultivo = 'girasol') and (cantHa <5)  and (tipoEmpresa = 'no estatal')); 
			end;   	
			
			procedure incrementarUnMes (var tiempoCultivo : integer); 
			begin
					tiempoCultivo:= tiempoCultivo + 1;
			end; 
			
			procedure recorrerVectorCultivos ( e : empresa; var cumpleIncisoB : boolean; var cantHaSoja, cantHaTotales : real; var tiempoTotalMaiz : integer );
			var
				pos : rangoCultivos; 
			begin
				cumpleIncisoB:= False; 
				tiempoTotalMaiz:=0;
					for pos:= 1 to e.dimL do { recorro el vector de cultivos de la empresa recibida por parametro. }
						begin
								{b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo 
								* y cuyo código de empresa posee al menos dos ceros. }
								
								if ( cumpleIncisoB = False ) then  { solo chequeo si todavia no cumple con el incisoB}
										if (radicaEnSanMiguelDelMonte(e.ciudadRadicada) and ( cumpleCodEmpresa(e.codigo))  and (cultivaTrigo(e.cultivo[pos].tipoCultivo)) ) then 
											cumpleIncisoB:= True; 
											
								{ sumo cant de hectareas , para despues calcular el inciso c}
								calcularHa(cantHaSoja,cantHaTotales,e.cultivo,pos); 
						
									if ( cumpleIncisoE(e.cultivo[pos].tipoCultivo,e.cultivo[pos].cantHectareas, e.estatal_privada)) then 
										incrementarUnMes(e.cultivo[pos].cantMeses) ; 
										
										
								{ saco el tiempo que dedica la empresa al cultivo de maiz,
								*  para luego saber la empresa que le dedica mas tiempo }
								if (esMaiz (e.cultivo[pos].tipoCultivo))  then 
										tiempoTotalMaiz:= tiempoTotalMaiz + e.cultivo[pos].cantMeses; 	
								
						end; 
			end; 
						
			procedure procesarLista (L : listaEmpresa); 
			var
					porcentaje,cantHaSoja, cantHaTotales : real;
					empresaMax: str20; 
					tiempoTotalMaiz, tiempoMax : integer; 
					cumpleIncisoB: boolean; 
			begin
				cantHaSoja:=0;
				cantHaTotales:=0; 
				empresaMax:= ' ' ;
				tiempoMax := -1; 
				while ( L <> nil ) do 
					begin
					
						recorrerVectorCultivos (L^.elemento, cumpleIncisoB,cantHaSoja,cantHaTotales,tiempoTotalMaiz); 
							
						{ b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de empresa posee al menos dos ceros.}
								if (cumpleIncisoB) then 
							writeln ('---> La empresa ',L^.elemento.nombre, ' radica en San Miguel del Monte, tiene al menos dos digitos 0 en su codigo de empresa, y cultiva Trigo.' ); 					
					
								{ calculo la empresa que le dedica mas tiempo al cultivo de maiz }
								empresaMasTiempoMaiz(L^.elemento.nombre,tiempoTotalMaiz,empresaMax,tiempoMax); 
					
						L:= L^.siguiente; 	
					end; 
				porcentaje:= ( (cantHaSoja / cantHaTotales) * 100 ); 
				writeln ('La cantidad de hectareas dedicadas al cultivo de soja son: ',cantHaSoja);
				writeln ('Y el porcentaje de hectareas de soja,respecto al total de hectareas es: %',porcentaje:2:2); 
				writeln ('La empresa que le dedica mas tiempo al cultivo de maiz es la empresa: ',empresaMax); 
			end;
			
			{ programa principal }
			var
				ListaE : listaEmpresa;
			begin
				inicializarListaE(ListaE); 
				cargarListaEmpresa(ListaE); 
				
				//imprimirLista(ListaE); 
				
				procesarLista(ListaE); 
				
			end.



			{para verificar que cargue todo bien
			procedure imprimirLista ( L : listaEmpresa); 
			var
				pos : integer;
			begin	
					
					while ( L <> nil ) do 
						begin
							writeln ('El codigo de la empresa es: ',L^.elemento.codigo); 
							writeln ('El nombre de la empresa es: ',L^.elemento.nombre); 
							writeln ('Es estada o estatal: ',L^.elemento.estatal_privada); 
							writeln ('La ciudad donde esta radicada es: ',L^.elemento.ciudadRadicada); 
							pos:= 0;
							writeln ('Sus cultivos son: ');
								while ( pos < L^.elemento.dimL)  do 
									begin
											pos:= pos + 1;
											writeln ('Su cultivo es: ',L^.elemento.cultivo[pos].tipoCultivo); 
											writeln ('La cantidad de hectareas son: ',L^.elemento.cultivo[pos].cantHectareas:2:2); 
											writeln ('La cantidad de meses que lleva el ciclo del cultivo son: ',L^.elemento.cultivo[pos].cantMeses); 
											writeln('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - '); 
									end;
									
									L:= L^.siguiente;
						end;
			end;}
