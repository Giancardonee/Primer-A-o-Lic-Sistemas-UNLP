
{ 
7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:

- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas
		esto se podria escribir como: 
		* 
			if (( costoMantenimiento < costoConstruccion) and (pI^.elemento.codigo <> 1) )  then 
					




A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.



b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.


c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.
}

program ejeSiete; 
const
	cantEspectros = 7;
type
	rangoEspectros = 1..7; 
	str25 = string[25]; 
	sondas = record
			nombre : str25; 
			duracion: integer;  { cantidad de meses que permanecerá activa }
			costoConstruccion : real; 
			costoMantenimiento : real; 
			espectro : rangoEspectros;   
	end;
	
	listaSondas = ^nodo; 
	nodo = record
			elemento : sondas;
			siguiente : listaSondas;
	end;

//-----------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------
	
	procedure crearListas(var L1,L2,L3 : listaSondas); 
	begin 
			L1:= nil; 
			L2:= nil;
			L3:= nil;
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

	procedure agregarAdelante (var pI : listaSondas; sonda : sondas);
	var
		nuevo : listaSondas;
	begin
			new(nuevo); nuevo^.elemento:= sonda; nuevo^.siguiente:= nil; 
			if ( pI = nil) then 
				pI:= nuevo
			Else
				begin
					nuevo^.siguiente:= pI;
					pI:= nuevo;
				end;
			
		
	end;

	procedure cargarLista (var pI : listaSondas); 
	var
		sonda: sondas;
	begin
		repeat	
				LeerSonda(sonda); 
				agregarAdelante(pI,sonda); 
		until (sonda.nombre = 'GAIA'); 
	end;
//-----------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------
{ 
* - sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas

el proyecto espacial con ondas de radio corresponde al numero 1. 

a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
* }
	function cumpleCondicionFinanciar (s : sondas): boolean;
	begin
		cumpleCondicionFinanciar:=  (( s.costoMantenimiento < s.costoConstruccion) and (s.espectro <> 1) ) ;
	end;
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	{ b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
 }
	procedure recorrerListaSondas (pI : listaSondas; var L2,L3 : listaSondas); 
	begin
		while (pI <> nil) do 
			begin
					if (cumpleCondicionFinanciar(pI^.elemento)) then 
						agregarAdelante(L2,pI^.elemento)
					else
						agregarAdelante(L3,pI^.elemento); 
				
					pI:= pI^.siguiente; 
			end;
	end;
	//-----------------------------------------------------------------------------------------------------------------------------------------------
{ c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b. }
	procedure recorrerListaNoCumplen (L3 : listaSondas); 
	var
		cant: integer;
		costoTotal,costoConstruccion,costoMantenimiento : real;
	begin
			cant:= 0; 
			costoConstruccion:= 0; costoMantenimiento:= 0; 
				while (L3 <> nil) do 
					begin
							cant:= cant + 1 ;
							costoConstruccion:= costoConstruccion + L3^.elemento.costoConstruccion;
							costoMantenimiento:= costoMantenimiento  + L3^.elemento.costoMantenimiento; 
						
							L3:= L3^.siguiente;
					end;
					costoTotal:= (costoConstruccion + costoMantenimiento); 
				writeln ('La cantidad de proyectos que no seran financiados son: ',cant); 
				writeln (costoTotal:2:2, ' es el costo total que no sera fincanciado por no cumplir las condiciones.'); 
	end;

	{esto no lo pide pero lo hago para ver que la lista de cumplen se haya cargado correctamente :) }
	procedure imprimirListaCumplen (pI : listaSondas); 
	begin
		writeln; 
		writeln ('Los proyectos que cumplen con la condicion de ser financiados son: '); 
		while (pI <> nil) do 
			begin
				write (pI^.elemento.nombre, ' ' ); 
				
				pI:= pI^.siguiente;
			end; 
	end;
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------

{ programa principal }
var
	L_sondas,ListaCumplen,ListaNoCumplen: listaSondas; 
	
begin
	crearListas(L_sondas,ListaCumplen,ListaNoCumplen);
	cargarLista(L_sondas); 
	recorrerListaSondas(L_sondas,ListaCumplen,ListaNoCumplen);
	recorrerListaNoCumplen(ListaNoCumplen); 

	imprimirListaCumplen(ListaCumplen); 
end.
