{
La Biblioteca de la UNLP necesita un programa para administrar la información de los préstamos de libros realizados durante el año 2022. 
De cada préstamo se lee: ID del préstamo, fecha del préstamo (día y mes), DNI del socio que solicitó el préstamo y código del libro prestado. 
La lectura finaliza cuando se ingresa el DNI -1, que no debe procesarse. 
* La información se lee ordenada por DNI, un socio puede haber solicitado más de un préstamo. 
Se pide:

A) Generar una estructura adecuada que contenga, para cada socio, su DNI y la cantidad de préstamos que solicitó en el mes de junio de 2022.

B) Informar el DNI del socio que menos préstamos solicitó en el año 2022 y el DNI del socio que más préstamos solicitó en el año 2022.

C) Informar, para cada préstamo, cuántas veces aparece cada dígito del 0 al 9 en su ID.

Aclaracion mia = No hace falta usar un insertar ordenado porque nos dice que se LEE ordenado,
* podemos usar un agregarAdelante, o agregar al final 
}
program parcial1; 
const
	cantDigitos = 9; 
type
	rangoDias = 1..31; 
	rangoMeses = 1..12; 
	diaMes = record
		dia : rangoDias; 
		mes : rangoMeses; 
	end; 
	
	prestamo = record
			ID : integer; 
			fecha : diaMes; 
			dni : integer; 
			codigo : integer; 
	end; 
	listaPrestamos = ^nodo; 
	nodo = record
			elemento : prestamo; 
			siguiente : listaPrestamos; 
	end; 

	nuevaEstructura = record
			dni : integer;
			cantPrestamos : integer; 
	end; 

	listaNueva = ^nodo2; 
	nodo2 = record
			elemento : nuevaEstructura;
			siguiente : listaNueva; 
	end; 
	
	vDigitos = array [0..9] of integer; 

	procedure crearListaPrestamos (var L : listaPrestamos); 
	begin
			L := nil; 
	end; 
	
	procedure crearListaNueva (var L : listaNueva); 
	begin
		L := nil; 
	end; 

	procedure LeerFecha (var f : diaMes); 
	begin
		write ('Ingrese el dia: '); readln (f.dia);
		write ('Ingrese el mes: '); readln (f.mes);
	end; 

	procedure LeerPrestamo ( var p : prestamo); 
	begin
			write ('Ingrese el dni: '); readln (p.dni); 
			if (p.dni <> -1) then 
				begin
					LeerFecha (p.fecha); 
					write ('Ingrese el ID del prestamo: '); readln (p.id); 
					write ('Ingrese el codigo del libro: '); readln (p.codigo); 
					writeln ; // salto de linea 
				end; 
	end; 

	procedure agregarAdelante (var pI : listaPrestamos; dato : prestamo); 
	var
		nuevo : listaPrestamos; 
	begin
		new (nuevo); 
		nuevo^.elemento:= dato; 
		//nuevo^.siguiente:= nil; 
		
		nuevo^.siguiente:= pI; 
		pI:= nuevo;
	end; 
	
	procedure inicializarVDigitos (var v : vDigitos); 
	var
		i : integer; 
	begin
			for i:= 0 to cantDigitos do 
				v[i]:= 0; 
	end; 
	
	procedure cargarLista (var pI : listaPrestamos); 
	var
		p : prestamo; 
	begin
			LeerPrestamo(p); 
			while (p.dni <> -1)do
				begin
					agregarAdelante(pI,p); 
					LeerPrestamo(p); 
				end; 
	end; 

	procedure cargarNuevaEstructura (var pI : listaNueva; dni,cantPrestamos : integer); 
	var
		nuevo : listaNueva; 
	begin
		new (nuevo); 
		nuevo^.elemento.dni:= dni; 
		nuevo^.elemento.cantPrestamos:= cantPrestamos; 
		
		nuevo^.siguiente:= pI; 
		pI:= nuevo; 
	end; 

{ B) Informar el DNI del socio que menos préstamos solicitó en el año 2022 y el DNI del socio que más préstamos solicitó en el año 2022.}	
procedure calcularMin (dni, cantPrestamos : integer; var min,dniMin : integer); 
begin
		if (cantPrestamos < min) then 
			begin
					min:= cantPrestamos; 
					dniMin:= dni; 
			end; 
end;
	
procedure calcularMax (dni,cantPrestamos : integer; var max,dniMax : integer); 
begin
	if ( cantPrestamos > max ) then 
		begin
				max:= cantPrestamos; 
				dniMax:= dni; 
		end; 
end; 	

{ C) Informar, para cada préstamo, cuántas veces aparece cada dígito del 0 al 9 en su ID.}
procedure descomponer_y_contar (dni : integer; var v : vDigitos); 
var
	dig : integer;
begin
		while ( dni <> 0 )do 
			begin
				{me traigo el digito}
				dig:= dni mod 10; 
				
				{sumo 1 en el digito que sea}
				v[dig]:= v[dig] + 1; 
				
				{descompongo el dni}
				dni:= dni div 10; 
			end; 
end; 

procedure informarOcurrenciasDigitos ( v : vDigitos); 
var
		i : integer; 
begin
	for i:= 0 to cantDigitos do 
			writeln ('Para el digito ',i, ' hay ',v[i], ' ocurrencias.'); 		
writeln; // salto de linea 
end; 

function esMesJunio (mes : integer): boolean; 
begin
	esMesJunio:= ( mes = 6); 
end; 

{
A) Generar una estructura adecuada que contenga, para cada socio, su DNI y la cantidad de préstamos que solicitó en el mes de junio de 2022.
B) Informar el DNI del socio que menos préstamos solicitó en el año 2022 y el DNI del socio que más préstamos solicitó en el año 2022.
C) Informar, para cada préstamo, cuántas veces aparece cada dígito del 0 al 9 en su ID.
* }
	procedure recorrerLista ( l : listaPrestamos; var ListaN : listaNueva ); 
	var
		min,max, dniMin,dniMax: integer; 
		socioActual,cantPrestamos,prestamosJunio : integer; 
		v : vDigitos; 
	begin
		min:= 9999;  	max:= -1; 
		dniMin:= 0;       dniMax:= 0;
		while (l <> nil) do 
			begin
				cantPrestamos:=0; 
				prestamosJunio:=0; 
				socioActual:= l^.elemento.dni; 
					while ( (l <> nil ) and (l^.elemento.dni = socioActual) ) do
						begin
							{inciso c}
							inicializarVDigitos(v); 
							descomponer_y_contar(l^.elemento.id,v); 
							
							writeln ('Cantidad de veces que aparecen los digitos del id: ');
							informarOcurrenciasDigitos(v); 
									
							cantPrestamos:= cantPrestamos + 1; 
							
							if (esMesJunio(l^.elemento.fecha.mes) ) then 
								prestamosJunio:= prestamosJunio + 1; 
							
							{avanzo al siguiente nodo}
							l:= l^.siguiente; 
						end; 
						calcularMax(socioActual,cantPrestamos,max,dniMax); 
						calcularMin (socioActual,cantPrestamos,min,dniMin); 
						cargarNuevaEstructura(ListaN,socioActual,prestamosJunio); 					
			end; 
			writeln ('El dni que solicito menos prestamos es: ',dniMin); 
			writeln ('El dni que solicito mas prestamos es: ',dniMax); 
	end; 

	procedure imprimirNuevaLista (pI : listaNueva); 
	begin
		while (pI <> nil) do 
			begin 
				writeln ('El dni ',pI^.elemento.dni, ' en el mes de junio de 2022, solicito ',pI^.elemento.cantPrestamos, ' prestamos.'); 
			pI:= pI^.siguiente; 
			end; 
		 
	end; 

{ programa principal }
var
	Lprestamos : listaPrestamos; 
	Lnueva : listaNueva; 	
begin
	crearListaPrestamos(Lprestamos); 
	crearListaNueva(Lnueva); 
	
	cargarLista(Lprestamos);
	recorrerLista(Lprestamos,Lnueva); 
	 
	 {este no lo pide pero es para ver si la nueva lista se genero correctamente}
	imprimirNuevaLista (Lnueva); 
end.
