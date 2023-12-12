{
12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados.
*  De cada dispositivo se conoce: 
*  la versión de Android instalada, 
* el tamaño de la pantalla (en pulgadas)
*  y la cantidad de memoria RAM que posee (medida en GB).

La información disponible se encuentra ordenada por versión de Android. 
* Realizar un programa que procese la información disponible de todos los dispositivos e informe:

a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.
}

{ en este programa, como la informacion se dispone
no tenemos que implementar los modulos de carga (LO HICE PARA PROBAR EL PROG)}

{lo unico que hay que hacer es declarar la estructura para almacenar la informacion.
, e invocar al modulo en el programa principal, con los parametros}

program eje12; 
type

	dispositivo = record
			version : real; {version 12.01 ,etc}
			pulgadas : real; {8.2 pulgadas, etc}
			ram : integer; {4,8,16,32,etc gb ram}
	end; 
	
	listaDispositivos = ^nodo; 
	nodo = record
			elemento : dispositivo; 
			siguiente : listaDispositivos; 
	end; 
//-------------------------------------------------------------------------	
{esto lo hago para guardar las versiones y la cant}
	versiones = record
			version : real; 
			cant : integer;  
	end; 
	
	listaVersiones = ^nodo2;
	nodo2 = record
			elemento : versiones; 
			siguiente : listaVersiones;
	end; 	
//-------------------------------------------------------------------------	
//-------------------------------------------------------------------------	
{se dispone pero lo hago para probar el programa}	
{tener en cuenta que la info se encuentra ordenada por version}
	procedure LeerDispositivo (var d : dispositivo); 
	begin
		write ('Ingrese la version: '); readln (d.version); 
				if	(d.version <> 0) then { como condicion de fin} 
				begin
						write ('Ingrese las pulgadas del dispositivo: '); readln(d.pulgadas); 
						write ('Ingrese la cantidad de RAM del dispositivo: '); readln (d.ram); 
						writeln; 
				end; 
	end; 	
	
	procedure agregarAlFinal (var pI,pU : listaDispositivos; d : dispositivo); 
	var
		nuevo : listaDispositivos; 
	begin
		new (nuevo); 
		nuevo^.elemento:= d; 
		nuevo^.siguiente:= nil; 
		if (pI = nil) then {es porque la lista esta vacia}
			begin
				pI:= nuevo;
				pU:= nuevo;
			end
		else
			begin
				pU^.siguiente:= nuevo;
				pU:= nuevo; 
			end; 
	end; 

	procedure crearLista (var pI : listaDispositivos); 
	begin
		pI:= nil; 
	end; 

	procedure cargarLista(var pI,pU : listaDispositivos); 
	var
		d : dispositivo; 
	begin
		LeerDispositivo(d); 
		while (d.version <>0) do 
			begin
				agregarAlFinal(pI,pU,d); 
				LeerDispositivo(d); 
			end;
	end; 
	{los modulos anteriores se disponen, pero son necesarios para probar el programa
	* y saber si anda o no jeje. }
//-----------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------
	{b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.}
	function cumpleRequisitos (d : dispositivo): boolean; 
	begin
		cumpleRequisitos:= ( (d.ram >3 ) and ( d.pulgadas < 5 ) );  
	end; 
	{c. El tamaño promedio de las pantallas de todos los dispositivos.}
	function promedioPantallas (sumaPulgadas : real; cantDispositivos: integer): real;
	begin
		promedioPantallas:= (sumaPulgadas / cantDispositivos) ;
	end; 
	
	procedure agregarAdelante (var Lversiones : listaVersiones; version : real; cant: integer); 
	var
		nuevo : listaVersiones; 
	begin
		new (nuevo); 
		nuevo^.elemento.version:= version ; 
		nuevo^.elemento.cant:= cant; 
		nuevo^.siguiente:= nil; 
		if ( Lversiones = nil) then 
			Lversiones:= nuevo
		else
			begin
				nuevo^.siguiente:= Lversiones; 
				Lversiones:= nuevo; 
			end; 
	end; 
	
	procedure recorrerListaDispositivos (pI : listaDispositivos; var Lversiones : listaVersiones); 
	var
		cantCumple,cantDispositivos : integer; 
		sumaPantallas,versionActual: real; 
		cantVersion : integer;
	begin
		cantCumple:= 0; 
		cantDispositivos:= 0; 
		sumaPantallas:= 0; 
		while (pI <> nil) do 
			begin
			cantVersion:= 0; 
			versionActual:= pI^.elemento.version; 
				while ( (pI <> nil) and (pI^.elemento.version = versionActual) ) do 
					begin
						cantDispositivos:= cantDispositivos + 1; 
						sumaPantallas:= sumaPantallas + pI^.elemento.pulgadas; 
						cantVersion:= cantVersion +1; 
						
							if (cumpleRequisitos(pI^.elemento)) then
								cantCumple:= cantCumple + 1; 
						
							pI:= pI^.siguiente; 
					end; 
					{agrego a la lista, la version y la cantidad}
					agregarAdelante(Lversiones,versionActual,cantVersion); 
			end; 
		writeln ('Los dispositivos con mas de 3GB de RAM y pantalla de a lo sumo 5 pulgadas son: ',cantCumple);
		writeln ('El tamanho promedio de pantalla es: ',promedioPantallas(sumaPantallas,cantDispositivos):2:2);  
		writeln; 
	end; 
	
	procedure informarLversiones (pI : listaVersiones); 
	begin
		while (pI <> nil) do 
			begin
					writeln; 
					writeln ('La version ',pI^.elemento.version:2:2, ' tiene ',pI^.elemento.cant, ' elementos leidos.' ); 
				pI:= pI^.siguiente; 
			
			end; 
	end; 
	{ programa principal }
	var
		pI,pU : listaDispositivos; 
		Lversiones : listaVersiones;
	begin
		crearLista(pI); 
		cargarLista(pI,pU); // se dispone 
		recorrerListaDispositivos(pI,Lversiones); 
		informarLversiones(Lversiones); 
	end.
