program a;
const 
cantMaterias = 36; 
type
rangoNotas = 1..10; 
vMaterias = array [1..cantMaterias] of rangoNotas; 
alumno = record
	nroAlumno : integer; 
	apellido : string [20]; 
	anio : integer; 
	v : vMaterias; 
	cantAprobadas : integer; 
end;

aux = record
	nroAlumno : integer;
	promedio : real;
end;

nuevaLista = ^nodo2;
nodo2 = record
	elem : aux;
	sig : nuevaLista; 
end;


listaAlumnos = ^nodo;
nodo= record
	elem : alumno;
	sig : listaAlumnos; 
end; 

procedure LeerAlumno (var a: alumno); 
begin
	writeln ('Ingrese el nro de alumno: '); 
	readln (a.nroAlumno); 
	writeln('Ingrese el apellido: '); 
	readln (a.apellido); 
	writeln('Ingrese el anio: '); 
	readln (a.anio); 
	writeln ('Ingrese la cantidad de materias aprobadas: ');
	// se dispone, menor o igual a 36
	readln (a.cantAprobadas);
end;

procedure agregarAdelante (var pI: listaAlumnos; dato : alumno); 
var
	nue : listaAlumnos; 
begin
	new (nue); 
	nue^.elem:= dato;
	nue^.sig := pI;
	pI:= nue;
end;

procedure agregarAdelante2 (var pI : nuevaLista; dato : aux); 
var
	nue : nuevaLista; 
begin
	new (nue); 
	nue^.elem:= dato;
	nue^.sig := pI;
	pI:= nue;
end;

procedure cargarNotas (var a: alumno);
var
	i : integer;
begin
	for i:= 1 to ( a.cantAprobadas ) do 
		writeln ('Ingrese una nota: ');
		readln(a.v[i]);
end;

procedure cargarListaA(var pI : listaAlumnos); 
var
	a : alumno;
begin
	repeat
		leerAlumno(a);
		cargarNotas(a);
		agregarAdelante(pI,a); 
	until (a.nroAlumno = 1111)
end;
		
		
function sacarPromedio (v : vMaterias; cantNotas : integer): real;
var
	i : integer;
	sumaNotas: integer;
begin
	sumaNotas:=0;
		for i:= 1 to cantNotas do 
			sumaNotas:= sumaNotas + v[i];

		sacarPromedio:= (sumaNotas / cantNotas);
end;

procedure cargarListaNueva (var L : nuevaLista; auxiliar : aux);
begin
	agregarAdelante2(L,auxiliar);
	
end;

procedure recorrerLista ( pI : listaAlumnos; var nL : nuevaLista);
var
	act : listaAlumnos; 
	auxiliar : aux;
begin
	act:= pI; 
	while (act <> nil) do 
		begin
			auxiliar.promedio:= sacarPromedio(act^.elem.v, act^.elem.cantAprobadas); 
			auxiliar.nroAlumno:= act^.elem.nroAlumno;
			cargarListaNueva(nL,auxiliar); 
			act:= act^.sig;
		end;
end;



// prog principal
var
ListaAlu : listaAlumnos;
listaNue: nuevaLista;
begin

	// inicializo las listas
	ListaAlu:= nil;
	listaNue:= nil;
	
	cargarListaA(ListaAlu); 
	recorrerLista(ListaAlu,listaNue); 
end.

{ 
* procedure cargarListaC (var pI: listaAlumnos);
var
	a: alumno;
	notaObtenida : rangoNotas; 
	i:integer;
begin
		repeat 
		  leerAlumno (a); 
			for i:= 1 to 36 do begin
				writeln ('Ingrese la nota: '); 
				readln (notaObtenida); 
				a.v[i]:= notaObtenida; 
			end; 
			agregarAdelante(pI,a); 
		until (a.nroAlumno = 1111)
end; 	
* }

