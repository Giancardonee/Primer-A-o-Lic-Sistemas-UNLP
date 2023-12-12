	{e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
	módulo debe retornar la cantidad de préstamos realizados a dicho socio.
	
	f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
	ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
	que se prestó.
	
	g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
	ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
	que se prestó.
	
	h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
	
	i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
	módulo debe retornar la cantidad total de préstamos realizados a los ISBN
	comprendidos entre los dos valores recibidos (incluidos).
	
	j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
	módulo debe retornar la cantidad total de préstamos realizados a los ISBN
	comprendidos entre los dos valores recibidos (incluidos).}
	program a ; 
	const
		cantDias = 31;
		cantMeses = 12;
	type
		prestamo = record
			ISBN : integer;
			dia : 1..cantDias;
			mes : 1..cantMeses;
			nroSocio : integer;
			diasPrestados : integer; 
		end;
	
	arbol1 = ^nodo;
	nodo = record
		dato : prestamo;
		HI : arbol1;
		HD : arbol1; 
	end;
	
	listaPrestamos = ^nodo3;
	nodo3 = record
		dato : prestamo;
		sig : listaPrestamos;
	end;
	
	rAux = record
		isbn : integer; 
		cantPrestamos : integer; 
	end; 	

	prestamosISBN = ^nodo4; 
	nodo4 = record
		dato : rAux; 
		sig : prestamosISBN; 
	end; 

	arbol2 = ^nodo2; 
	nodo2 = record
		dato : listaPrestamos ; 
		HI : arbol2;
		HD : arbol2;
	end;
	
	procedure inicializarArbol1 (var a : arbol1); 
	begin
		a := nil 
	end; 
	procedure inicializarArbol2(var a : arbol2); 
	begin
		a := nil 
	end; 
	
	procedure inicializarLista(var l : listaPrestamos); 
	begin
		L := nil
	end;
	
	procedure leerPrestamo(var p : prestamo); 
	begin
		write ('Ingrese el ISBN: '); readln (p.ISBN); 
			if (p.ISBN <> -1) then 
				begin
						write ('Ingrese el dia del prestamo: '); readln (p.dia); 
						write ('Ingrese el mes del prestamo: '); readln (p.mes); 
						write ('Ingrese el numero de socio: '); readln (p.nroSocio);
						write ('Ingrese la cantidad de dias prestados: '); readln (p.diasPrestados); 
				end;
			writeln ; 	
	end;

	procedure agregarEnPrimerArbol(var a : arbol1; dato: prestamo);
	begin
		if (a = nil) then 
			begin
				new(a); 
				a^.dato:= dato;
				a^.HI:=nil;
				a^.HD:= nil;
			end
		else
			begin
					if (dato.ISBN < a^.dato.ISBN) then 
					agregarEnPrimerArbol(a^.HI,dato)
				else
						agregarEnPrimerArbol(a^.HD,dato);
			end;		
	end;
		
	procedure agregarAdelante (var pI : listaPrestamos; dato: prestamo); 
	var
		nuevo : listaPrestamos; 
	begin
		new (nuevo); 
		nuevo^.dato:= dato; 
		nuevo^.sig:= pI;
		pI:= nuevo; 
	end; 
	
	procedure agregarEnSegundoArbol (var a2: arbol2 ; dato: prestamo ); 
	begin
		if (a2 = nil) then  {si el nodo no existe}
			begin
				new (a2); 
				inicializarLista (a2^.dato); 
				agregarAdelante(a2^.dato,dato); 
				a2^.HI:= nil; 
				a2^.HD:= nil;
			end
		else
			begin
					if (dato.ISBN = a2^.dato^.dato.ISBN) then {si el nodo existe} 
						agregarAdelante(a2^.dato,dato)
					else 
						if (dato.ISBN < a2^.dato^.dato.ISBN) then  {si el isbn es menor}
							agregarEnSegundoArbol(a2^.HI,dato)
					else															{sino lo mando a la derecha (voy a tener mis repetidos)}
							agregarEnSegundoArbol(a2^.HD,dato); 
			end; 
	end; 	
	
	procedure cargarArboles(var a : arbol1; var a2 : arbol2); 
	var
		p : prestamo;
	begin
		leerPrestamo(p); 
		if ( p.ISBN <> -1) then 
			begin
				agregarEnPrimerArbol(a,p); 
				agregarEnSegundoArbol(a2,p); 
				cargarArboles(a,a2); 
			end; 
	end;
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }	
	{un modulo que reciba la estructura generada en i, y que devuelva el isb mas grande}
	function sacarMaxISBN (a : arbol1) : integer; 
	begin
		if (a = nil) then 
			sacarMaxISBN:= -1
		else
			begin
				if (a^.HD = nil) then 
					sacarMaxISBN:= a^.dato.ISBN
				else
					sacarMaxISBN:= sacarMaxISBN(a^.HD); 
			end; 
	end; 
	
	procedure moduloB (a : arbol1); 
	begin
		writeln('----------------------------------------------------------------------'); 
		writeln ('El isbn mas grande es: ',sacarMaxISBN(a));
	end; 
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }		
	{	c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
	pequeño.   
	* --->> para hacer este inciso, debemos desplazarnos en el segundo arbol, full izquierda, 
	* ya que el arbol se encuentra ordenado por isbn}
	
	function sacarMinISBN (a : arbol2): integer; 
	begin
		if( a = nil ) then 
			sacarMinISBN:= -1
		else
			begin
					if (a^.HI = nil) then 
						sacarMinISBN:= a^.dato^.dato.isbn
					else
						sacarMinISBN:= sacarMinISBN(a^.HI); 
			end; 
	end; 
	
	procedure moduloC (a : arbol2); 
	begin
		writeln ('El isbn mas chico es: ',sacarMinISBN(a));
		writeln ('----------------------------------------------------------------------');  
	end; 
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }		
	{	d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
	módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
	function cantPrestamosSocio (a : arbol1; socio : integer): integer ; 
	begin
		if ( a = nil ) then 
			cantPrestamosSocio:= 0
		else
			begin
					cantPrestamosSocio:= cantPrestamosSocio(a^.HI,socio) + cantPrestamosSocio(a^.HD,socio) ;
					if (a^.dato.nroSocio = socio) then 
						cantPrestamosSocio:= cantPrestamosSocio + 1; 
			end; 
	end; 
	
	procedure moduloD (a : arbol1); 
	var
		nroSocio : integer;
	begin
		writeln ('-->> Contar prestamos de un socio en el arbol 1');
		write ('Ingrese un numero de socio: '); readln (nroSocio); 
		writeln ('La cantidad de prestamos realizados por el socio ',nroSocio, ' son: ',cantPrestamosSocio(a,nroSocio)); 
		writeln ('----------------------------------------------------------------------');   
	end; 
	
	
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }	
		{modulos para ver si se cargo bien el segundo arbol}
		procedure imprimirLista (pI : listaPrestamos); 
		begin
			writeln ('---->>> PRESTAMOS DEL ISBN ',pI^.dato.ISBN) ; // probar
			while (pI <> nil) do 
				begin
						writeln ('En la fecha: ',pI^.dato.dia, ' / ',pI^.dato.mes, ' / 2023 se solicito el isbn ',pI^.dato.isbn); 
						writeln ('Numero de socio: ',pI^.dato.nroSocio, ' .Dias prestados: ',pI^.dato.diasPrestados); 			
					pI:= pI^.sig; 
				end;
		end; 
		
		procedure imprimirArbol2 (a : arbol2); 
		begin
			if (a <> nil) then 
				begin
					imprimirArbol2(a^.HI); 
				{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
					imprimirLista(a^.dato); 
				{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
					imprimirArbol2(a^.HD); 
				end;
		end ; 
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }	
		{	e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
	módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
	function contarEnLista ( pI : listaPrestamos ; nroSocio : integer): integer;
	begin
		if ( pI = nil ) then
			contarEnLista:= 0
		else
			begin
						if ( pI^.dato.nroSocio = nroSocio ) then 
							contarEnLista:= contarEnLista(pI^.sig,nroSocio) +1 
						else
							contarEnLista:= contarEnLista(pI^.sig,nroSocio); 
			end; 
	end; 
	
	function contarEnNodos (a2 : arbol2; nroSocio : integer): integer; 
	begin
		if (a2 <>nil) then 
			begin
				contarEnNodos:= contarEnLista(a2^.dato,nroSocio) + contarEnNodos(a2^.HI,nroSocio) + contarEnNodos(a2^.HD,nroSocio); 
			end
		else
			contarEnNodos:= 0;
	end; 
	
	procedure moduloE (a2 : arbol2); 
	var
		nroSocio : integer;
	begin
		writeln ('----------------------------------------------------------------------');  
		writeln ('-->>> Contar prestamos de un socio en el arbol 2'); 
		write ('Ingrese un numero de socio: '); readln (nroSocio); 
		writeln ('La cantidad de prestamos del socio con numero ',nroSocio, ' es: ',contarEnNodos(a2,nroSocio)); 
		writeln ('----------------------------------------------------------------------');  
	end; 
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }	
	 { g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
	ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.} 
	
	procedure inicializarListaG(var pI : prestamosISBN); 
	begin
		pI := nil;
	end;
	
	function contarPrestamos (pI : listaPrestamos): integer;
	begin
		if (pI = nil) then 
			contarPrestamos:= 0
		else
			begin
				contarPrestamos:= contarPrestamos(pI^.sig) + 1; 
			end;
	end; 

	procedure asignarDatos2 (var aux : rAux; isbn : integer; cantPrestamos : integer); 
	begin
		aux.isbn:= isbn; 
		aux.cantPrestamos:= cantPrestamos;
	end;
	
	procedure agregarAdelante (var pI : prestamosISBN; dato : rAux); 
	var
		nue : prestamosISBN;
	begin
		new (nue); 
		nue^.dato:= dato; 
		nue^.sig:= pI;
		pI:= nue; 
	end;
	
	procedure cargarEnListaG (listaAct : listaPrestamos; var pI : prestamosISBN); 
	var
		prestamos: integer;
		aux : rAux;
	begin
		prestamos:= contarPrestamos(listaAct); 
		asignarDatos2(aux,listaAct^.dato.isbn,prestamos); 
		agregarAdelante(pi,aux); 
	end;
	

	
	procedure procesarArbol2 (a2 : arbol2; var pI : prestamosISBN); 
	begin
		if (a2 <> nil) then 
			begin
					procesarArbol2(a2^.HI,pI); 
					{- - - - - - - - - - - - - - - - - - - - - - -}
						cargarEnListaG(a2^.dato,pi); 
					{- - - - - - - - - - - - - - - - - - - - - - -}
					procesarArbol2(a2^.HD,pI); 
			end;
	end;
	
	procedure imprimirLista (pI : prestamosISBN); 
	begin
		writeln ('-->>>Imprimiendo la lista del inciso G');
		while (pI <> nil) do 
			begin
				writeln ('ISBN: ',pI^.dato.isbn, ' cantidad de prestamos: ',pI^.dato.cantPrestamos); 
				pI:= pI^.sig; 
			end; 
	end; 
	
	procedure moduloG (a2 : arbol2; var pI : prestamosISBN);
	begin
		inicializarListaG(pI);
		procesarArbol2(a2,pI); 
		imprimirLista(pI); 
	end;
	
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }	
	{	i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
	módulo debe retornar la cantidad total de préstamos realizados a los ISBN
	comprendidos entre los dos valores recibidos (incluidos).}
	
	procedure moduloI (a : arbol1); 
	var
		valor1,valor2 : integer;
	begin
		write ('Ingrese el valor 1: '); readln (valor1); 
		write ('Ingrese el valor 2: '); readln (valor2);
		
	end; 
	
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  }	
	
	var
	 a1 : arbol1; 
	 a2 : arbol2; 
	 listaG : prestamosISBN; 
	begin
		inicializarArbol1(a1); 
		inicializarArbol2(a2); 
		cargarArboles(a1,a2); 		
	{ - - - - - - - - - - - - - - - - - - - - - - - }
		moduloB(a1);
	{ - - - - - - - - - - - - - - - - - - - - - - - }
		moduloC(a2); 
	{ - - - - - - - - - - - - - - - - - - - - - - - }
		moduloD(a1);
	{ - - - - - - - - - - - - - - - - - - - - - - - }
		moduloE(a2); 
	{ - - - - - - - - - - - - - - - - - - - - - - - }
{este inciso me dio ganas de cabecear un tren, no me salio}
			//moduloF(a1,listaF); 
			//imprimirLista(listaF); 
	{ - - - - - - - - - - - - - - - - - - - - - - - }	
		moduloG(a2,listaG); 
	{ - - - - - - - - - - - - - - - - - - - - - - - }	
		
		
		
		
	{para ver si cargo bien el arbol2}
		//imprimirArbol2 (a2); 
			
	end.
