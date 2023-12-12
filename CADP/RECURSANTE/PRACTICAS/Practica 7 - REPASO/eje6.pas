{
El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. 
* Los objetos se clasifican en 7 categorías: 1: estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos:
*  código del objeto, categoría del objeto (1..7), nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su descubrimiento.

A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados.
*  Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe procesarse). 
* La estructura generada debe mantener el orden en que fueron leídos los datos. [ LISTA , agregar al final ]

B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
			informo codigos de los dos objetos max distancia 
			facil, calculo dos maximos y me guardo los codigos
			
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
						Si es Galileo Galilei, y el objeto es un planeta ( codigo 2 ), lo sumo 
						 a la variable contadora 
					
3. La cantidad de objetos observados por cada categoría.
				vContador donde voy incrementando a medida
				 que recorro la lista


4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.
				informo( si cumple la condicion )a medida que proceso la lista 
}

	program eje6;
	const
		cantCategorias = 7;
	type
		str20 = string[20]; 
		rCategorias = 1..cantCategorias;
		rangoAnhos = 1400..2023; 
		
		objeto = record
				codObjeto : integer; 
				categoria : rCategorias; 
				nombre : str20; 
				distancia : real;
				descubridor : str20;
				anhoDescubrimiento :  rangoAnhos ; 
		end;
		
		{ aca voy a almacenar los datos}
		listaObjetos = ^nodo;
		nodo = record
				elemento : objeto;
				siguiente: listaObjetos;
		end;
	
		{ Para el vector, nose si es necesario o no el nombre (deberia usar un registro con nombre y cant) , porque 
		* se accede con el numero ( del 1 al 7)  pero lo que importa para hacer el inciso 3 es la cantidad.
		se podria hacer solamente siendo un vector de integer, como hice en este caso }
		
		vCategorias = array [rCategorias] of  integer ; 
		
		procedure inicializarVcategorias ( var v : vCategorias); 
		var
			i : integer;
		begin
			for i:= 1 to cantCategorias do 
				begin
					v[i]:= 0 ; 
				end;
		end;
		
		procedure crearLista (var pi: listaObjetos); 
		begin
				pi:= nil;
		end; 
		
		procedure LeerObjeto (var o : objeto); 
		begin
			write ('Ingrese el codigo del objeto: '); readln (o.codObjeto);
			if ( o.codObjeto <> -1 ) then 
				begin
					write ('Ingrese la categoria ( de 1 a 7 ): '); readln (o.categoria); 
					write ('Ingrese el nombre del objeto: '); readln (o.nombre); 
					write ('Ingrese la distancia a la Tierra (medida en años luz): '); readln (o.distancia); 
					write ('Ingrese el nombre del descubridor: '); readln (o.descubridor); 
					write ('Ingrese el anho de descubrimiento: '); readln (o.anhoDescubrimiento); 	
				end;
		end;
		
		procedure agregarAlFinal (var pI,pU : listaObjetos; dato : objeto); 
		var
			nuevo : listaObjetos;
		begin
			new (nuevo); 
			nuevo^.elemento:= dato;
			nuevo^.siguiente:= nil;
			
			if (pI = nil ) then 
				pI:= nuevo
			else
				pU^.siguiente:= nuevo;
			pU:= nuevo; 
		end;
		
		procedure cargarLista (var pI,pU : listaObjetos); 
		var
			obj : objeto; 
		begin
			LeerObjeto(obj);
			while (obj.codObjeto <> -1) do 
				begin
					agregarAlFinal(pI,pU,obj); 
					LeerObjeto(obj); 
				end; 
		end; 
		
		{ 1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.}
		procedure calcularObjetosMasLejos ( codObjeto : integer ;  distancia : real; var max1,max2: real;  codMax1,codMax2: rCategorias); 
		begin
			if ( distancia > max1 ) then 
				begin
					max2:= max1; 
					max1:= distancia; 
					codMax2:= codMax1; 
					codMax1:= codObjeto;
				end
			else
				if ( distancia > max2 ) then 
					begin
						max2:= distancia; 
						codMax2:= codObjeto; 
					end; 
		end; 
		{ 2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600. }
		function cumpleCondicion (codCategoria : rCategorias; descubridor: str20; anho : integer): boolean;
		begin
			cumpleCondicion:= (  (codCategoria = 2) and ( descubridor = 'Galileo Galilei') and (anho <1600)  ); 
		end; 

		{ 4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares. }
		function esEstrella ( cat : integer): boolean;
		begin
			esEstrella:=  ( cat = 1 ) ; 
		end;
		
		function tieneMasDigPares ( codObjeto : integer): boolean;
		var
			dig : integer;
			cantP,cantI : integer;
		begin
				cantP:= 0;
				cantI:= 0;
				while ( codObjeto <> 0) do 
					begin
						
						dig:= codObjeto mod 10; 
						
							if ( ( dig mod 2)  = 0) then 
								cantP:= cantP + 1
							else
								cantI:= cantI  + 1;
						
						codObjeto:= codObjeto div 10;		
					end;
				tieneMasDigPares:= (cantP > cantI); 
		end;
		
			procedure informarCantObjPorCategoria ( v: vCategorias); 
		var
			i : integer;
		begin
				for i:= 1 to cantCategorias do 
					writeln ('En la categoria ',i, ' se observaron ',v[i], ' elementos.'  ); 
		end;
		
		procedure procesarLista (pI : listaObjetos; var v : vCategorias); 
		var
			max1,max2: real;
			codMax1,codMax2 : rCategorias;
			cantInciso2 : integer;
		begin
			max1:= -1;
			max2:= -1; 
			cantInciso2:= 0;	
			codMax1:= 1; codMax2:=1; 
			while ( pI <> nil ) do 
				begin
					{ 1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.}
						calcularObjetosMasLejos(pI^.elemento.codObjeto,pI^.elemento.distancia,max1,max2,codMax1,codMax2); 
					
					{ 2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600. }
							if (cumpleCondicion(pI^.elemento.categoria,pI^.elemento.descubridor,pI^.elemento.anhoDescubrimiento)) then 
								cantInciso2:= cantInciso2 + 1;
					
					{ 3. La cantidad de objetos observados por cada categoría. }
						    {lo calculo aca, lo informo en el programa principal}
						v[pI^.elemento.categoria]:= v[pI^.elemento.categoria] + 1; 
						
					{  4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares. }
						if ( ( esEstrella(pI^.elemento.categoria)) and (tieneMasDigPares(pI^.elemento.codObjeto) ) ) then
								writeln ('La estrella con nombre ',pI^.elemento.nombre, ' tiene en su cod de objeto mas digitos pares que impares' ); 
						
					pI:= pI^.siguiente; 
				end; 
					{ informo inciso 1 }
					writeln ('Los codigos de los dos objetos mas lejanos son: ',codMax1, ' y' ,codMax2 ); 
					{ informo inciso 2 }
					writeln ('La cantidad de planetas descubiertos por Galileo Galilei ,antes del anho 1600 son: ',cantInciso2); 
					
		end; 
		
	
		{ programa principal }
		var 
			pI,pU: listaObjetos; 
			v : vCategorias;
		begin
			crearLista(pI); 
			inicializarVcategorias(v); 
			cargarLista(pI,pU); 
			procesarLista(pI,v); 
			informarCantObjPorCategoria(v); 
		end.
	
	
