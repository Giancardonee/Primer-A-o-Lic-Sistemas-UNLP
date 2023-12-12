{2.- Implementar un programa que procese información de propiedades que están a la venta
en una inmobiliaria.
Se pide:
* 
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades
agrupadas por zona. 
* 
-----> Las zonas van de 1 a 5 ,asique asumo que debe ser un vector, donde cada zona tenga sus propiedades
* es decir, un vector de listas


 Las propiedades de una misma zona deben quedar almacenadas
ordenadas por tipo de propiedad. 
* 
-----> La lista debe ordenarse por tipo de propiedad, es decir, tipo 'casa', 'departamento' ,etc


Para cada propiedad: 
debe almacenarse el código, el tipo de propiedad y el precio total. 
----> Es decir en la lista debo almacenar estos campos:  
* código, el tipo de propiedad y el precio total. 
* 
 
 
De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado.
--------> El precio total lo saco de multiplicar la cant de metros cuadrados * el precio de metros cuadrados


 La lectura finaliza
cuando se ingresa el precio del metro cuadrado -1.



b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido. 

---> Aca por lo que entendi, es: agarrar la posicion del vector (nro de zona) y despues informar las propiedades
de ese numero de zona, pero filtrando por tipo de propiedad.

}

program eje2;
const
	cantZonas=5;
type
	rangoZonas = 1..cantZonas;
	str20 = string[20]; 
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//Registro propiedades auxiliar, sobre este registro vamos a leer propiedades
	aux = record
		codigo : integer;
		zona : rangoZonas;
		tipo : str20; 
		cantMetrosCuadr : real;
		precioMetroCuadr : real;
	end;
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//Lista propiedades, sobre este registro vamos a almacenar propiedades
	propiedades = record
		codigo : integer;
		tipo : str20 ;
		precio : real;
	end;
	
	listaPropiedades = ^nodo;
	nodo = record
		dato : propiedades;
		sig : listaPropiedades; 
	end;
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	vectorZonas = array [rangoZonas] of listaPropiedades;
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// creo la nueva lista para retornar en el inciso b
pBuscadas = record
	codigo : integer;
	tipo : str20;
end;

ListaP_Buscadas = ^nodo2; 
nodo2 = record
	dato : pBuscadas;
	sig : ListaP_Buscadas; 
end;

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		{modulos}

procedure inicializarListas (var v: vectorZonas); 
var
	i : rangoZonas;
begin
	for i:= 1 to cantZonas do 
		v[i]:= nil;
end;
		
procedure LeerPropiedad (var p : aux);
begin
	writeln ('Ingrese el precio del metro cuadrado: ');
	readln (p.precioMetroCuadr);
	if (p.precioMetroCuadr <> -1) then 
		begin
			writeln ('Ingrese la cantidad de metros cuadrados: '); 
			readln (p.cantMetrosCuadr); 
			writeln ('Ingrese la zona (entre 1 y 5)'); 
			readln (p.zona); 
			writeln ('Ingrese el tipo de propiedad (casa, departamento ,etc): '); 
			readln (p.tipo);
			writeln ('Ingrese el codigo de propiedad: '); 
			readln (p.codigo); 
		end;
end;

procedure insertarOrdenado (var pI : listaPropiedades; dato : propiedades); 
var
	anterior, actual, nuevo : listaPropiedades;
begin
	new (nuevo);
	nuevo^.dato:= dato;
	actual:= pI; 
		while ( (actual <> nil) and (actual^.dato.tipo < dato.tipo)) do 
			begin
				anterior:= actual;
				actual:= actual^.sig; 
			end;
			if ( actual = pI ) then 
				pI:= nuevo
			else
				anterior^.sig:= nuevo;
	nuevo^.sig:= actual;	
end;

procedure asignarPropiedad (pAux : aux; var p : propiedades);
begin
		p.codigo := pAux.codigo;
		p.precio:= (pAux.cantMetrosCuadr * pAux.precioMetroCuadr); 
		p.tipo:= pAux.tipo; 				
end; 
	
procedure agregarPropiedad (p: propiedades; var vZonas : vectorZonas; tipoZona : rangoZonas);
begin
		insertarOrdenado(vZonas[tipoZona],p); 
end;	

procedure cargarLista (var vZonas : vectorZonas);
var
	pAux: aux; 
	p : propiedades; 
begin
		LeerPropiedad(pAux); 
		while (pAux.precioMetroCuadr <> -1) do 
			begin
					asignarPropiedad(pAux,p); 
					agregarPropiedad(p,vZonas,pAux.zona); 
					LeerPropiedad(pAux); 
			end;
end;

procedure pedirDatos(var tipo: str20; var zona : rangoZonas); 
begin
	writeln ('Ingrese una zona (entre 1 y 5): '); 
	readln (zona); 
	writeln ('Ingrese un tipo de propiedad ( casa, departamento,oficina ): ');
	readln(tipo); 
end;

procedure asignarRegistro (var propBuscadas : pBuscadas; codigo: integer; tipoPropiedad: str20);
begin
	propBuscadas.codigo:= codigo;
	propBuscadas.tipo:= tipoPropiedad; 
end;

procedure agregarNuevaLista (var pI: ListaP_Buscadas; dato: pBuscadas); 
var 
	nuevo : ListaP_Buscadas;
begin
	new (nuevo); 
	nuevo^.dato:= dato;
	nuevo^.sig:= pI;
	pI:= nuevo;
end;

procedure incisoB (vZonas : vectorZonas; nroZona: rangoZonas; tipoPropiedad: str20; var listaNueva : ListaP_Buscadas); 
var
zonaBuscada : listaPropiedades;
propiedadesBuscadas : pBuscadas; 
begin
	zonaBuscada := vZonas[nroZona];
	while (zonaBuscada <> nil) do 
		begin
		
			if (zonaBuscada^.dato.tipo = tipoPropiedad) then 
				begin
					asignarRegistro (propiedadesBuscadas, zonaBuscada^.dato.codigo, zonaBuscada^.dato.tipo); 
					agregarNuevaLista(listaNueva,propiedadesBuscadas);
				end; 
				
				zonaBuscada:= zonaBuscada^.sig;
		end;

end;
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{esto lo hice para ver si funciona todo bien}
procedure mostrarListaCompleta (vZonas : vectorZonas); 
var
	i : rangoZonas;
begin
		for i:= 1 to cantZonas do 
			begin

				writeln ('Zona ',i, ': ' ); 
				while (vZonas[i] <> nil) do 
					begin
						writeln ('El tipo es: ',vZonas[i]^.dato.tipo);
						writeln ('El codigo es: ',vZonas[i]^.dato.codigo);
						writeln ('El precio es: ',vZonas[i]^.dato.precio:0:2);
						vZonas[i]:= vZonas[i]^.sig;
					end;
					writeln; 
			end;
	writeln ('Se termino de leer la lista de propiedades.'); 
end;
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{esto lo hice para ver si la nueva lista del inciso b se crea correctamente}
 procedure mostrarListaNueva (nueva : ListaP_Buscadas; tipoPropiedad : str20); 
 begin
	writeln ('El tipo de propiedades son: ',tipoPropiedad);
	while (nueva <> nil) do 
		begin
			writeln ('El codigo de la propiedad es: ',nueva^.dato.codigo);
			nueva:= nueva^.sig;
		end;
		
 end;
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



{programa principal}
var
vZonas : vectorZonas;
listaNueva : ListaP_Buscadas; 

nroZona : rangoZonas;
tipoPropiedad: str20; 
begin
	inicializarListas (vZonas); 
	cargarLista(vZonas); 
	mostrarListaCompleta(vZonas); 
	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	//inciso B
	pedirDatos(tipoPropiedad,nroZona); 
	incisoB(vZonas,nroZona,tipoPropiedad,listaNueva); 
	mostrarListaNueva(listaNueva,tipoPropiedad); 
	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
end.

