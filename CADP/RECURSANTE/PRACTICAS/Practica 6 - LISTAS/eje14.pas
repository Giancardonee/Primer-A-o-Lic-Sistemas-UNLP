{
14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por
una muestra de 1300 alumnos durante el mes de marzo.
*  De cada viaje se conoce: 
*  el código de alumno (entre1 y 1300) 
* día del mes
*  Facultad a la que pertenece 
*  medio de transporte (1. colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). 
* 
* Tener en cuenta que un alumno puede utilizar más de un medio de transporte en un mismo día.
* 
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
* 
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte
* } 

{  esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje. 
* puse constantes con precios para probar si andaba bien el programa }

program  vecListas; 
const 
	cantAlumnos = 1300; { cambiar a 1300 }
	cantTransporte =5;
type
	rangoCod = -1..1300; 
	rangoDias = 1..31; 
	str25 = string[25]; 
	rangoTransporte = 1..5; 
	
	viaje = record 
			codAlumno : rangoCod;
			dia : rangoDias; 
			facultad : str25; 
		    transporte : rangoTransporte;
	end; 
	
	listaViaje = ^nodo ; 
	nodo = record
			elemento : viaje; 
			siguiente : listaViaje;
	end; 
	
	vAlumnos = array [1..cantAlumnos] of listaViaje; {vector de lista}
	
	vCont = array [1..cantTransporte] of integer; {almaceno cantidad de usos de cada transporte}
	
	vPrecios = array [1..cantTransporte] of real; { se dispone el precio de cada transporte }
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	procedure inicializarV (var v : vAlumnos); 
	var 
		i : integer;
	begin
		for i := 1 to cantAlumnos do 
			v[i]:= nil; 
	end;
	
	{aca llevo el contador de la cant de usos de cada medio de transporte}
	procedure inicializarVcontador ( var v : vCont); 
	var
		i : integer;
	begin
		for i:= 1 to cantTransporte do 
			v[i]:= 0; 
	end;
	
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	
	procedure LeerViaje (var v : viaje); 
	begin
		write ('Ingrese el codigo de alumno: '); readln (v.codAlumno); 
			if ( v.codAlumno <> -1 ) then 
				begin
					write ('Ingrese el dia: '); readln (v.dia);
					write ('Ingrese la facultad: '); readln (v.facultad);
					write ('Ingrese el transporte (1. colectivo urbano 2. colectivo interurbano 3. tren universitario 4. tren Roca 5. bicicleta):  '); readln (v.transporte); 
					writeln; 
				end;
	end;

{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
{estos modulos los tendria que invocar mientras sea el mismo dia }
	
	{ a. La cantidad de alumnos que realizan más de 6 viajes por día }
	function realizaMas6viajes (viajes : integer): boolean; 
	begin
		realizaMas6viajes:= (viajes > 6);
	end;
	
	{b. La cantidad de alumnos que gastan en transporte más de $80 por día}
	function gastaMas80p (gasta : real): boolean;
	begin
		gastaMas80p:= (gasta > 80); 
	end; 
	
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	{c. Los dos medios de transporte más utilizados.}
	procedure dosTransportesMax (v : vCont; var medioMax1,medioMax2 : rangoTransporte); 
	var
		i : integer;
		max1,max2  :integer ; 
	begin
		max1:= -1 ; max2:= -1; 
			for i:= 1 to cantTransporte do 
				begin
						if (v[i] > max1) then 
							begin
								max2:= max1; 
								max1:= v[i];
								medioMax2:= medioMax1; 
								medioMax1:= i; 
							end
						else 
						if (v[i] > max2) then 
							begin
								max2:= v[i];
								medioMax2:= i;
							end; 	
				end; 
	end; 
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
  { modulos para inciso d}

	function usaBici (medioTransporte : rangoTransporte): boolean;
	begin
			usaBici:= (medioTransporte = 5); 
	end;

	function usaOtroMedio (medioTransporte : integer): boolean;
	begin
			usaOtroMedio:= ( (medioTransporte>=1) and (medioTransporte <5) );
	end;
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	
	procedure insertarOrdenado (var   pI : listaViaje ;  v :  viaje); 
	var
		actual,anterior,nuevo: listaViaje;
	begin
		new (nuevo); 
		nuevo^.elemento:= v; 
		nuevo^.siguiente:= nil; 
		
		actual:= pI;
		anterior:= pI;
	
		while ( ( actual <> nil ) and (v.dia > actual^.elemento.dia ) ) do 
			begin
			anterior:= actual;
			actual:= actual^.siguiente;
			end; 
				if (actual = anterior) then 
						pI:= nuevo
				else
						anterior^.siguiente:= nuevo; 
				
				nuevo^.siguiente:= actual;
	end;

	procedure cargarVector (var v : vAlumnos); 
	var
		viaj : viaje; 
	begin
				LeerViaje(viaj); 
				while (viaj.codAlumno <> -1) do 
						begin
						{importantisimo pasar v[viaje.codAlumno] como posicion del vector}
								{asi inserta el viaje en el alumno que corresponda}
								insertarOrdenado(v[viaj.codAlumno],viaj); 
								LeerViaje(viaj);
						end;
	end;
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
procedure recorrerVector ( v : vAlumnos; vMontos : vPrecios); 
var
			vContador : vCont; 
			actual : listaViaje; 
			diaActual : rangoDias;
			cantViajesDia ,cant6Viajes,cantGasta,pos,cant: integer;
			medioMax1,medioMax2: rangoTransporte;
			precioTotal: real;
			usaBicicleta,usaOtro : boolean; 
begin
	medioMax1:= 1; medioMax2:= 1;
	cant6Viajes:= 0 ; cantGasta:= 0; 
	pos:= 1;
	cant:= 0; {almaceno la cant de alumnos que combinan bicicleta con otro transporte}
	 
	inicializarVcontador(vContador); 
			
			while ( pos <= cantAlumnos ) do {mientras este en los alumnos validos por el vector}
				begin
						actual:= v[pos]; {para iterar sobre la lista del alumno}
						
						usaBicicleta:= False; 
						usaOtro:= False; 

			{recorro la lista del alumno mientras no este vacia, o mientras no se termine}
						while ( actual <> nil)  do   
							begin
							diaActual:= actual^.elemento.dia; 		
							cantViajesDia:= 0;  {por cada dia }
							precioTotal:= 0 ;   {precio que gasta en transporte el alumno actual}
							
							{mientras no termine de procesar la lista del alumno, y mientras sea el mismo dia: }
									while ( (actual <>nil) and (actual^.elemento.dia = diaActual) ) do {mientras no termine de procesar al alumno y sea el mismo dia: }
											begin 
										    	
											{cuento viajes por dia}
													cantViajesDia:= cantViajesDia + 1;
												
											{cuento transporte usado en el vContador}
													vContador[actual^.elemento.transporte]:= vContador[actual^.elemento.transporte] + 1;
											
											{calculo cuanto gasta}			
									{ esto no funciona porque se dispone del precio de cada transporte}
										//precioTotal:= precioTotal + vMontos[v.transporte]; 
								
											{calculo que medio usa}
												if (usaBici(actual^.elemento.transporte)) then 
													usaBicicleta:= True; 
											
												if (usaOtroMedio(actual^.elemento.transporte)) then 
														usaOtro:= True; 
										
											{avanzo al siguiente nodo}
													actual:= actual^.siguiente;
											end;{cuando salga de aca es porque se leyo un dia distinto, o se termino de procesar el alumno}
										
									
									        	{inciso a}
										if (realizaMas6viajes(cantViajesDia)) then 
													cant6Viajes:= cant6Viajes + 1; 
													
										        {inciso b}			
										if (gastaMas80p(precioTotal)) then 
											cantGasta:= cantGasta + 1; 
											
							end;
								{una vez termino de procesar el alumno, me fijo si cumple con los transportes}
										if ( (usaBicicleta) and (usaOtro)) then
												cant:= cant + 1; 
												
						pos:= pos + 1;{ avanzo al siguiente alumno}
				end;
				
				dosTransportesMax(vContador,medioMax1,medioMax2);
				writeln ('Los dos transportes mas usados son: ', medioMax1, ' y ',medioMax2 ); 
				writeln ('La cantidad de alumnos que realizan mas de 6 viajes por dia son: ',cant6Viajes); 
				writeln ('La cantidad de alumnos que gastan mas de 80pesos por dia son: ',cantGasta); {esto informaria basura porque el vector de precios se dispone}
				writeln ('La cantidad de alumnos que combinan bicicleta y otro medio de transporte son: ',cant); 
	end;
	
	{no lo pide en el ejercicio, lo hice para ver que cargue bien los datos en la lista}
	procedure imprimirVector (v : vAlumnos); 
	var
		i : integer; 
		actual : listaViaje; 
		//alumno : viaje; 
	begin
		for i:= 1 to cantAlumnos do 
			begin
				
		actual:= v[i]; { me traigo el inicio de la lista del alumno actual} 
			
			{ en este if lo que hago es que me muestre solo aquellos alumnos que se cargaron en el vector.} 
			if (actual <> nil) then 
					begin
						writeln; // salto de linea 
						writeln ('Viajes del alumno ',i ); 
							while (actual <> nil) do 
								begin					
									writeln ('- - - > En el dia ',actual^.elemento.dia, ' uso el transporte ',actual^.elemento.transporte ); 
									writeln ('- - > Viajo a la facultad de ',actual^.elemento.facultad); 
									actual:= actual^.siguiente; 
								end;  {del del while}
						end; {end del if}
			end; {end del for}		
	end;  {end del procedure}
	
	
	{ programa principal }
	var 
		v : vAlumnos; 
		vMontos : vPrecios;
	begin
		inicializarV(v); 
	//	cargarPreciosTransporte (vMontos); // se dispone 
		cargarVector(v); 
		imprimirVector(v); { no lo pide }
		recorrerVector(v,vMontos); { tira error porque el vector de montos se dispone (no sabemos los precios) }
	end.
	
	
	while (num <> 0) do 
		begin
			{ me traigo el ultimo digito }
			dig:= num mod 10; 

		
		  {}
			num:= num div 10; 
		end;
