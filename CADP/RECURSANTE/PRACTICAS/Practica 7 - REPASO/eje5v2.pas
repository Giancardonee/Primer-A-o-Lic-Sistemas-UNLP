{
5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
* 
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.
*  De cada viaje se lee: 
- código de viaje
 -código del camión que lo realizó (1..100)
- distancia en kilómetros recorrida
-ciudad de destino
-año en que se realizó el viaje 
- DNI del chofer. 

 
* La lectura finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:

1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.

2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).

3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten. }

program eje5; 
const 
	cantFlotas = 100;
type 
		str20 = string[20]; 
		rCamion = 1..cantFlotas;
		
		flota = record
				patente : str20; 
				anhoFabricacion : integer; 
				capacidad : real; 
		end;
		
		vFlotas = array [1..cantFlotas] of flota; 
		vKilometros = array [1..cantFlotas] of real;
		
		viaje = record
			codViaje : integer;
			codCamion : rCamion; 
			distanciaKm : real; 
			ciuDestino : str20;
			anhoViaje : integer;
			dniChofer : integer; 
		end; 
		
		listaViajes = ^nodo; 
		nodo = record
				elemento : viaje;
				siguiente : listaViajes; 
		end;
		
		
		//-----------------------------------------------------------------------------------------------------------------------------------	
		//-----------------------------------------------------------------------------------------------------------------------------------	
		
		procedure crearLista (var pI : listaViajes); 
		begin
			pI:= nil; 
		end; 
		
		procedure LeerViaje ( var v : viaje); 
		begin
		write ('ingrese el codigo de viaje: '); readln (v.codViaje); 
		if (v.codViaje<> -1) then 
			begin
				write ('Ingrese el dni del chofer: '); readln (v.dniChofer); 
				write ('Ingrese el codigo del camion: '); readln (v.codCamion); 
				write ('Ingrese la distancia recorrida en km'); readln (v.distanciaKm); 
				write ('Ingrese la ciudad de destino: '); readln (v.ciuDestino); 
				write ('Ingrese el anho en que se realizo el viaje: '); readln (v.anhoViaje); 
			end; 
		end; 
		
		procedure insertarOrdenado (var pI : listaViajes; dato : viaje); 
		var
			anterior,actual,nuevo :  listaViajes ; 
		begin
			new(nuevo); 
			nuevo^.elemento:= dato;
			actual:= pI; 
			anterior:= pi; 
			while (( actual <> nil) and (dato.codCamion > actual^.elemento.codCamion) ) do 
				begin
						anterior:= actual;
						actual:= actual^.siguiente;
				end;
				if ( actual = anterior) then { es porque hay que insertar en el primer elemento}
					pI:= nuevo
				else
					anterior^.siguiente:= nuevo; 
				nuevo^.siguiente:=actual; 
		end;  
		
		procedure cargarLista (var pI : listaViajes); 
		var
			v : viaje;
		begin
				LeerViaje(v); 
				while (v.codViaje <> -1) do
				begin
					insertarOrdenado(pI,v); 
					LeerViaje(v); 
				end;
		end;
		//-----------------------------------------------------------------------------------------------------------------------------------
		//-----------------------------------------------------------------------------------------------------------------------------------		
		
		{ 1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee. }
		procedure calcularMax (patente : str20; kmTotales : real; var max : real; var patenteMax : str20); 
		begin
				if ( kmTotales > max ) then 
					begin
						max:= kmTotales;
						patenteMax:= patente
					end;
		end;
		
		procedure calcularMin (patente : str20; kmTotales : real; var min: real; var patenteMin : str20); 
		begin
			if ( kmTotales < min ) then 
				begin
					min:= kmTotales;
					patenteMin:= patente
				end;
		end;
		
		procedure calcularMaxMin (vK : vKilometros; vF : vFlotas ; var patenteMin,patenteMax : str20 ); 
		var
			i : integer;
			max,min : real;
		begin
			max:= -1;
			min:= 9999;
				for i:= 1 to cantFlotas do 
					begin
						calcularMin(vF[i].patente, vK[i], min, patenteMin); 
						calcularMax(vF[i].patente, vK[i],max,patenteMax); 
					end; 
		end;
		
		//-----------------------------------------------------------------------------------------------------------------------------------	
		//-----------------------------------------------------------------------------------------------------------------------------------	
		
		{ 2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y
		* que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje). }
		function cumpleCapacidad ( capacidad : real): boolean;
		begin
			cumpleCapacidad:= ( capacidad > 30.5 ); 
		end; 
		
		function cumpleAntiguedad ( anhoFabricacion : integer; anhoViaje : integer ): boolean; 
		begin
			cumpleAntiguedad:=  ( (anhoFabricacion - anhoViaje) > 5); 
		end;
		
		//-----------------------------------------------------------------------------------------------------------------------------------	
		//-----------------------------------------------------------------------------------------------------------------------------------	
		
		{ 3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares. 
		* Nota: Los códigos de viaje no se repiten. } 
		function cumpleDni ( dni : integer): boolean;
		var
			dig : integer;
			ok : boolean;
		begin
				ok:= True;
				while ( (dni <> 0) and (ok) )  do
					begin
						dig:= dni mod 10;
						
						if ((dig mod 2 ) = 0) then 
							ok:= False; 
						
						dni:= dni div 10;
					end;
			cumpleDni:= ok;
		end; 
		
		//-----------------------------------------------------------------------------------------------------------------------------------	
		//-----------------------------------------------------------------------------------------------------------------------------------			
		
		procedure inicializarVkm ( var v : vKilometros); 
		var
			i : integer;
		begin
			for i:= 1 to cantFlotas do 
				v[i]:= 0;
		end;
		
		//-----------------------------------------------------------------------------------------------------------------------------------	
		//-----------------------------------------------------------------------------------------------------------------------------------	
		procedure procesarLista (pI : listaViajes ; var vK : vKilometros; vF : vFlotas); 
		var
			patenteMax,patenteMin : str20;
			cantCumple: integer;
			
		begin
			patenteMax:= ' ' ; patenteMin:= ' '; 
			cantCumple:= 0;
				while (pI <> nil) do 
					begin
							{para calcular inciso 1}
							{ incremento los kilometros recorridos de cada camion }
							vK[pI^.elemento.codCamion]:= vK[pI^.elemento.codCamion] + pI^.elemento.distanciaKm; 
							
							{ inciso 2 }
							
							{ esto lo hago con dos if porque sino se hace re largo jsajda}
								if ( cumpleCapacidad  (vF[pI^.elemento.codCamion].capacidad)) then 
								begin
										if cumpleAntiguedad(vF[pI^.elemento.codCamion].anhoFabricacion, pI^.elemento.anhoViaje) then 
										cantCumple:= cantCumple + 1;
								end; 
									
									
									
								 if ( cumpleDni(pI^.elemento.dniChofer)) then 
									writeln ('El dni ',pI^.elemento.dniChofer, ' tiene todos digitos impares. Su codigo de viaje es: ',pI^.elemento.codViaje ); 
								
							pI:= pI^.siguiente;
					end;
					writeln ('La cant de viajes en camiones con capacidad mayor a 30.5 toneladas, y 5 anhos de antiguedad son:  ',cantCumple); 
					calcularMaxMin (vK,vF,patenteMin,patenteMax); 
				
					writeln ('La patente del camion que mas km recorrio es: ',patenteMax);
					writeln ('La patente del camion que menos km recorrio es: ',patenteMin);
		end;
		
		{ programa principal }
		var 
		L : listaViajes;
		vF : vFlotas;
		vKm  : vKilometros;
		begin
		cargarFlotas(vF); // se dispone  
		cargarLista(L); 
		inicializarVkm(vKm); 
		procesarLista(L,vKm,vF); 
		end.
		
 
