{
3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020.
De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y
para un mismo código de auto pueden existir 1 o más viajes. Se pide:
* 
a. Informar los dos códigos de auto que más kilómetros recorrieron.

b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.
}

{ Esta información (listaViajes) se encuentra ordenada por código de auto y
para un mismo código de auto pueden existir 1 o más viajes. 
 tener en cuenta para recorrer y procesar listaViajes que es ordenada por codAuto 
  y un auto puede tener mas de 1 viaje 
*  }

{
Cuando dice se dispone, el crearLista se tiene que hacer igual?? 
}

program tres; 
type 
	str25 = string[25]; 
	viaje = record
			codAuto : integer; 
			dirOrigen : str25; 
			dirDestino : str25; 
			km : real; 
	end; 

	listaViajes = ^nodo;  { lista donde almaceno los viajes totales ( se dispone )}
	nodo = record
		elemento : viaje; 
		siguiente : listaViajes; 
	end; 
	
	listaMas5km = ^nodo2; 
	nodo2 = record
			elemento : viaje; 
			siguiente : listaMas5km; 
	end; 
	
	procedure cargarListaViaje (var pi : listaViajes);  // se dispone
		
	{ a. Informar los dos códigos de auto que más kilómetros recorrieron. }
	procedure calcularAutosMasKm (codAuto : integer; km : real; var max1,max2 : real; var codMax1,codMax2 : integer); 
	begin
			if ( km > max1 ) then 
				begin
					max2:= max1; 
					max1:= km; 
					codMax2:= codMax1; 
					codMax1:= codAuto;
				end
			else
				if ( km > max2 ) then 
					begin
						max2:= km; 
						codMax2:= codAuto;
					end; 
	end; 
	
	{ b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos,
	*  ordenada por número de viaje. }
	procedure insertarOrdenadoViaje (var pI : listaMas5Km; viaj : viaje ); 
	var
		actual,anterior,nuevo : listaMas5Km;
	begin
		new (nuevo); 
		nuevo^.elemento:= viaj; 
		nuevo^.siguiente:= nil; 
	
		actual:= pI ;
		anterior:= pI; 
		while ( (actual <> nil) and (viaj.km > actual^.elemento.km) ) do 
			begin
					anterior:= actual;
					actual:= actual^.siguiente; 
			end;	
		if (anterior = actual) then { es porque debo insertar en la primer pos}
			pI:= nuevo 
		else
			anterior^.siguiente:= nuevo; 
			
		nuevo^.siguiente:= actual; 
	end; 

{ordenada por código de auto y
para un mismo código de auto pueden existir 1 o más viajes. 
 tener en cuenta para recorrer y procesar listaViajes que es ordenada por codAuto 
  y un auto puede tener mas de 1 viaje } 
  
  function esViajeMas5Km (km : real) : boolean; 
  begin
		esViajeMas5Km:= ( km > 5); 
  end; 
   
  procedure recorrerListaViajes (pI : listaViajes; var L : listaMas5Km); 
  var
		auxAuto : integer; 
		kmRecorridos : real; 
		max1,max2: real; 
		codMax1,codMax2 : integer; 
  begin
	max1:= -1; max2:= -1; 
	codMax1:= 0; codMax2:= 0;
	while ( pI <> nil ) do 
		begin
			auxAuto:= pI^.elemento.codAuto; 
			kmRecorridos:=0; 
				while ( (pI <> nil) and (pI^.elemento.codAuto = auxAuto) ) do 
					begin
					{cuento km recorridos del mismo auto, para luego calcular max}
							kmRecorridos:=  kmRecorridos + pI^.elemento.km ; 
							
							{inserto en una nueva lista los viajes de mas de 5Km}
								if (esViajeMas5km(pI^.elemento.km)) then 
									insertarOrdenadoViaje(L,pI^.elemento); 
		
							pI:= pI^.siguiente; 
					end; 
				calcularAutosMasKm(auxAuto,kmRecorridos,max1,max2,codMax1,codMax2); 
		end; 
		writeln ('Los dos codigos de autos con mas km recorridos son: '); 
		writeln ('--> ',codMax1); 
		writeln ('--> ',codMax2); 
  end; 
  
{ programa principal }
var
	 listaViaje : listaViajes; 
	 L_mas5Km : listaMas5Km; 
begin
	listaViaje:= nil;  
	L_mas5Km:= nil; 
	cargarLista(listaViaje);  {se dispone}
	recorrerListaViajes(listaViaje,L_mas5Km); 
end; 
