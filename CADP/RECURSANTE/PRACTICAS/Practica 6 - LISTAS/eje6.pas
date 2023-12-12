{ 
6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década.
*  De cada sonda se conoce su: 
*  nombre,
*  duración estimada de la misión (cantidad de meses que permanecerá activa), 
* el costo de construcción, 
* el costo de mantenimiento mensual
*  y rango del espectro electromagnético sobre el que realizará estudios.
*  Dicho rango se divide en 7 categorías:
		1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma

Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}
program eje6 ;
const 
		cantEspectros = 7; 
type
	rangoEspectro = 1..cantEspectros; 
	str25  = string[25]; 
	sondas = record
			nombre : str25; 
			duracion: integer;  { cantidad de meses que permanecerá activa }
			costoConstruccion : real; 
			costoMantenimiento : real; 
			espectro : rangoEspectro;   
	end; 
	
	listaSondas = ^nodo; 
	nodo = record
			elemento: sondas; 
			siguiente: listaSondas; 
	end; 
	
	{aca voy a almacenar la cantidad de sondas de cada rango}
	vContador = array [1..cantEspectros] of integer; 
	
	
	//----------------------------------------------------------------------------------------------------
	{ inicializo mi vector contador todo en 0 }
	procedure inicializar_vContador (var v : vContador); 
	var
			i : integer ;
	begin
			for i:= 1 to cantEspectros do 
				v[i]:= 0 ; 
	end; 
	//---------------------------------------------------------------------------------------------------------
	{ modulos para poder almacenar datos de sondas en una lista }
	procedure crearLista (var pI : listaSondas); 
	begin
			pI:= nil; 
	end; 
	
	procedure LeerSonda (var s : sondas); 
	begin
		write ('Ingrese el nombre: '); readln (s.nombre); 
		write ('Ingrese la duracion en meses: '); readln (s.duracion); 
		write ('Ingrese el costo de la contruccion: '); readln (s.costoConstruccion); 
		write ('Ingrese el costo de mantenimiento: '); readln (s.costoMantenimiento); 
		writeln  ('Ingrese el tipo de espectro en numero: '); 
		write ('1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma: '); readln (s.espectro); 
		writeln ; 
	end; 

	procedure agregarAlFinal (var pI,pU : listaSondas; sonda : sondas); 
	var
		nuevo : listaSondas; 
	begin
		new (nuevo); nuevo^.elemento:= sonda; nuevo^.siguiente:= nil; 
		if (pI = nil) then 
			begin
				pI := nuevo; 
				pU:= nuevo; 
			end
		else
			begin
				pU^.siguiente:= nuevo; 
				pU:= nuevo; 
			end; 
	end; 
	
	
	{nose si estaria bien implementado que devuelva esto en el proceso de cargarLista, pero como
	* debo recorrer la lista, la menor cantidad de veces, asumo que si}
	
	{ c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas. }
	function calcularPromedioSondas (cantSondas,duracionSondas : integer) : real; 
	begin
		calcularPromedioSondas:=(duracionSondas / cantSondas); 
	end; 
	
	function calcularCostoPromedio (costoConstruccion : real; cantSondas : integer): real;
	begin
		calcularCostoPromedio:= (costoConstruccion / cantSondas); 
	end; 
	
	procedure cargarLista (var pI,pU : listaSondas; var promDuracionSondas,costoPromedio : real); 
	var
			s : sondas; 
			cantSondas,duracionSondas : integer; 
			costoConstruccion : real; 
	begin
		cantSondas:= 0; 
		duracionSondas:=0; 
		costoConstruccion:= 0; 
			repeat 
			LeerSonda(s); 
			cantSondas:= cantSondas + 1; 
			duracionSondas:= duracionSondas + s.duracion; 
			costoConstruccion:= costoConstruccion + s.costoConstruccion; 
			agregarAlFinal(pI,pU,s); 
		until (s.nombre = 'GAIA'); 
		promDuracionSondas:= calcularPromedioSondas(cantSondas,duracionSondas); 
		costoPromedio:= calcularCostoPromedio(costoConstruccion,cantSondas); 
	end; 
	//------------------------------------------------------------------------------------------------------
	{ a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento). }
	{esto tranquilamente lo puedo hacer mientras recorro la lista. }
	procedure calcularSondaMax (s : sondas; var nombreMax : str25; var costo_cMax, costo_mMax : real); 
	begin
		if ( ( s.costoConstruccion > costo_cMax) and (s.costoMantenimiento > costo_mMax) ) then
			begin
					nombreMax:= s.nombre; 
					costo_cMax:= s.costoConstruccion; 
					costo_mMax:= s.costoMantenimiento; 
			end; 
	end; 
	
	function superaCostoPromedio (costoPromedio,costoConstruccion : real): boolean; 
	begin
		superaCostoPromedio:= (costoConstruccion > costoPromedio); 
	end; 
	
	//-----------------------------------------------------------------------------------------------------
	{b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.}
	
	procedure recorrerLista (pI : listaSondas; var v : vContador; promDuracionSondas,costoPromedio : real); 
	var
		nombreMax : str25;
		costo_cMax,costo_mMax : real; 
		codigo : rangoEspectro; 
		
		cantSuperan : integer;
	begin
			cantSuperan:= 0; 
			while (pI <> nil) do 
				begin
					
					{a. Calculo el nombre de la sonda mas costosa}
					calcularSondaMax(pI^.elemento,nombreMax,costo_cMax,costo_mMax); 
					
					{b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.}
					{incremento en el vector, el codigo de espectro, luego en otro modulo informo.}
					codigo:= pI^.elemento.espectro; 
					v[codigo]:= v[codigo] + 1;        {le podria pasar tranquilamente pI^.elemento.espectro} 
					
					{ c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas. }
							if (pI^.elemento.duracion > promDuracionSondas) then 
								cantSuperan:= cantSuperan + 1;
					
					{d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.}
					if (superaCostoPromedio(costoPromedio,pI^.elemento.costoConstruccion)) then 
						writeln ('La sonda ',pI^.elemento.nombre, ' supera el costo de construccion promedio'); 
					
					pI:= pI^.siguiente; { avanzo al siguiente nodo de la lista. }
				end;
			writeln ('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas son: ',cantSuperan); 	
			writeln ('El nombre de la sonda mas costosa es: ',nombreMax); 
	end;
	
	//---------------------------------------------------------------------------------
	{ informo punto b}
	{b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.} 
	procedure informarCantRangoEspectro (v : vContador); 
	var
		i : integer; 
	begin
			writeln; 
			for i:= 1 to cantEspectros do
				writeln ('La cantidad de sondas en el rango ',i, ' fueron:' ,v[i] ); 
				
	end; 
	
	
	{programa principal}
	var
		pI,pU : listaSondas; 
		vCont : vContador; 
		promedioDuracionSondas,costoPromedio : real; 
		
	begin

		inicializar_vContador(vCont); 
		crearLista(pI); 
		cargarLista (pI,pU,promedioDuracionSondas,costoPromedio); 
		recorrerLista(pI,vCont,promedioDuracionSOndas,costoPromedio);
		 informarCantRangoEspectro(vCont); 
	end.  
