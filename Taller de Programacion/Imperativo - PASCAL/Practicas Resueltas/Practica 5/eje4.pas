{
4. Una oficina requiere el procesamiento de los reclamos de las personas. 
De cada reclamo se lee código, DNI de la persona, año y tipo de reclamo. 
La lectura finaliza con el código de igual a -1. Se pide:

a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.

->> Arbol: donde cada nodo tenga: 
*			Dni : integer;
* 			cantReclamos : integer;
* 			reclamos : listaReclamos; 


b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.

c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.
}

program eje4; 
type
	registroLeer = record
		dni : integer; 
		anho : integer;
		tipoReclamo : string;
		codigo : integer;
	end;

	rListaReclamo = record
		anho : integer;
		tipoReclamo : string; 
		codigo : integer;
	end;
	

	listaReclamos = ^nodo1;
	nodo1 = record
		dato :rListaReclamo; 
		sig : listaReclamos;  
	end;


	rArbol = record
		dni : integer;
		cantReclamos : integer;
		reclamos : listaReclamos; 
	end;

	arbol = ^nodo2;
	nodo2= record
		dato : rArbol;
		HI : arbol;
		HD : arbol; 
	end;
{-----------------------------------------------------------------------------------------}
procedure inicializarArbol (var a : arbol); 
begin
	a:= nil;
end;

procedure inicializarListaReclamos (var pI : listaReclamos); 
begin
	pI:= nil; 
end;
{-----------------------------------------------------------------------------------------}
procedure leerReclamo (var r : registroLeer); 
begin
	write ('Ingrese el codigo de reclamo: '); readln (r.codigo); 
		if (r.codigo <> -1) then 
			begin
				write ('Ingrese el dni: '); readln (r.dni); 
				write ('Ingrese el anho: '); readln (r.anho); 
				write ('Ingrese el tipo de reclamo: '); readln (r.tipoReclamo); 
				writeln; 
			end;
end;
{-----------------------------------------------------------------------------------------}
procedure agregarAdelante (var pI : listaReclamos; dato : rListaReclamo); 
var
	nue : listaReclamos;
begin
	new (nue); 
	nue^.dato:= dato; 
	nue^.sig:= pI;
	pI:= nue; 
end;

procedure asignarDatos1 (var asignar : rListaReclamo ; dato : registroLeer); 
begin
	asignar.tipoReclamo:= dato.tipoReclamo;
	asignar.codigo:= dato.codigo;
	asignar.anho:= dato.anho; 
end;

procedure asignarDatos2(a : arbol; dni : integer; datosLista : rListaReclamo); 
begin
	a^.dato.dni:= dni; 
	a^.dato.cantReclamos:= 1;
	inicializarListaReclamos(a^.dato.reclamos); 
	agregarAdelante(a^.dato.reclamos,datosLista); 
end;


procedure agregarEnArbol (var a : arbol; dni : integer; datosLista : rListaReclamo); 
begin
	if (a = nil) then 
		begin
			new(a); 
			asignarDatos2(a,dni,datosLista); 
			a^.HI:= nil; 
			a^.HD:=nil;
		end
	else
		begin
				if (dni < a^.dato.dni) then 
					agregarEnArbol(a^.HI,dni,datosLista)
				else if ( dni > a^.dato.dni) then 
					agregarEnArbol(a^.HD,dni,datosLista)
				else
					begin	
			{si entra aca, es porque el dni ya existe, entonces debemos incrementar la cantidad de reclamos y agregar el reclamo en la lista}
						a^.dato.cantReclamos:= a^.dato.cantReclamos + 1; 
						agregarAdelante(a^.dato.reclamos,datosLista); 
					end;
		end;
end;

procedure cargarEnEstructura (var a : arbol; dato : registroLeer); 
var
	asignar : rListaReclamo;
begin
	asignarDatos1(asignar,dato); 
	agregarEnArbol(a,dato.dni,asignar); 
end;


procedure cargarArbol (var a : arbol); 
var
	r : registroLeer; 
begin
	leerReclamo(r); 
	while (r.codigo <> -1) do 
		begin
			cargarEnEstructura (a,r); 
			leerReclamo(r);
		end;
end;
{-----------------------------------------------------------------------------------------}
	{imprimios el arbol en orden}

	procedure imprimirLista ( pI : listaReclamos); 
	begin
		while (pI<> nil) do 
			begin
				writeln ('--> ',pI^.dato.tipoReclamo); 
				pI:= pI^.sig;
			end;
	end;
	
	procedure imprimirArbol (a : arbol); 
	begin
		if (a <> nil) then 
			begin
				imprimirArbol(a^.HI);
			
				writeln ('Reclamos del dni: ',a^.dato.dni); 
				imprimirLista(a^.dato.reclamos); 
				writeln ('La cantidad total de reclamos fueron: ',a^.dato.cantReclamos); 
				writeln; 
				
				imprimirArbol(a^.HD);
			end;
	end;

{-----------------------------------------------------------------------------------------}
{b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.} 

	function buscarCantReclamos (a : arbol; dni : integer) : integer;
	begin
		if (a = nil) then 
			buscarCantReclamos:= 0
		else
			begin
					if (a^.dato.dni < dni) then 
							buscarCantReclamos:= buscarCantReclamos(a^.HI,dni)
					else if (a^.dato.dni > dni) then 
							buscarCantReclamos:= buscarCantReclamos(a^.HD,dni)
					else
							buscarCantReclamos:= a^.dato.cantReclamos;
			end;
	end;
	
	procedure moduloB (a : arbol); 
	var
		dni : integer;
	begin
		writeln ('Estas en el inciso B. '); 
		write ('Ingrese un dni: '); readln (dni); 
		writeln ('La cantidad de reclamos del dni ingresado ( ',dni, ' ) son: ',buscarCantReclamos(a,dni)); 
		writeln ;
	end;
{-----------------------------------------------------------------------------------------}
	{c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.}

	function contarReclamosIntermedios (a : arbol; dni1,dni2 : integer): integer;
	begin
		if( a = nil) then 
			contarReclamosIntermedios:= 0
		else
			begin
					if ( ( a^.dato.dni > dni1) and (a^.dato.dni < dni2) )  then 
						contarReclamosIntermedios:=  a^.dato.cantReclamos  + contarReclamosIntermedios(a^.HI,dni1,dni2) + contarReclamosIntermedios(a^.HD,dni1,dni2); 
						
			
			end;
	end;
	
	procedure moduloC (a : arbol); 
	var
		dni1,dni2 : integer; 
	begin
		writeln ('Estas en el inciso C. '); 
		write ('Ingresa el primer dni: '); readln (dni1); 
		write ('Ingrese el segundo dni: '); readln (dni2); 
		writeln ('La cantidad de reclamos entre los dni ( ',dni1, ' y '  ,dni2, ' ) son: ',contarReclamosIntermedios(a,dni1,dni2) ); 
	end;
{-----------------------------------------------------------------------------------------}
 {d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}
	
	function recorrerLista (pI : listaReclamos ; anho : integer): integer;
	begin
		if (pI = nil) then 
			recorrerLista:= 0
		else
			begin
			
				if (pI^.dato.anho = anho) then 
					recorrerLista:= recorrerLista(pi^.sig,anho) + 1
				else
					recorrerLista:= recorrerLista(pI^.sig,anho); 
			
			end;
	end;
	
	function sacarReclamosAnho (a : arbol; anho : integer): integer;
	begin
		if (a = nil) then 
			sacarReclamosAnho:= 0
		else
			begin
				sacarReclamosAnho:= recorrerLista(a^.dato.reclamos,anho) + sacarReclamosAnho(a^.HI,anho) + sacarReclamosAnho(a^.HD,anho); 
			end;
	end;
	procedure moduloD (a : arbol); 
	var
		anho : integer;
	begin
		write ('Ingrese un anho: '); readln (anho); 
		writeln ('La cantidad de reclamos en el anho ',anho, ' fueron:  ',sacarReclamosAnho(a,anho)); 
	end;

{-----------------------------------------------------------------------------------------}
	{programa principal}
	var
		a : arbol;
	begin
		inicializarArbol(a); 
		cargarArbol(a); 
		
		moduloB(a); 
		
		moduloC(a);
		
		moduloD(a); 
		
		//imprimirArbol(a); 
	end.
