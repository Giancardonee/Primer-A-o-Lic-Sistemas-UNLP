{ 3. Implementar un programa que contenga: 
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.

b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.

c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.

d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.

e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.

f. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.

g. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.} 
program eje3 ;
type
//-----------------------------------------------------------------------------------------
	rIncisoB = record
		dni : integer;
		legajo : integer;
	end; 

	listaIncisoB = ^nodo3;
	nodo3 = record  
		dato : rIncisoB; 
		sig : listaIncisoB; 
	end; 
	
//-----------------------------------------------------------------------------------------
	rIncisoG = record
		legajo : integer;
		promedio : real;
	end;
	
	listaIncisoG = ^nodo4;
	nodo4 = record
		dato : rIncisoG;
		sig : listaIncisoG;
	end;

//-----------------------------------------------------------------------------------------
	finales  = record
		codigo : integer;
		nota : integer;  {se supone que en los finales te dan notas con valores enteros}
	end; 
	
	listaFinales = ^nodo; 
	nodo = record
		dato : finales; 
		sig : listaFinales;
	end; 

//-----------------------------------------------------------------------------------------	
	alumno = record
		legajo : integer;
		dni: integer;
		anhoIngreso : integer;
		notas : listaFinales;  
	end; 

	arbolAlumnos = ^nodo2; 
	nodo2 = record
		dato : alumno; 
		HI : arbolAlumnos; 
		HD : arbolAlumnos; 
	end;
//-----------------------------------------------------------------------------------------
{b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.}

procedure agregarAdelante (var pI: listaIncisoB; dato : rIncisoB); 
var
	nue : listaIncisoB; 
begin
	new(nue); 
	nue^.dato:= dato; 
	nue^.sig:= pI; 
	pI:= nue; 
end; 
{---------------------------------------------------------------------------------------------------------------------------------}
		{PREGUNTAR EN ALGUNA CLASE}
procedure crearListaB (a : arbolAlumnos; var pI : listaIncisoB; legajo : integer);
var
	aux: rIncisoB; 
begin
	if (a <>nil) then
		begin
			crearListaB(a^.HI,pI,legajo); 
			{------------------------------------------------------------------}
			if (legajo <= a^.dato.legajo) then 
				begin
					 aux.legajo:= a^.dato.legajo; 
					aux.dni:= a^.dato.dni; 
					agregarAdelante(pI,aux);
				end; 
			{------------------------------------------------------------------}
			crearListaB(a^.HD,pI,legajo); 
		end; 
end; 
{---------------------------------------------------------------------------------------------------------------------------------}
{c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.}
function retornarLegajoMax (a : arbolAlumnos): integer;
begin
	if ( a = nil) then 
		retornarLegajoMax:= -1 {lista vacia}
	else
		if (a^.HD = nil) then 
			retornarLegajoMax:= a^.dato.legajo
		else
			retornarLegajoMax:= retornarLegajoMax(a^.HD); 
end;

procedure incisoC (a : arbolAlumnos); 
begin
	writeln ('El numero de legajo maximo es: ',retornarLegajoMax(a)); 
end;
{---------------------------------------------------------------------------------------------------------------------------------}
	{d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.}
	
	
	function retornarDniMax (a : arbolAlumnos; max: integer) : integer;
	begin
		if ( a = nil) then 
			retornarDniMax:= max
		else
			begin
				retornarDniMax:= retornarDniMax(a^.HI,max); 
					if (a^.dato.dni > max) then 
						max:= a^.dato.dni; 
				retornarDniMax:= retornarDniMax(a^.HD,max); 
			end;
	end;
	
	procedure incisoD (a : arbolAlumnos); 
	var
		max : integer;
	begin
		max:= -1; 
		writeln ('El dni mas grande es: ',retornarDniMax(a,max)); 
	end;
	
	
{---------------------------------------------------------------------------------------------------------------------------------}
 {e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.}
	function CantLegajoImpar ( a  : arbolAlumnos; cant : integer): integer;
	begin
		if (a = nil) then 
			CantLegajoImpar:= cant
		else
			begin
					CantLegajoImpar:= CantLegajoImpar(a^.HI,cant); 
					if ((a^.dato.legajo mod 2) <> 0) then 	
						cant:= cant + 1;
					CantLegajoImpar:= CantLegajoImpar(a^.HD,cant); 
			end
	end;
	
	procedure incisoE (a : arbolAlumnos); 
	var
		cant : integer;
	begin
		cant:=0 ;
		writeln ('La cantidad de legajos impares son: ',CantLegajoImpar(a,cant));
	
	end;
{---------------------------------------------------------------------------------------------------------------------------------}
{ f. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.}
	
	procedure actualizarDatos (var legajoMax: integer; var promedioMax: real; promedio : real; legajo : integer); 
	begin
		legajoMax:= legajo;
		promedioMax:= promedio;
	end;
	
	function promediar (cant, sumaNotas: integer): real;
	begin
		promediar:= (sumaNotas / cant); 
	end; 
	
	function calcularPromedio (notas : listaFinales): real; 
	var
		cant,sumaNotas: integer;
	begin
		cant:= 0; 
		sumaNotas:= 0;
		while (notas <>nil) do 
			begin
					cant:= cant + 1 ;
					sumaNotas:= sumaNotas + notas^.dato.nota; 
					notas:= notas^.sig; 
			end;
			calcularPromedio:= promediar(cant,sumaNotas);
	end;
	
	procedure sacarMax ( a : arbolAlumnos; var legajoMax : integer; var promedioMax : real);
	var
		promedio: real;
	begin
		if ( a<> nil) then 
			begin
					sacarMax(a^.HI,legajoMax,promedioMax); 
						promedio:= calcularPromedio(a^.dato.notas);
						if (promedio > promedioMax) then 
							actualizarDatos(legajoMax,promedioMax,promedio,a^.dato.legajo); 
					sacarMax(a^.HD,legajoMax,promedioMax); 
			end;
	end; 
	
	procedure incisoF (a : arbolAlumnos); 
	var
		legajoMax: integer;
		promedioMax: real;
	begin
		legajoMax:= -1;
		promedioMax:= -1;
		sacarMax(a,legajoMax,promedioMax); 
		writeln ('El promedio maximo fue: ',promedioMax:2:2); 
		writeln ('Y le pertenece al legajo nro ',legajoMax); 
	end;
 
 
 {---------------------------------------------------------------------------------------------------------------------------------}
	{g. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}
	
	procedure agregarAdelante (var pI : listaIncisoG; dato : rIncisoG); 
	var
		nue : listaIncisoG;
	begin
		new(nue); 
		nue^.dato:= dato;
		nue^.sig:= pI;
		pI:= nue; 
	end;
	
	procedure asignarDatos (var aux : rIncisoG; nroLegajo : integer; promedio : real); 
	begin
		aux.legajo:= nroLegajo; 
		aux.promedio:= promedio; 
	end; 
	
	procedure cargarListaG (a : arbolAlumnos; var pI : listaIncisoG ; promedioIngresado : real); 
	var
		promedioActual : real;
		aux : rIncisoG;
	begin
		if (a <>nil) then 
			begin
					cargarListaG(a^.HD,pI,promedioIngresado); 
						promedioActual:= calcularPromedio(a^.dato.notas);
						if (promedioActual > promedioIngresado) then
							begin
								asignarDatos(aux,a^.dato.legajo,promedioActual); 
								agregarAdelante(pI,aux);
							end;		
					cargarListaG(a^.HD,pI,promedioIngresado); 
			end;
	end; 
	
	
	procedure incisoG (a : arbolAlumnos; var pI : listaIncisoG); 
	var
		promedioMin: real;
	begin
		pI:= nil; {inicializo la lista}
		writeln ('Ingrese un promedio minimo: '); 
		readln (promedioMin);
		cargarListaG(a,pI,promedioMin); 
	end; 
 
  {---------------------------------------------------------------------------------------------------------------------------------}
procedure imprimirListaB (pI : listaIncisoB); 
begin
	if (pI <> nil) then 
		begin
			writeln ('Numero de legajo: ',pI^.dato.legajo);
			writeln ('Dni: ',pI^.dato.dni); 
			imprimirListaB(pI^.sig); 
		end; 
end; 

procedure incisoB (a: arbolAlumnos; var pI : listaIncisoB ); 
var
	num : integer;
begin
	pI:= nil; {inicializamos la lista}
	writeln (' - - - - - - - - - - - - - - - - - - - - - - - -');
	writeln ('Estas en el inciso B');
	write ('Ingrese un numero: '); 
	readln (num); 
	crearListaB(a,pI,num);
	imprimirListaB(pI); {para ver si se cargo bien} 
	writeln (' - - - - - - - - - - - - - - - - - - - - - - - -');
end; 
//-----------------------------------------------------------------------------------------
	procedure inicializarLista (var pI : listaFinales); 
	begin
		pI:= nil; 
	end; 

	procedure inicializarArbol (var a : arbolAlumnos); 
	begin
		a:= nil; 
	end; 

	procedure agregarAdelante (var pI : listaFinales; dato : finales); 
	var
		nue : listaFinales; 
	begin
		new(nue); 
		nue^.dato:= dato; 
		nue^.sig:= pI;
		pI:= nue; 
	end; 

	{se puede hacer recursivo este modulo tamb}
	procedure leerNotas (var pI : listaFinales);
	var
		f : finales;
	begin
		inicializarLista(pI);
		write ('Ingrese el codigo de la materia: '); 
		readln (f.codigo);
			while( f.codigo <> -1) do  
				begin
					write ('Ingrese la nota obtenida: '); 
					readln (f.nota); 
					agregarAdelante(pI,f); 
							write ('Ingrese el codigo de la materia: '); 
							readln (f.codigo);
				end; 
	end; 
	
	procedure leerAlumno (var a : alumno); 
	begin
		write ('Ingrese el legajo: '); readln (a.legajo); 
			if (a.legajo <>0) then 
				begin
							write ('Ingrese el dni: '); readln (a.dni); 
							write ('Ingrese el anho de ingreso: '); readln (a.anhoIngreso); 
							leerNotas(a.notas);
				end; 
	end; 

	procedure agregarEnArbol (var a: arbolAlumnos; dato : alumno); 
	begin
		if (a = nil) then 
			begin
				new(a); 
				a^.dato:= dato; 
				a^.HI:= nil;
				a^.HD:= nil;
			end
		else
			begin
				if (dato.legajo < a^.dato.legajo) then 
					agregarEnArbol(a^.HI,dato)
				else
					agregarEnArbol(a^.HD,dato); 
			end; 
	end; 

	procedure cargarArbol (var a: arbolAlumnos); 
	var
		alum : alumno; 
	begin
		leerAlumno(alum); 
			if (alum.legajo <>0) then 
				begin
				agregarEnArbol(a,alum); 	
					cargarArbol(a); 
				end; 	
	end; 
	
	procedure imprimirArbol (a : arbolAlumnos); 
	begin
		if (a <> nil) then 
			begin
				imprimirArbol(a^.HI);
					writeln ('numero de legajo : ',a^.dato.legajo); 
				imprimirArbol(a^.HD); 
			end
		else
			writeln ('Se termino de imprimir el arbol');  
			
	end; 
	
	{programa principal}
	var
		a : arbolAlumnos; 
		ListaB : listaIncisoB; 
		ListaG : listaIncisoG; 
	begin
//-----------------------------------------------------------------------------------------		
	{inciso a}
		inicializarArbol(a); 
		cargarArbol(a);
		imprimirArbol(a);{para ver si se cargo bien} 
//-----------------------------------------------------------------------------------------
		incisoB(a,ListaB); 
//-----------------------------------------------------------------------------------------
		incisoC(a); 
//-----------------------------------------------------------------------------------------
		incisoD(a); 
//-----------------------------------------------------------------------------------------
		incisoE(a); 
//-----------------------------------------------------------------------------------------
		incisoF(a); 
//-----------------------------------------------------------------------------------------
		incisoG(a,ListaG); 
//-----------------------------------------------------------------------------------------
	end. 
