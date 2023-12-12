{Se lee informacion acerca de las ventas de productos realizadas en las sucursales de una empresa.
* De cada venta se conoce: fecha,codigo de producto,cantidad vendida y monto total 
* La lectura finaliza cuando se lee el codigo de producto -1el cual no debe procesarse.
* Implementar un programa para que a partir de la informacion leida, resuelva los siguientes incisos: 
* 
* 
* 
* a) Genere un arbol binario de busqueda, ordenado por codigo de producto, donde cada nodo contenga
* el codigo del producto y el monto total vendido. El codigo de producto no puede repetirse dentro del arbol
* 
* 
* b) Realizar un modulo que reciba el arbol generado en a, y un codigo de producto y retorne la suma 
* de todos los montos vendidos para los codigos de productos mayores al codigo recibido.
* 
* 
*Nota: la informacion se lee desordenada. Puede existir mas de una venta para un mismo codigo de producto. 
*}

program parcial2RECONTRAFACIL; 
type
	rFecha = record
		dia : 1..31;
		mes : 1..12;
		anho : integer;
	end;
	
	registroLectura = record
		fecha : rFecha;
		codProducto : integer;
		cantVendida : integer;
		monto : real;
	end;
	
	rArbol = record
		codProducto : integer;
		totalVendido : real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato : rArbol; 
		HI : arbol;
		HD : arbol;
	end;
	
	procedure inicializarArbol(var a : arbol); 
	begin
		a:= nil; 
	end;
	
	procedure leerFecha (var f : rFecha); 
	begin
		write ('Ingrese el dia: '); readln (f.dia);
		write ('Ingrese el mes: '); readln (f.mes); 
		write ('Ingrese el anho: '); readln (f.anho); 
	end;
	
	procedure leerVenta (var v : registroLectura); 
	begin
		write ('Ingrese el codigo de producto: '); readln (v.codProducto);
			if (v.codProducto <>-1) then 
				begin
				//	write ('Ingrese la cantidad vendida: '); readln (v.cantVendida);
					write ('Ingrese el monto: '); readln (v.monto); 
				//	leerFecha(v.fecha); 
				end;
	end;
	
	procedure asignarDatos (var asignar : rArbol; dato : registroLectura); 
	begin
		asignar.codProducto:= dato.codProducto; 
		asignar.totalVendido:= dato.monto; 
	end;
	
	procedure agregarEnArbol (var a :  arbol ; dato : rArbol);
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
			
					if (dato.codProducto < a^.dato.codProducto) then 
						agregarEnArbol(a^.HI,dato)
					else if (dato.codProducto > a^.dato.codProducto) then 
						agregarEnArbol(a^.HD,dato)
					else {si entra aca es porque se leyo el mismo cod de producto. por lo tanto actualizo solo el monto vendido}
						a^.dato.totalVendido:= a^.dato.totalVendido + dato.totalVendido; 
			
			end;
	end;
	
	
	{* a) Genere un arbol binario de busqueda, ordenado por codigo de producto, donde cada nodo contenga
* el codigo del producto y el monto total vendido. El codigo de producto no puede repetirse dentro del arbol}

	procedure cargarArbol (var a : arbol); 
	var
		aux: registroLectura;
		asignar : rArbol;
	begin
		leerVenta(aux); 
		while (aux.codProducto <>-1) do 
			begin
				asignarDatos(asignar,aux); 
				agregarEnArbol (a,asignar); 
				leerVenta(aux); 
			end;
	end;
	
	{* b) Realizar un modulo que reciba el arbol generado en a, y un codigo de producto y retorne la suma 
* de todos los montos vendidos para los codigos de productos mayores al codigo recibido.}
	function sumarMontos (a : arbol; codProd: integer) : real;
	begin
		if (a = nil) then 
			sumarMontos:= 0
		else
			begin
				
					if (a^.dato.codProducto < codProd) then 
						sumarMontos:= sumarMontos(a^.HD,codProd)
					else
							sumarMontos:= sumarMontos + a^.dato.totalVendido + sumarMontos(a^.HI,codProd) + sumarMontos(a^.HD,codProd); 
							
			end;
	end;
	
	
	{programa principal}
	var
		a : arbol;
		codProd : integer;
	begin
		inicializarArbol(a); 
		
		cargarArbol(a); 
	
		{para el inciso B}
		writeln ('ESTAS EN EL INCISO B.');
		write ('Ingrese un codigo de producto: '); readln (codProd); 
		writeln ('La suma de los montos de los codigos de productos mayores a ',codProd, ' son: ',sumarMontos(a,codProd):2:2); 
	end.
