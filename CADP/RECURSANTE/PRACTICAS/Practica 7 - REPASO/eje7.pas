{
7. La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).

1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. 
* 
 Las 24 notas correspondientes a cada alumno deben quedar ordenadas de forma descendente.
Las cargo sin orden en el vector, despues ordeno el vector en forma descendente :) 


2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.

b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
únicamente por dígitos impares.

c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
la estructura generada en el inciso 1. El alumno puede no existir.
}
	program eje7;
	const
		cantMaterias = 24; 
	type
		str30 = string[30]; 
		rangoNotas = 0..10;
		
		vNotas = array [1..cantMaterias] of rangoNotas; 
		
		alumno = record 
				nroAlumno : integer;
				apellido : str30;
				nombres : str30; 
				correo : str30;
				anhoIngreso : integer; 
				anhoEgreso : integer;
				nota : vNotas; 
		end;
		listaAlumnos = ^nodo; 
		nodo =  record
				elemento : alumno;  
				siguiente : listaAlumnos;
		end;


		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
				procedure crearLista (var pI : listaAlumnos); 
		begin
				pI:= nil; 
		end;
		
		{ de esta forma ordeno el vector de forma descendente }
		procedure ordenarVector (var v : vNotas); 
		var
			aux : rangoNotas;
			i,j,p : integer;
		begin
				for i:= 1 to (cantMaterias -1) do 
					begin
						p:= i;
							for j:= ( i+ 1 ) to cantMaterias do
								if ( v[j] > v[p] ) then 
									p:= j;
									
						aux:= v[p]; 
						v[p]:= v[i]; 
						v[i]:= aux;
					end;
		end;
		
		procedure LeerNotas (var v : vNotas); 
		var
			i : integer;
		begin
				for i:= 1 to cantMaterias do 	begin	
					write ('Ingrese la nota de la materia ',i, ' : '); 
					readln (v[i]); 
					end;
						ordenarVector(v); 
		end;
		
		procedure LeerAlumno (var a : alumno); 
		begin
			write ('Ingrese el numero de alumno: '); readln (a.nroAlumno); 
				if ( a.nroAlumno <> -1 ) then
					begin
						write ('Ingrese el apellido: '); readln (a.apellido);
						write ('Ingrese el / los nombres: '); readln (a.nombres); 
						write ('Ingrese el correo electronico: '); readln (a.correo); 
						write ('Ingrese el anho de ingreso: '); readln (a.anhoIngreso); 
						write ('Ingrese el anho de egreso: '); readln (a.anhoEgreso); 
						LeerNotas(a.nota); 
					end;
		end;
		
		procedure agregarAdelante (var pI : listaAlumnos; dato : alumno); 
		var
				nuevo : listaAlumnos;
		begin
			new (nuevo); 
			nuevo^.elemento:= dato;
			
			nuevo^.siguiente:= pI;
			pI:= nuevo; 
		end;
		
		procedure cargarLista ( var pI : listaAlumnos); 
		var
			a : alumno;
		begin
			LeerAlumno(a);
				while ( a.nroAlumno <> -1 )do 
					begin 
						agregarAdelante (pI,a); 
						LeerAlumno(a);
					end; 
		end;
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 	
			{modulos para procesarLista}
	{ a. El promedio de notas obtenido por cada alumno. }		
		function calcularPromedio (sumaNotas : integer): real;
		begin
			calcularPromedio:= ( sumaNotas / cantMaterias); 
		end;

		
{ b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares. }
	function esAlumnoIngresante2012 (anhoIngreso : integer): boolean;
	begin
		esAlumnoIngresante2012:= ( anhoIngreso = 2012); 
	end;	
		
	function cumpleDigitosImpares	( nroAlu : integer): boolean;
	var
		dig : integer;
		pude : boolean; 
	begin
		pude:= True;
		while ( (nroAlu <> 0 )  and ( pude ) ) do 
			begin
					dig:= nroAlu mod 10; { me traigo el ult digito }

					if ( dig mod 2  = 0 ) then 	{     si un digito ya es par, sale del while y devuelve False }
							pude:= False;
						
					nroAlu:= nroAlu div 10; { descompongo el numero }	
			end;
		cumpleDigitosImpares:= pude; 	
	end;
		
	
{ c. El apellido, nombres y dirección de correo electrónico de
*  los dos alumnos que más rápido se recibieron (o sea, que tardaron menos años) }
		procedure calcularMin (a : alumno; var min1,min2 : integer; var apMax1,apMax2,nomMin1,nomMin2 : str30; var correoMin1,correoMin2 : str30 ); 
		var
			cuantoTardo :  integer; 
		begin
			cuantoTardo:= ( a.anhoEgreso - a.anhoIngreso); 
			if ( cuantoTardo < min1 ) then 
				begin
						min2:= min1;
						min1:= cuantoTardo;
						apMax2:= apMax1; 
						apMax1:= a.apellido;
						nomMin2:= nomMin1;
						nomMin1:= a.nombres;
						correoMin2:= correoMin1; 
						correoMin1:= a.correo; 
				end
			else
				if ( cuantoTardo < min2 ) then 
					begin
							min2:= cuantoTardo;
							apMax2:= a.apellido;
							nomMin2:= a.nombres;
							correoMin2:= a.correo;
					end;
		end;
	
	{ 3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
		la estructura generada en el inciso 1. El alumno puede no existir. }	
		procedure eliminarAlumno ( var pI : listaAlumnos; nroAlumnoEliminar : integer; var pude : boolean ); 
		var
			actual,anterior : listaAlumnos;
		begin
			pude:= False; 
			actual:= pI; 
			anterior:= pI;
			while ( ( actual <> nil ) and (actual^.elemento.nroAlumno <> nroAlumnoEliminar) )  do 
				begin
					anterior:= actual;
					actual:= actual^.siguiente;
				end;
				if ( actual <> nil ) then { es porque se encontro donde eliminar}
					begin
					pude:= True; 
					
						if ( actual = pI )then { es porque es la primer posicion }
							pI:= pI^.siguiente
						else		{ esta en el medio o al final.}
							anterior^.siguiente:= actual^.siguiente;
							
						dispose(actual);
					end;
		end;
		
		procedure obtenerSumaNotas ( v : vNotas; var sumaNotas : integer); 
		var
			i : integer;
		begin
				sumaNotas:= 0;
				for i:= 1 to cantMaterias do
					sumaNotas:= sumaNotas + v[i];
		end;
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		
		procedure procesarLista ( var pI : listaAlumnos); 
		var
			sumaNotas,cumpleIncisoB,alumno_a_eliminar : integer;
			min1,min2 : integer;
			nomMin1,nomMin2,apMin1,apMin2 : str30;
			correoMin1,correoMin2: str30; 
			 actual : listaAlumnos; 
			 pude: boolean;
		begin
		cumpleIncisoB:= 0;
		min1:= 99; min2:= 99;
		nomMin1:= ' ' ; nomMin2:= ' ' ;
		apMin1:= ' ' ; apMin2:= ' ' ;
		correoMin1:= ' ' ; correoMin2:= ' ' ;
		actual:= pI;
			while ( actual <> nil ) do 
				begin
				
						{ Calculo la suma de sus notas, y saco el promedio del alumno }
						obtenerSumaNotas(actual^.elemento.nota,sumaNotas);
						writeln ('El promedio del alumno ',actual^.elemento.apellido, ' es: ',calcularPromedio(sumaNotas):2:2 ); 
					
								{ calculo inciso b }
							if (  esAlumnoIngresante2012(actual^.elemento.anhoIngreso)) and (cumpleDigitosImpares(actual^.elemento.nroAlumno) ) then 
								 cumpleIncisoB:= cumpleIncisoB + 1; 
						
							calcularMin(actual^.elemento,min1,min2,apMin1,apMin2,nomMin1,nomMin2,correoMin1,correoMin2); 
					
						
					actual:= actual^.siguiente;
				end; 
			writeln  ('La cant de ingresantes 2012 con nroAlumno está compuesto únicamente por dígitos impares son: ',cumpleIncisoB); 
			writeln ('Los datos de los dos alumnos que mas rapido se recibieron son: '); 
			writeln ('1) ',apMin1,' ',nomMin1, ' y su correo es: ',correoMin1 );
			writeln ('2) ',apMin2,' ',nomMin2, ' y su correo es: ',correoMin2 );

		write ('Ingrese el nro de un alumno para eliminar de la lista: '); readln (alumno_a_eliminar); 
		eliminarAlumno(pI,alumno_a_eliminar,pude); 
			if (not pude) then 
				writeln ('El alumno no se encontraba en la lista.')
			else
				writeln ('Se elimino correctamente el alumno. ');
		end;

	{ programa principal }
	var
			L : listaAlumnos; 
	begin
		crearLista (L); 
		cargarLista(L); 
		procesarLista(L); 
	end.
