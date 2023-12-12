{
* Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:

a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
	De cada final rendido se lee el código del alumno,
	 el código de materia y la nota (valor entre 1 y 10).
	La lectura de los finales finaliza con nota -1

	i. Una estructura que para cada alumno se almacenen sólo código y nota de las
	materias aprobadas (4 a 10).  
	La estructura debe ser eficiente para buscar por código de alumno.\
	* 
 -->> Esta estructura es un arbol ordenado por codigo de alumno, donde cada alumno tiene: 
		-codigo de  alumno
		- lista de notas de sus materias aprobadas (codigo de materia: integer  y nota: real) 
	
	ii. Otra estructura que almacene para cada materia, su código y todos los finales
	rendidos en esa materia (código de alumno y nota).
	
-->> se saben que son 30 materias, por lo tanto un vector de [1..30] of (codMateria, listaFinalesRendidos (codAlum y nota))



b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.

c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.
* }

program eje3; 
const
	cantMaterias = 30;
type
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
	rangoAprobado = 4..10;
	rangoNotas = -1..10;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
registroLeer = record
	codMateria: integer;
	codAlumno : integer;
	nota : rangoNotas;
end;


{declaraciones para estructuras i}
	rLista1 = record
		codMateria : integer;
		nota : rangoAprobado;
	end;
	
	listaAprobados = ^nodo2;
	nodo2 = record
		dato : rLista1;
		sig : listaAprobados; 
	end;
	
	rArbol = record
		codAlumno : integer;
		finalesAprobados: listaAprobados; 
	end;
	
	estructura_i = ^nodo;
	nodo = record
		dato : rArbol;
		HD: estructura_i;		
		HI: estructura_i;
	end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
{declaraciones para estructuras ii}
	rLista2 = record
		codAlumno : integer;
		nota : rangoNotas;
	end;
	
	listaFinales = ^nodo3;
	nodo3 = record
		dato : rLista2;
		sig : listaFinales;
	end;
	
	rMaterias = record
		codMateria : integer;
		finales : listaFinales;
	end;
	
	vMaterias = array [1..cantMaterias] of rMaterias; 
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
{declaraciones para estructura inciso b}

rIncisoB = record
	codAlumno : integer;
	promedio : real;
end;

listaIncisoB =^nodo4;
nodo4 = record
	dato : rIncisoB;
	sig : listaIncisoB; 
end;



{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
					{	modulos	}
		{modulos para inicializar lista y arbol}
	procedure inicializarLista (var pI : listaAprobados);
	begin
		pI:= nil;
	end;

	procedure inicializarArbol (var a : estructura_i); 
	begin
		a:= nil;
	end;

	procedure inicializarListaVec (var v : vMaterias); 
	var
		i : integer;
	begin
		for i:= 1 to cantMaterias do 
			v[i].finales:= nil; 
	end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
		{modulos para cargar estructuras}
	
	procedure leerFinal (var f : registroLeer); 
	begin
		write ('Ingrese la nota: '); readln(f.nota); 
			if (f.nota <> -1) then 
				begin
					write ('Ingrese el codigo de materia: '); readln (f.codMateria); 
					write ('Ingrese el codigo de alumno: '); readln (f.codAlumno); 
				end;
	end;

	function aproboMateria (nota : integer): boolean;
	begin
		aproboMateria:= nota>=4; 
	end;

	procedure asignarDatos (dato : registroLeer; var aux: rArbol);
	begin
		aux.codAlumno:= dato.codAlumno;
		aux.finalesAprobados:= nil; 
	end;

	procedure agregarNota (var pi : listaAprobados; codMateria : integer; nota : rangoAprobado); 
	var
		nue : listaAprobados;
	begin
		new (nue); 
		nue^.dato.codMateria:= codMateria;
		nue^.dato.nota:= nota; 
		nue^.sig:= pI;
		pI:= nue;
	end;

	procedure crearNodo (var a : estructura_i; dato : registroLeer);
	var
		aux: rArbol;
	begin
				new(a);
				asignarDatos (dato,aux);
				inicializarLista(aux.finalesAprobados); 
				agregarNota(aux.finalesAprobados,dato.codMateria,dato.nota);   // lista de aprobados, codigo y nota de materia
				a^.dato:= aux; 
				a^.HI:= nil;
				a^.HD:= nil;
	end;

	procedure cargarEnArbol (var a : estructura_i; dato : registroLeer); 
	begin
		if (a = nil) then 
			begin
				crearNodo(a,dato); 
			end
		else
			begin
					if (dato.codAlumno < a^.dato.codAlumno) then {si el codigo de alumno es menor}
						cargarEnArbol(a^.HI,dato)
					else
						if (dato.codAlumno > a^.dato.codAlumno)then {si el codigo de alumno es mayor}
							cargarEnArbol(a^.HD,dato)
					else																							{si el codigo de alumno esta repetido}
							agregarNota(a^.dato.finalesAprobados,dato.codMateria,dato.nota); 
			end;
	end;


	{ ii. Otra estructura que almacene para cada materia, su código y todos los finales
	rendidos en esa materia (código de alumno y nota) }

	procedure asignarDatos2 (dato : registroLeer; var aux : rLista2); 
	begin
			aux.nota:= dato.nota;
			aux.codAlumno:= dato.codAlumno; 
	end;

	procedure agregarFinal (var pI: listaFinales; dato : rLista2); 
	var
		nue : listaFinales;
	begin
		new (nue); 
		nue^.dato:= dato;
		nue^.sig:= pI; 
		pI:= nue; 
	end; 


	procedure cargarVmaterias(var v : vMaterias; dato :  registroLeer); 
	var
		aux : rLista2;
	begin
		asignarDatos2(dato,aux); 
		agregarFinal(v[dato.codMateria].finales,aux); 
	end; 

	procedure cargarEstructuras (var a : estructura_i; var v : vMaterias); 
	var
		aux: registroLeer;
	begin
		writeln ('-->>    EMPIEZA LA CARGA');
		leerFinal (aux); 
			while (aux.nota <> -1) do 
				begin
						if (aproboMateria(aux.nota)) then 
							cargarEnArbol (a,aux); 
						cargarVmaterias(v,aux); 
						writeln ; {salto de linea}
					leerFinal (aux); 
				end;
			writeln ('-->>   TERMINO LA CARGA DE FINALES.');
				writeln; 
	end;

	procedure imprimirListaAprobados (pI : listaAprobados); 
	begin
		while (pI <> nil) do 
			begin
				writeln ('Codigo de materia ',pI^.dato.codMateria, ' nota: ',pI^.dato.nota ); 
					pI:= pI^.sig;
			end;
	end;

	procedure imprimirArbol (a : estructura_i); 
	begin
		if (a<> nil) then 
			begin
				imprimirArbol(a^.HI);
					writeln ('->> Alumno ',a^.dato.codAlumno, ' ,sus finales aprobados son: ' ); 
					imprimirListaAprobados(a^.dato.finalesAprobados); 
					writeln; 
				imprimirArbol(a^.HD); 
			end;
	end;

	procedure imprimirListaFinales (pI : listaFinales); 
	begin
		while (pI <> nil) do 
			begin
				writeln ('Alumno con codigo ',pI^.dato.codAlumno, ' nota: ',pI^.dato.nota ); 
					pI:= pI^.sig; 
			end;
	end; 

	procedure imprimirVecMaterias ( v : vMaterias); 
	var
		i : integer;
	begin
		for i:= 1 to cantMaterias do 
			begin
				writeln ('-->>Datos de la materia ',i); 
				imprimirListaFinales(v[i].finales); 
			end;
	end;

	{b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
	códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.}
	
	procedure inicializarListaB (var pI : listaIncisoB);
	begin
		pI:= nil; 
	end;
	
	procedure agregarEnListaB (var pI : listaIncisoB; dato : rIncisoB); 
	var
		nue : listaIncisoB; 
	begin
		new (nue); 
		nue^.dato:= dato;
		nue^.sig:= pI;
		pI:= nue;
	end;
	
	function calcularPromedio (cantNotas : integer; sumaNotas : real): real;
	begin
		calcularPromedio:= (sumaNotas / cantNotas); 
	end;
	
	procedure asignarDatos3(sumaNotas: real; cantNotas: integer; var aux : rIncisoB; codAlu : integer); 
	begin
		aux.promedio:= calcularPromedio(cantNotas,sumaNotas); 
		aux.codAlumno:= codAlu; 
	end;

	procedure cargarListaB (dato : rArbol; var pI : listaIncisoB); 
	var
		cantNotas : integer;
		sumaNotas:  real;
		aux : listaAprobados; 
		aux2: rIncisoB ; 
	begin
		cantNotas:= 0;
		sumaNotas:= 0;
		aux := dato.finalesAprobados; {para poder acceder sin escribir tanto, sino queda muy tosco}
			while (aux <> nil) do 
				begin
					cantNotas:= cantNotas + 1;
					sumaNotas:= sumaNotas + aux^.dato.nota;
				end; 
		asignarDatos3 (sumaNotas,cantNotas,aux2,dato.codAlumno); 
		agregarEnListaB(pI,aux2); 
	end; 

	procedure recorrerEstructura_i (a : estructura_i; var pI : listaIncisoB; codAlu : integer); 
	begin
		while (a <>nil) do 
			begin
					recorrerEstructura_i(a^.HI,pI,codAlu); 
						
						if (a^.dato.codAlumno > codAlu) then 
								cargarListaB(a^.dato,pI);
				
					recorrerEstructura_i(a^.HD,pI,codAlu); 
			end;
	end;

	procedure incisoB (a : estructura_i; var pI : listaIncisoB); 
	var
		codAlumno: integer;
	begin
		inicializarListaB(pI); 
		write ('Ingrese un codigo de alumno: '); readln (codAlumno); 
		recorrerEstructura_i(a,pI,codAlumno); 
	end;


	{ c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.} 
	
	function cumpleNota (notaBuscada,notaAlumno: integer) : boolean;
	begin
			cumpleNota:= (notaAlumno = notaBuscada); 
	end;
	
	function cumpleRangoCodigo (valor1,valor2,codAct : integer): boolean;
	begin
		cumpleRangoCodigo:= ( (codAct>valor1) and (codAct<valor2) ) ; 
	end;
	
	function calcularLista (pI : listaAprobados; codAlumno1,codAlumno2,nota : integer;codAlumno : integer):  integer; 
	begin
		if (pI = nil) then 
			calcularLista:= 0
		else
			begin
					calcularLista:= calcularLista (pI^.sig,codAlumno1,codAlumno2,nota,codAlumno) ;		

					if (( cumpleNota(nota,pI^.dato.nota) and (cumpleRangoCodigo(codAlumno1,codAlumno2,codAlumno))) )  then 
						calcularLista:= calcularLista + 1; 

											
						
			end;
	end;
	
	function calcularTodo (a : estructura_i; codAlumno1,codAlumno2,nota : integer) : integer;
	begin
		if (a = nil) then 
			calcularTodo:= 0
		else
			begin
			
			{DE ESTA MANERA SE HACE LA RECURSION EN LAS LISTAS}
				calcularTodo := calcularTodo(a^.HI,codAlumno1,codAlumno2,nota) + 
							calcularLista(a^.dato.finalesAprobados,codAlumno1,codAlumno2,nota,a^.dato.codAlumno) + 
											calcularTodo(a^.HD,codAlumno1,codAlumno2,nota);
		
			end;
	
	end;
	
	
	procedure incisoC (a : estructura_i); 
	var
		notaIngresada : integer; 
		codAlumno1, codAlumno2 : integer;
	begin
		write ('Ingrese el primer codigo de alumno: '); readln (codAlumno1);  
		write ('Ingrese el segundo codigo de alumno: '); readln (codAlumno2);  
		write ('Ingrese una nota: '); readln (notaIngresada); 
		writeln ('La cantidad de finales aprobados con la nota ',notaIngresada );
		writeln ('Y entre el rango de ',codAlumno1, ' ... ',codAlumno2, ' son: ',calcularTodo(a,codAlumno1,codAlumno2,notaIngresada) ); 
	end;




	var
		a : estructura_i;
		v : vMaterias; 
		listaB : listaIncisoB; 
	begin
		inicializarArbol(a); 
		inicializarListaVec(v); 
		
		cargarEstructuras(a,v); 
		
		incisoB(a,listaB); 
		
		incisoC(a); 
		
		
		//imprimirArbol(a); 
		//imprimirVecMaterias(v); 
	end.
