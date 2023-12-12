program eje1prac3;
type
	str20 = string[20]; 
	socios = record
		nroSocio : integer;
		nombre : str20; 
		edad : integer;
	end;
	
	arbolSocios = ^nodo; 
	nodo = record
		dato : socios;
		HI : arbolSocios;
		HD : arbolSocios;
	end;

	procedure inicializarArbol (var a : arbolSocios); 
	begin
		a := nil;
	end;
	
	procedure agregarEnArbol (var a : arbolSocios; socio : socios); 
	begin
		if (a = nil) then 
			begin
				new(a); 
				a^.dato:= socio;
				a^.HI:= nil;
				a^.HD:= nil; 
			end
		else
			begin
				if (socio.nroSocio < a^.dato.nroSocio) then 
					agregarEnArbol(a^.HI, socio)
				else
					agregarEnArbol(a^.HD,socio); 
			end;
	end;

	procedure leerSocio (var s : socios); 
	begin
			writeln ('Ingrese el numero de socio: '); 
			readln (s.nroSocio); 
				if (s.nroSocio <> 0) then 
					begin
						writeln ('Ingrese el nombre: ');
						readln (s.nombre);
						writeln ('Ingrese la edad: '); 
						readln (s.edad); 
					end;
	end;
	
	{lo estoy cargando de manera recursiva}
	procedure cargarArbol (var a: arbolSocios); 
	var
		s : socios;
	begin
		leerSocio(s); 
			if (s.nroSocio<>0) then 
				begin
					agregarEnArbol(a,s);
					cargarArbol(a); 
				end;
	end;
	
	function calcularMax(a : arbolSocios) : integer;
	begin
		if (a = nil) then 	// caso base 1 (arbol vacio)
			calcularMax:= -1
		else
			begin
				if (a^.HD = nil) then   // caso base 2 (cuando el siguiente es nil)
					calcularMax:= a^.dato.nroSocio
				else
					calcularMax:= calcularMax(a^.HD);  // caso recursivo
			end;
	end;
	
	function calcularMin (a : arbolSocios): arbolSocios;
	begin
		if (a = nil) then 
			calcularMin:= nil
		else 
			begin
				if (a^.HI = nil) then 
					calcularMin:= a
				else 
					calcularMin:= calcularMin(a^.HI); 
			end;
	end;
	
	procedure actualizarMax(s : socios; var edadMax : integer; var nroSocio : integer); 
	begin
		if (s.edad > edadMax) then 
			begin
				edadMax:= s.edad;
				nroSocio:= s.nroSocio; 
			end;
	end;
	
	procedure socioMayorEdad (a : arbolSocios; var edadMax : integer; var nroSocio : integer); 
	begin
		if (a <>nil) then 
			begin
				socioMayorEdad(a^.HI,edadMax,nroSocio); 
				{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
				actualizarMax(a^.dato,edadMax,nroSocio); 
				{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
				socioMayorEdad(a^.HD,edadMax,nroSocio); 
			end;
	end;
	
	procedure inciso_iv(a : arbolSocios); 
	begin
		if( a <> nil) then 
			begin
					a^.dato.edad:= a^.dato.edad+ 1;
					inciso_iv(a^.HI); 
					inciso_iv(a^.HD); 				
			end;
	end;
	
	function existeNroSocio (a : arbolSocios; nroSocioBuscado : integer): boolean;
	begin
		if (a = nil) then 
			existeNroSocio:= false
		else
			begin
					if (nroSocioBuscado = a^.dato.nroSocio) then 
						existeNroSocio:= true
					else 	if (nroSocioBuscado < a^.dato.nroSocio) then 
							existeNroSocio:= existeNroSocio(a^.HI,nroSocioBuscado)
					else
							existeNroSocio:= existeNroSocio(a^.HD,nroSocioBuscado); 
			end;	
	end;
	
	function existeNombreSocio (a : arbolSocios; nombreBuscado : str20): boolean;
	begin
		if (a = nil) then 
			existeNombreSocio:= false
		else
			begin
					existeNombreSocio:= existeNombreSocio(a^.HI,nombreBuscado); 
					{- - - - - - - - - - - - - - - - - - - - - - - - - - -}
					if (a^.dato.nombre = nombreBuscado) then 
					existeNombreSocio:= true;
					{- - - - - - - - - - - - - - - - - - - - - - - - - - -}
					existeNombreSocio:= existeNombreSocio(a^.HD,nombreBuscado); 
			end;
	end;
	
	function calcularCantSocios (a : arbolSocios; cant : integer ) : integer;
	begin
		if (a = nil) then 
			calcularCantSocios:= cant
		else
			begin
				cant:= cant + 1 ;
				calcularCantSocios:= calcularCantSocios (a^.HI,cant); 
				calcularCantSocios:= calcularCantSocios (a^.HD,cant); 
			end;
	end;
	
	function sumarEdades (a : arbolSocios; sumaEdades : integer): integer;
	begin
		if (a = nil) then 
			sumarEdades:= sumaEdades
		else
			begin
				sumaEdades:= sumaEdades + a^.dato.edad;
				sumarEdades:= sumarEdades(a^.HI,sumaEdades); 
				sumarEdades:= sumarEdades(a^.HD,sumaEdades); 
			end;
	end;
	
	function calcularPromedio (cantSocios:  integer; sumaEdades : integer): real;
	begin
		calcularPromedio:= (sumaEdades / cantSocios); 
	end;
	

	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	{modulos para informar, no son necesarios}
	procedure informarInciso_i (a: arbolSocios); 
	begin
		writeln ('El numero de socio mas grande es: ',calcularMax(a)); 
	end;
	
	procedure informarInciso_ii ( a : arbolSocios); 
	var
		socioMenor : arbolSocios;
	begin
		socioMenor:= calcularMin(a); 
		if (socioMenor  <> nil) then 
			begin
			writeln ('--->>>Datos del socio con numero de socio mas chico: ');
			writeln ('Numero de socio: ',socioMenor^.dato.nroSocio);
			writeln ('Nombre: ',socioMenor^.dato.nombre);
			writeln('Edad: ',socioMenor^.dato.edad); 
			end; 

	end;
	
	procedure informarInciso_iii(a : arbolSocios);
	var
		edadMax,nroSocio: integer; 
	begin
		edadMax:= -1;
		nroSocio:= -1;
		socioMayorEdad(a,edadMax,nroSocio); 
		writeln ('El numero de socio con mayor edad es: ',nroSocio); 
	end;
	
	procedure informarInciso_v (a : arbolSocios); 
	var
		nro : integer;
	begin
		writeln ('Ingrese un numero de socio para buscar: '); 
		readln (nro); 
		if (existeNroSocio(a,nro)) then 
			writeln ('El socio con numero de socio igual a ',nro, ' se encuentra :)')
		else 
			writeln ('El socio con numero de socio igual a ',nro, ' no se encuentra :( '); 
	end;
	
	procedure informarInciso_vi (a : arbolSocios); 
	var
		nombre : str20;
	begin
		writeln ('Ingrese un nombre a buscar: '); 
		readln (nombre); 
		if (existeNombreSocio(a,nombre)) then 
			writeln ('Se encontro el socio con nombre ',nombre)
		else
			writeln ('No se encontro el socio con nombre ',nombre)
	end;
	
	procedure informarInciso_vii (a : arbolSocios); 
	var
		cant : integer;
	begin
		cant:= 0 ;
		writeln ('La cantidad de socios totales son: ',calcularCantSocios(a,cant)); 
	end;
	
	procedure informarInciso_viii(a : arbolSocios); 
	var
		cant,sumaEdades : integer;
	begin
		cant:= 0;
		sumaEdades:= 0; 
		cant:= calcularCantSocios(a,cant); 
		sumaEdades:= sumarEdades(a,sumaEdades); 
		writeln ('El promedio de edad es: ',calcularPromedio(cant,sumaEdades):2:2); 
	end;
	
		{Informa en orden creciente}
	procedure informarInciso_ix (a : arbolSocios); 
	begin
		if (a <> nil) then 
			begin
				informarInciso_ix(a^.HD); 
				writeln ('Numero de socio: ',a^.dato.nroSocio); 
				informarInciso_ix(a^.HI); 
			end;	
	end;
	{informa en orden decreciente}
	procedure informarInciso_x(a : arbolSocios); 
	begin
		if ( a <> nil) then 
			begin
				informarInciso_x(a^.HD);
				writeln ('Numero de socio: ',a^.dato.nroSocio);
				informarInciso_x(a^.HI);
			end;
	end;
	
	
	procedure informarTodo (a: arbolSocios); 
	begin
		informarInciso_i(a); 
		informarInciso_ii(a); 
		inciso_iv(a); 
		informarInciso_v(a); 
		informarInciso_vi(a); 
		informarInciso_vii(a); 
		informarInciso_viii(a); 
		informarInciso_ix(a);
		informarInciso_x(a); 
	end; 
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	{programa principal} 
	var
		a : arbolSocios;
	begin
		inicializarArbol(a); 
		cargarArbol(a); 
		informarTodo(a); 
	end.
	
	
	{
	enOrden(a); 
	}
	
		{procedure imprimirSocio (s : socios); 
	begin
		writeln ('---->>>El numero de socio es: ',s.nroSocio); 
		writeln ('El nombre es: ',s.nombre, ' y su edad es: ' ,s.edad); 
	end;
	
	procedure enOrden (a : arbolSocios); 
	begin
		if (a <> nil) then 
			begin
				enOrden(a^.HI); 
					imprimirSocio(a^.dato); 
				enOrden(a^.HD); 
			end;
	end; } 
	
