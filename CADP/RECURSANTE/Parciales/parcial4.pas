program parcial4;
const
	dimF = 37;
type 
	rangoMaterias = 0..37; 
	str40 = string[40]; 
	
	vNotas = array [1..dimF] of real ;  { a lo sumo 37}
	
	alumnos = record
			nroLegajo : integer;
			dni : integer; 
			nombreCompleto : str40;
			anhoIngreso : integer;
			cantAprobadas : integer;
			nota : vNotas; 
	end;
	
	listaAlumnos = ^nodo; 
	nodo = record
			elemento : alumnos;
			siguiente : listaAlumnos; 
	end;
	
	registroAux = record
		nroLegajo : integer;
		promedio : real;
	end;
	
	nuevaLista = ^nodo2; 
	nodo2 = record
		elemento : registroAux;
		siguiente : nuevaLista;
	end;
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
	procedure crearListaNueva (var L : nuevaLista); 
	begin
			L:= nil;
	end;
	
	procedure agregarAdelante (var LN : nuevaLista; dato : registroAux); 
	var
		nuevo : nuevaLista; 
	begin
		new(nuevo); 
		nuevo^.elemento:= dato;
		
		nuevo^.siguiente:= LN;
		LN:= nuevo; 
	end;
	
	function calcularPromedio (cantMaterias : integer; nota : vNotas): real; 
	var
		i : integer;
		sumaNotas: real;
	begin
		sumaNotas:= 0;
			for i:= 1 to cantMaterias do 
				sumaNotas:= sumaNotas + nota[i]; 
				
			calcularPromedio:= ( sumaNotas / cantMaterias); 
	end;
	
	procedure calcularDosMin (nombre : str40; materiasAprobadas : integer; var min1,min2 : integer; var nombreMin1,nombreMin2 : str40); 
	begin
		if ( materiasAprobadas < min1 ) then 
			begin
				min2:= min1; 
				min1:= materiasAprobadas;
				nombreMin2:= nombreMin1; 
				nombreMin1:= nombre;
			end
		else
			if ( materiasAprobadas < min2 ) then 
				begin
					min2:= materiasAprobadas;
					nombreMin2:= nombre;
				end;
	end;
	
	function cumpleCondicionDni ( dni : integer): boolean;
	var
		dig : integer;
		cant : integer;
	begin
		cant:= 0;
			while ( dni <> 0 ) do
				begin
					dig := dni mod 10;
						
						if ( (dig mod 4 ) = 0 ) then
							cant:= cant + 1;
						
					dni:= dni div 10; 	
				end;
		cumpleCondicionDni:= cant <= 3;
	end;
	
	procedure procesarListaAlumnos ( L : listaAlumnos); 
	var
		promedioAlumno : real; 
		nuevaL : nuevaLista; 
		min1,min2 : integer;
		nombreMin1,nombreMin2 : str40; 
		cantCumple : integer;
		r : registroAux; 
	begin
		min1:= 999;
		min2:= 999;
		cantCumple:=0;
		while ( L <> nil ) do 
			begin
			
				// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
				// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
					{ inciso a }
					if (L^.elemento.cantAprobadas > 1) then { si el alumno tiene al menos 1 materia aprobada}
						begin 
							promedioAlumno:= calcularPromedio(L^.elemento.cantAprobadas,L^.elemento.nota); 
							r.nroLegajo:= L^.elemento.nroLegajo;
							r.promedio:= promedioAlumno; 
							agregarAdelante(nuevaL,r); 
						end; 
				// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
				// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
					{ inciso b }
					if ( L ^.elemento.anhoIngreso > 2019) then 
						calcularDosMin(L^.elemento.nombreCompleto,L^.elemento.cantAprobadas,min1,min2,nombreMin1,nombreMin2); 
				// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
				// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
					{ inciso c }
				if cumpleCondicionDni(L^.elemento.dni) then 
					cantCumple:= cantCumple + 1; 
				
				L:= L^.siguiente;
			end;
			writeln ('La cantidad de alumnos c dni compuesto por a lo sumo 3 dig multiplos de 4 son: ',cantCumple); 
			
			writeln ('El nombre completo de los dos alumnos que ingresaron despues de anho2019 y tienen al menos una materia aprobada son:  ');
			writeln (nombreMin1 , ' y ',nombreMin2 ); 
	end;
	
	
	{ programa principal }
	var
		ListaA : listaAlumnos;
		nuevaL : nuevaLista; 
	begin
			cargarListaAlumnos (ListaA); // se dispone 
			crearListaNueva(nuevaL); 
			procesarListaAlumnos(ListaA); 
	end. 
