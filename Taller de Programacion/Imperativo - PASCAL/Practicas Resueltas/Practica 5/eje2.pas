{
2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:

a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:

i. Una estructura eficiente para la búsqueda por patente.
-->> Cada patente es unica, por lo que no se van a poder repetir


ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
-->> registro marca:  nombreMarca : str20; autos: listaMarca; 


b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.

c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.

d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
* 
* ->> Para mi es un vector de listas. Porque conozco el rango de años fabricacion 
* (2010..2018) por lo tanto son 9 posiciones. 
* Cada posicion de mi vector tendra : añoFabricacion : integer; y autos: listaAutos2
* Lo pense como un vector de 1..8, pero creo que se podria hacer de 2010...2018 
* vamos a ver si lo puedo hacer asi. Donde se acceda a la posicion por el año


e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.

f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
}

program eje2; 
type
	rangoAnhos = 2010..2018; 
	str20 = string[20];
 { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }	 
	infoAuto = record
		patente : str20; 
		anhoFabricacion : rangoAnhos; 
		marca : str20; 
		modelo : str20; 
	end; 
	
	arbol1 = ^nodo1; 
	nodo1 = record
		dato : infoAuto;
		HI : arbol1; 
		HD : arbol1; 
	end; 
 { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }	
	infoAuto2 = record
		patente : str20; 
		anhoFabricacion : rangoAnhos; 
		modelo : str20; 
	end; 
	
	listaAutos = ^nodo2; 
	nodo2 = record
		dato: infoAuto2; 
		sig: listaAutos; 
	end; 
	
	rArbol2 = record
		marca : str20; 
		autos: listaAutos; 
	end; 
	
	arbol2 = ^nodo3; 
	nodo3 = record
		dato : rArbol2; 
		HI : arbol2; 
		HD : arbol2; 
	end; 
	
 { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
	{declaraciones para el inciso D}
	rIncisoD = record
		patente : str20; 
		modelo : str20; 
		marca : str20; 
	end; 
	
	listaAutos2 = ^nodo4; 
	nodo4 = record
		dato : rIncisoD; 
		sig : listaAutos2; 
	end; 
	
	vFabricacion = array [rangoAnhos] of listaAutos2; 
 
  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
	procedure inicializarArboles (var a1: arbol1; var a2 : arbol2); 
	begin
		a1:= nil; 
		a2:= nil; 
	end; 
	
	procedure leerAuto(var a : infoAuto); 
	begin
		write ('Ingrese la marca del auto: '); readln (a.marca); 
			if ( a.marca <> 'fin') then 
				begin
					write ('Ingrese el modelo del auto: '); readln (a.modelo);
					write ('Ingrese la patente del auto: '); readln (a.patente); 
					write ('Ingrese el anho de fabricacion: '); readln (a.anhoFabricacion); 
					writeln; 
				end; 
	end; 

	procedure agregarEnEstructura1 (var a1 : arbol1; dato : infoAuto); 
	begin
		new (a1); 
		a1^.dato:= dato; 
		a1^.HI:= nil; 
		a1^.HD:= nil; 
	end; 

	procedure cargarEstructura1 (var a1: arbol1; dato : infoAuto); 
	begin
		if (a1 = nil) then 
			begin
				agregarEnEstructura1(a1,dato); 
			end
		else
			begin
					if (dato.patente < a1^.dato.patente) then {si la patente es menor, mando a izq}
						cargarEstructura1(a1^.HI,dato)
					else
						if (dato.patente > a1^.dato.patente) then 	{sino, es mayor, mando a der}
						cargarEstructura1(a1^.HD,dato); 
			end; 
	end; 

	procedure agregarAdelante (var pI : listaAutos; dato : infoAuto2); 
	var
		nue : listaAutos; 
	begin
		new (nue); 
		nue^.dato:= dato; 
		nue^.sig:= pI; 
		pI:= nue; 
	end; 

	procedure inicializarLista (var pI : listaAutos); 
	begin
		pI:= nil; 
	end; 
	
	procedure asignarDatos (dato : infoAuto ; var asignar : infoAuto2);
	begin
			asignar.patente:= dato.patente; 
			asignar.modelo:= dato.modelo; 
			asignar.anhoFabricacion:= dato.anhoFabricacion; 
	end; 
	
	procedure crearNodoArbol2 (var a2 : arbol2);
	begin
		new(a2);  
		inicializarLista (a2^.dato.autos); 
		a2^.HI:= nil;
		a2^.HD:= nil; 
	end; 
	
	procedure cargarEstructura2 (var a2 : arbol2; dato : infoAuto);
	var
		dato2 : infoAuto2; 
	begin
		if (a2 = nil) then 
			begin
				crearNodoArbol2(a2);
				asignarDatos(dato,dato2); 
				a2^.dato.marca:= dato.marca; {inicializo la marca en el nodo}
				agregarAdelante(a2^.dato.autos,dato2); 
			end
		else
			begin
				if (dato.marca < a2^.dato.marca) then 
					cargarEstructura2(a2^.HI,dato)
				else
					if (dato.marca > a2^.dato.marca) then 
						cargarEstructura2(a2^.HD,dato)
				else
					begin
								asignarDatos (dato, dato2); 
								agregarAdelante(a2^.dato.autos,dato2); 	
					end;
			end; 
	end; 

	procedure cargarEstructuras (var a1 : arbol1; var a2 : arbol2); 
	var
		auto : infoAuto; 
	begin
		inicializarArboles(a1,a2); 
		leerAuto(auto); 
			while (auto.marca <>'fin') do 
				begin
					cargarEstructura1 (a1,auto); 
					cargarEstructura2 (a2,auto); 
					leerAuto(auto); 
				end; 
	end; 

	procedure imprimirArbol1 (a1 : arbol1); 
	begin
		if (a1 <>nil) then 
			begin
				imprimirArbol1(a1^.HI);
				
					writeln ('Patente: ',a1^.dato.patente); 
				
				imprimirArbol1(a1^.HD); 
			end; 
	end; 
	
	procedure imprimirLista (pI : listaAutos); 
	begin
		while (pI <> nil) do 
			begin
				writeln ('Modelo : ',pI^.dato.modelo); 
				writeln ('Anho fabricacion: ',pI^.dato.anhoFabricacion); 
				pi:= pI^.sig; 
			end; 
				writeln ('----------------------------------------------------'); 
	end; 
	
	procedure imprimirArbol2 (a2 : arbol2); 
	begin
		if (a2 <> nil) then 
			begin
				imprimirArbol2(a2^.HI); 
					writeln ('----------------------------------------------------'); 
					writeln ('Lista de autos de la marca: ',a2^.dato.marca); 
						imprimirLista(a2^.dato.autos); 
				imprimirArbol2(a2^.HD);
			end; 
	end; 

{--------------------------------------------------------------------------------------------------------------------------------------------}
{b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.}

function contarCantMarcas (a1 : arbol1; marcaBuscada : string) : integer;
begin
	if (a1 = nil) then 
		contarCantMarcas:= 0
	else
		begin
				contarCantMarcas:= contarCantMarcas(a1^.Hi,marcaBuscada) + contarCantMarcas(a1^.HD,marcaBuscada); 
					if (a1^.dato.marca = marcaBuscada) then 
						contarCantMarcas:= contarCantMarcas + 1;
		end;
end;

procedure incisoB (a1 : arbol1); 
var
	marcaBuscada : string; 
begin
	writeln ('---->>Estas en el inciso B.'); 
	write ('Ingrese una marca de auto: '); readln (marcaBuscada); 
	writeln ('La cantidad de autos de la marca ',marcaBuscada, ' son: ',contarCantMarcas(a1,marcaBuscada)); 
end; 	
{--------------------------------------------------------------------------------------------------------------------------------------------}	
{c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.}

{como se sabe que en esta lista, cada auto va a ser de la misma marca, solo llevamos 
* un contador por cada nodo que recorramos}
function recorrerLista (pI : listaAutos): integer;  
begin
	if (pI = nil) then 
		recorrerLista:= 0
	else
		begin
			recorrerLista:= recorrerLista(pI^.sig) + 1; 
		end; 
end; 

function encontrarNodo (a : arbol2; marcaBuscada : string): integer; 
begin
	if (a = nil) then 
		encontrarNodo:= 0
	else
		begin
					encontrarNodo:= encontrarNodo(a^.HI,marcaBuscada) + encontrarNodo(a^.HD,marcaBuscada);
						if (a^.dato.marca = marcaBuscada) then 
							encontrarNodo:= recorrerLista(a^.dato.autos); 
		end; 
end; 

procedure incisoC (a : arbol2); 
var
	marcaBuscada : string; 
begin
	writeln ('-->> Estas en el inciso C.'); 
	write ('Ingrese una marca de auto: '); readln (marcaBuscada);
	writeln ('La cantodad de autos de la marca ',marcaBuscada, ' es: ',encontrarNodo(a,marcaBuscada));  
end; 
{--------------------------------------------------------------------------------------------------------------------------------------------}	
{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.}
	procedure inicializarVecFabricacion (var v : vFabricacion); 
	var
		i : integer;
	begin
		for i:= 2010 to 2018 do 
			begin
				v[i]:= nil; 
			end; 
	end; 

	procedure agregarAdelante (var pI : listaAutos2 ; dato : rIncisoD); 
	var
		nue : listaAutos2; 
	begin
		new (nue); 
		nue^.dato:= dato; 
		nue^.sig:= pI; 
		pI:= nue; 
	end; 

	procedure agregarEnLista(var pI : listaAutos2; dato : infoAuto); 
	var
		asignar : rIncisoD; 
	begin
		asignar.patente:= dato.patente; 
		asignar.marca:= dato.marca; 
		asignar.modelo:= dato.modelo;  
		agregarAdelante(pI,asignar); 
	end; 

	procedure cargarVectorFabricacion (a1 : arbol1; var v : vFabricacion); 
	begin
		if (a1 <> nil) then 
			begin
				cargarVectorFabricacion(a1^.HI,v); 
				
					agregarEnLista(v[a1^.dato.anhoFabricacion],a1^.dato); 
				
				cargarVectorFabricacion(a1^.HD,v); 
			end; 
	
	end; 
	
	procedure incisoD (a1 : arbol1; var v : vFabricacion); 
	begin
		inicializarVecFabricacion(v); 
		cargarVectorFabricacion(a1,v); 
	end; 

	procedure mostrarVector (v : vFabricacion) ; 
	var
		i : integer;
		lista : listaAutos2;  
	begin
					writeln ('-----------------------------------------------------------'); 
			for i:= 2010 to 2018 do 
				begin
					lista:= v[i];
						writeln ('Autos con fabricacion en anho ',i, ' : '); 
						while (lista <> nil) do 
							begin
								writeln ('Modelo: ',lista^.dato.modelo); 	
								writeln ('Marca: ',lista^.dato.marca); 
								writeln ('Patente: ',lista^.dato.patente); 
								writeln; 
								lista:= lista^.sig; 
							end; 
							writeln ('-----------------------------------------------------------'); 
				end; 
	end; 


{--------------------------------------------------------------------------------------------------------------------------------------------}	
	{e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.}

function buscarPatente (a : arbol1; patente : string): string; 
begin
	if (a = nil) then 
		buscarPatente:= 'Inexistente'
	else
		begin
			if (a^.dato.patente = patente) then 
				buscarPatente:= a^.dato.modelo
			else
				if (a^.dato.patente < patente) then 
					buscarPatente:= buscarPatente(a^.HI,patente) 
			else 
					if (a^.dato.patente > patente) then 
					buscarPatente:= buscarPatente(a^.HD,buscarPatente); 
		end; 
end; 

procedure moduloE (a : arbol1); 
var
	patenteBuscada,modelo : string; 
begin
	write ('Ingrese una patente para buscar: '); readln (patenteBuscada); 
	modelo:= buscarPatente(a,patenteBuscada); 
	if (modelo <> 'Inexistente') then 
		writeln ('El modelo del auto que le corresponde a la patente ',patenteBuscada, ' es: ',modelo)
	else
		writeln ('No se encontro el auto con la patente buscada.'); 
end; 
{--------------------------------------------------------------------------------------------------------------------------------------------}	
	{f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}
{para hacer este inciso, yo tengo un arbol ordenado por marca, dentro de cada marca tengo una lista de autos
* entonces como tengo que averiguar la patente, y no conozco ningun otro dato, debo recorrer: 
* - En el peor de los casos toda la estructura (la patente puede no existir)
* - Hasta encontrar la patente }

	procedure recorrerLista2 (pI : listaAutos; patente : string; var encontre : boolean; var modelo : string); 
	begin
		while ( ( pI <> nil) and ( encontre = false)) do 
			begin
					if (pI^.dato.patente = patente) then 
						begin
							encontre:= true; 
							modelo:= pI^.dato.modelo; 
						end
					else
						pI:= pI^.sig; 
			end; 
	end; 

	procedure recorrerNodo (a2 : arbol2 ; patente : string; var modelo : string; var encontre : boolean);  
	begin
		if ( (a2 <> nil) and (encontre = false) ) then 
			begin
					recorrerNodo(a2^.HI,patente,modelo,encontre); 
						recorrerLista2(a2^.dato.autos,patente,encontre,modelo); 
					recorrerNodo(a2^.HD,patente,modelo,encontre); 
			end; 
	end; 

	procedure moduloF (a2 : arbol2); 
	var
		patente,modelo : String; 
		encontre : boolean; 
	begin
		encontre:= false; 
		modelo := 'No encontrado'; 
		write ('Ingrese una patente: '); readln (patente); 
		
		recorrerNodo(a2,patente,modelo,encontre); 
		if (modelo <> 'No encontrado') then 
			writeln ('El modelo del auto con patente ',patente, ' es: ',modelo )
		else
			writeln ('No se encontro el auto con la patente ',patente ); 
	end; 


{--------------------------------------------------------------------------------------------------------------------------------------------}	 
 {programa principal}
 var
	a1 : arbol1; 
	a2 : arbol2;  
	v : vFabricacion; 
 begin
	cargarEstructuras(a1,a2); 
	{  writeln ('ARBOL 1, ORDENADO POR PATENTE: '); 
	imprimirArbol1(a1); }
	
		incisoB(a1); 
		
		incisoC(a2); 
		
		incisoD(a1,v);
	    mostrarVector(v); 
		
		moduloE(a1); 
		
		moduloF(a2)
	  {writeln ('ARBOL 2, ORDENADO POR MARCA: '); 
		imprimirArbol2(a2);  } 
 end. 



{
Aca plantee el incisoF con funciones, pero no pude encontrar la forma de que no me devuelva palabras repetidas
 y de que corte de buscar una vez que se encontro la patente. Por eso lo hice con procedimientos y use una variable booleana
	function recorrerListav2 (pI : listaAutos ; patente: String): string; 
	begin
		if (pI = nil) then 
			recorrerListav2:= 'Inexistente'
		else
		begin
				if (pI^.dato.patente <> patente )then
					recorrerListav2:= recorrerListav2(pI^.sig,patente)
				else
					recorrerListav2:= pI^.dato.modelo; 
		end; 
	end;  

	function recorrerNodos (a2 : arbol2 ; patente : string): string; 
	begin
		if (a2 = nil) then 
			recorrerNodos:= 'Inexistente'
		else
			begin
					if (recorrerNodos <> 'inexistente') then
					recorrerNodos:= recorrerListav2(a2^.dato.autos,patente) + recorrerNodos(a2^.HI,patente) + recorrerNodos(a2^.HD,patente); 
			end; 
	end; 




 }

