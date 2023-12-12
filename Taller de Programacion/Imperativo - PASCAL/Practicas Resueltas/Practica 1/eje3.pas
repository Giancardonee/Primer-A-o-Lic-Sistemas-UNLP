{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

--> --> vector de [1..8] donde cada pos es una lista de peliculas, con un insertar atras.
* es decir en cada categoria, debe quedar almacenado en el orden que se lea 


b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
--> --> El modulo recibe la el vector de listas (estructura generada en a), y despues retorna un vector de [1..8] con codigo de pelicula 
* con mayor puntaje de criticas (para esto debo recorrer toda la lista de la categoria n)

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.

--> --> Ordeno el vectorPuntajes por metodo de insercion o seleccion

d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).

--> --> Segun como lo ordene, si lo ordeno de menor a mayor, el codigo depelicula con menor puntaje es la pos 1, y
*  el codigo de pelicula con mayor puntaje es la ultima pos, en este caso la dimF (8) 
}

program eje3; 
const
	cantGeneros = 8;
type
	rangoGeneros = 1..cantGeneros;
	
	pelicula = record
		codPelicula : integer;
		codGenero : rangoGeneros;
		promedioCriticas : real;
	end;
	
	listaPeliculas = ^nodo;
	
	nodo = record
		dato : pelicula;
		sig : listaPeliculas;
	end;
	
	vPeliculas = array [rangoGeneros] of listaPeliculas; 
	
	rAux = record
		codPelicula : integer;
		promedioCriticas : real;
	end;
	
	vMaxCriticas = array [rangoGeneros] of rAux;
	
	procedure LeerPeliculas (var p : pelicula); 
	begin
		write ('Ingrese el codigo de pelicula: '); 
		readln (p.codPelicula); 
			if (p.codPelicula <> -1) then 
				begin
					write ('Ingrese el codigo de genero (entre 1 y 8): '); 
					readln (p.codGenero); 
					write ('Ingrese el promedio de las criticas'); 
					readln (p.promedioCriticas); 
				end;
	end;
	
	procedure inicializarVec_List (var v : vPeliculas);
	var
		i : integer;
	begin
		for i:= 1 to cantGeneros do 
			v[i]:= nil;
	end;
	
	procedure agregarAtrasIneficiente (var pI : listaPeliculas; dato : pelicula); 
	var
		nue,ant,act : listaPeliculas;
	begin
		new (nue);
		nue^.dato:= dato;
		act:= pI; 
		ant:= pI;
			while (act <> nil) do 
				begin
					ant:= act;
					act:= act^.sig;
				end;
		if (ant = act) then
			pI:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;

	procedure cargarLista (var v: vPeliculas); 
	var 
		p : pelicula; 
	begin
		LeerPeliculas(p);
			while (p.codPelicula <> -1) do 
				begin
					agregarAtrasIneficiente(v[p.codGenero],p); 
					LeerPeliculas(p); 
				end; 
	end;
	
	{ b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a).. } 
	
	procedure inicializarVMAX (var v : vMaxCriticas);
	var
		i : rangoGeneros; 
	begin
		for i:= 1 to cantGeneros do 
			begin
							v[i].codPelicula:= -1;
							v[i].promedioCriticas:= -1; 
			end;
	end; 
	
	procedure asignarPeliMaxCritica (var v : vMaxCriticas; peli : pelicula); 
	begin
		v[peli.codGenero].codPelicula:= peli.codPelicula; 
		v[peli.codGenero].promedioCriticas:= peli.promedioCriticas; 
	end;
	
	procedure incisoB (vP : vPeliculas; var vM : vMaxCriticas); 
	var
		max : real;
		generoAct : rangoGeneros;  
		actual : listaPeliculas;
		peliculaMax : pelicula; 
	begin
		inicializarVMAX(vM); 
	
		for generoAct:= 1 to cantGeneros do 
			begin
				max:= -1;
				actual:= vP[generoAct]; 
				while (actual <> nil) do 
					begin
								if (actual^.dato.promedioCriticas > max) then 
									begin
										max:= actual^.dato.promedioCriticas;
										peliculaMax:= actual^.dato; 
									 end;
					actual:= actual^.sig; 
							
					end; 
			{este if lo hago para que agregue solamente si se cargo alguna pelicula en el genero}
					if (max <> -1) then 
					asignarPeliMaxCritica(vM,peliculaMax); 
					//empieza una nueva iteracion sobre otro genero
			end;
	end; 
	
	procedure ordenarInsercion (var v : vMaxCriticas);
	var
		i,j : integer;
		actual : rAux;
	begin
		for i:= 2 to cantGeneros do 
			begin
				actual:= v[i];
				j:= i-1;
					while ( (j > 0) and (v[j].promedioCriticas > actual.promedioCriticas) ) do 
						begin
							v[j+1]:= v[ j ]; 
							j:= j - 1 ;
						end; 
				v[j+1]:= actual;
			end;
	end;
	
	
	{como esta ordenado de menor a mayor: 
	* 	si tengo que mostrar la pelicula con menor puntaje es la pos 1
	*	si tengo que mostrar la pelicula con mayor puntaje es la ult pos}
	procedure incisoD (v : vMaxCriticas); 
	begin
		writeln ('Pelicula con mayor puntaje maximo: ',v[cantGeneros].codPelicula);
		writeln ('Pelicula con menor puntaje maximo: ',v[1].codPelicula);
	end;
	
	{programa principal}
	var
		
		vP : vPeliculas;
		vMax : vMaxCriticas;
	begin
		inicializarVec_List(vP); 
		cargarLista(vP); 
		incisoB (vP,vMax); 
		ordenarInsercion(vMax); 
		incisoD(vMax); 
	end.
