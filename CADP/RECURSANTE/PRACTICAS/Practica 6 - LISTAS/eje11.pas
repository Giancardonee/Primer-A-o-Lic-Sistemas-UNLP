{
 11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González.
*  De cada egresado se conoce:
*  número de alumno,
*  apellido 
    promedio obtenido durante toda su carrera.

Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
* 
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor). 
}


{ este progrma se puede plantear como: insertar ordenado por promedio
* e imprimir  los primeros 10 nodos en la lista. 
* O tambien se puede generar una nueva lista, que contenga solamente los 10 egresados top
* calculo que ambas opciones son validas, voy a usar la opcion de generar una nueva lista
* asi practico un poco :) 
* }
program eje11; 
type 
	str25 = string[25]; 
	egresado = record
			nroALumno : integer;
			apellido : str25 ; 
			promedio : real; 
	end; 
	
	listaEgresados = ^nodo; 
	nodo = record
			elemento : egresado; 
			siguiente : listaEgresados; 
	end; 
	
	procedure crearLista (var pI : listaEgresados); 
	begin
		pI:= nil; 
	end; 
	
	procedure LeerEgresado (var e: egresado); 
	begin
		write ('Ingrese el numero de alumno: '); readln (e.nroAlumno); 
			if (e.nroAlumno <> 0) then 
				begin
					write ('Ingrese el apellido: '); readln (e.apellido); 
					write ('Ingrese el promedio: '); readln (e.promedio); 
					writeln; 
				end; 
	end; 
	
	procedure insertarOrdenado (var pI : listaEgresados; e : egresado);
	var
		nuevo,actual,anterior : listaEgresados; 
	begin
		new(nuevo); 
		nuevo^.elemento:= e; 
		nuevo^.siguiente:= nil; 
		actual:= pI; 
		anterior:= pI; 
		while ( ( actual <> nil) and (e.promedio < actual^.elemento.promedio) ) do 
			begin
				anterior:= actual; 
				actual:= actual^.siguiente; 
			end; 
		if ( actual = pI ) then    { es porque es en la primer posicion}
			pI:= nuevo
		else
			anterior^.siguiente:= nuevo; 	{ es porque va al medio o al final}
	
	nuevo^.siguiente:= actual;  
	end; 
	
		procedure cargarListaEgresados (var pI: listaEgresados); 
	var
		e : egresado; 
	begin
		LeerEgresado(e); 
		while (e.nroAlumno <> 0) do 
			begin 
				insertarOrdenado(pI,e); 
				LeerEgresado(e); 
			end; 
	end; 
	
	procedure agregarAlFinal (var ListaTop10,pU : listaEgresados; e : egresado); 
	var
		nuevo : listaEgresados; 
	begin
		new (nuevo); 
		nuevo^.elemento:= e; 
		nuevo^.siguiente:= nil; 
		if ( ListaTop10 = nil ) then 
			begin
				ListaTop10:= nuevo; 
				pU:= nuevo; 
			end
		else
			begin
				pU^.siguiente:= nuevo; 
				pU:= nuevo; 
			end; 
	end; 
	
	procedure CargarListaTop10 (pI : listaEgresados; var ListaTop10,pU: listaEgresados); 
	var
		cantidad : integer; 
	begin
		cantidad:= 0; 
		while ( (pI <> nil ) and (cantidad <=10) ) do 
			begin
					agregarAlFinal(ListaTop10,pU,pI^.elemento); 
					cantidad:= cantidad + 1; 
				pI:= pI^.siguiente; 
			end; 
	end; 
	
	procedure imprimir10_egresadosCumplen (ListaTop : listaEgresados); 
	begin
		writeln; 
		writeln ('Los 10 alumnos que recibiran el premio son: '); 
		while (ListaTop <> nil) do 
			begin
				writeln ('---> El alumno con apellido ',ListaTop^.elemento.apellido, ' y su numero de alumno es: ',ListaTop^.elemento.nroAlumno ) ; 
				ListaTop:= ListaTop^.siguiente; 
			end; 
			writeln ('Felicitaciones!!! ')
	end; 
	
	{programa principal}
	var
		pI : listaEgresados; 
		listaTop,pU : listaEgresados; 
	begin
		crearLista (pI); 
		cargarListaEgresados (pI); 
		CargarListaTop10(pI,listaTop,Pu); 
		imprimir10_egresadosCumplen(ListaTop); 
	end.
