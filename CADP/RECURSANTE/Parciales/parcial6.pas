{
La facultad de informatica necesita un programa para procesar la informacion de los alumnos de 
la carrera de Licenciatura en Informatica. Para ello dispone de una estructura con la informacion
de todos los alumnos de dicha carrera.
De cada alumno se conoce: nro de legajo, dni, apellido y nombre, año de ingreso,
cantidad de materias aprobadas (0..37), nota obtenidas en las materias aprobadas ( a lo sumo 37 )
	se pide: 

	A) generar una estructura adecuada con nro de legajo y promedio de cada alumno de la carrera.
		en esta estructura solo estaran alumnos que tengal al menos una materia aprobada. 
	
	B) informar el apellido y el nombre de los dos alumnos que ingresaron despues del año 2019 y tienen 
		menor cantidad de materias aprobadas. 
		
	C) informar la cantidad de alumnos con DNI compuesto por a lo sumo tres digitos multiplos de 4
}


{ como la estructura donde almacenamos los alumnos totales, se dispone ( una lista )
debemos recorrerla para procesar y calcular los incisos}
program parcial6; 
const 
	dimFmaterias = 37;
type
	rangoMaterias = 1..dimFmaterias; 
	str30 = string[30]; 
	
	vNotas = array [1..dimFmaterias] of integer;
	
	alumno = record
		nroLegajo : integer;
		dni : integer;
		nombreCompleto : str30; 
		anhoIngreso : integer;
		cantAprobadas : rangoMaterias; 
		notaObtenida : vNotas;
	end; 
	 
	 listaAlumnos = ^nodo; 
	  nodo = record
			elemento : alumno;
			siguiente : listaAlumnos;
	  end; 
	  
	  listaN = record
			nroLegajo : integer;
			prom : real; 
	  end; 
	  
	  nuevaL =  ^nodo2; 
	  nodo2 = record
			elem : listaN;
			sig : nuevaL; 
	  end; 
	  
	 procedure crearLista (var L : nuevaL); 
	 begin
			L:= nil; 
	 end;
	 
	 function aproboUnaMateria ( cantMaterias : integer): boolean; 
	 begin
			aproboUnaMateria:= (cantMaterias >=1 );
	 end; 
	 
	 function sacarPromedioCarrera ( cantMaterias  : integer ;  v : vNotas): real;  
	 var
		i : integer;
		prom : real;  
	 begin
			prom:=0;
			for i:= 1 to cantMaterias do 
				prom:= prom + v[i]; 
			prom:= (prom / cantMaterias); 
		sacarPromedioCarrera:= prom; 
	 end; 
	 
	 procedure agregarListaNueva (var L : nuevaL; nroLegajo : integer; promedio : real ); 
	 var
		nuevo : nuevaL; 
	 begin
			new(nuevo); 
			nuevo^.elem.nroLegajo := nroLegajo; 
			nuevo^.elem.prom:= promedio; 
			nuevo^.sig:= L;
			L:= nuevo; 
	 end; 
	 
	 function ingresoDespues2019 ( anho : integer): boolean; 
	 begin
			ingresoDespues2019:= ( anho > 2019); 
	 end; 
	 
	 procedure calcularMin ( nc : str30 ; var min1,min2 : integer; var ncMin1,ncMin2 : str30; cantAprobadas : integer); 
	 begin
			if ( cantAprobadas < min1 ) then 
				begin
						min2:= min1; 
						min1:= cantAprobadas;
						ncMin2:= ncMin1; 
						ncMin1:= nc;
				end
			else
				if ( cantAprobadas < min2 ) then 
					begin
						min2:= cantAprobadas; 
						ncMin2:= nc; 
					end; 
		
	 end; 
	 
	 function cumpleDni ( dni : integer): boolean; 
	 var
		dig,cant : integer;
		ok : boolean; 
	 begin
		cant:= 0;
		ok:= True;
			while ( (dni <> 0 ) and ( ok = true)) do
				begin
					dig:= dni mod 10; 
					
					if ( dig mod 4 = 0 ) then 
						cant:= cant + 1; 
				
				dni:= dni div 10;
				
			if ( cant = 4 ) then 
				ok:= False; 
				end; 
			cumpleDni:= ( cant <= 3 ) ;  
	 end; 
	 
	 procedure procesarLista ( L : listaAlumnos;  var nueL : nuevaL); 
	 var
		ncMin1, ncMin2 : str30 ; 
		min1,min2 : integer; 
		cantIncisoD : integer; 
		promedio : real; 
	 begin
			cantIncisoD:= 0; 
			min1:= -1; 	min2:= -1;
			while ( L <> nil ) do 
				begin
				
						if (aproboUnaMateria(L^.elemento.cantAprobadas)) then 
							begin 
									promedio:= sacarPromedioCarrera(L^.elemento.cantAprobadas,L^.elemento.notaObtenida) ; 			
									agregarListaNueva (nueL,L^.elemento.nroLegajo,promedio); 
							end; 
							
							if (IngresoDespues2019(L^.elemento.anhoIngreso)) then 
							calcularMin(L^.elemento.nombreCompleto,min1,min2,ncMin1,ncMin2,L^.elemento.cantAprobadas); 	
				
							if (cumpleDni(L^.elemento.dni)) then 
								cantIncisoD:= cantIncisoD +1; 
						L:= L^.siguiente; 
				end; 
				writeln ('El nombre y apellido de los alumnos que tienen menos cantidad de materias aprobadas son: '); 
				writeln (ncMin1, ' y ',ncMin2 ); 
	 end; 
	{ programa principal }
	var 
		L: listaAlumnos; 
		nueL : nuevaL; 
	begin
		cargarLista(L); // se dispone
		crearLista(nuevaL); 
		procesarLista (L,nueL); 
	end. 	
