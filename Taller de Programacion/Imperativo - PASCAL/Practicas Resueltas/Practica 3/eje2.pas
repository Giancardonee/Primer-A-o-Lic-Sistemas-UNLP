{
2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
}
program ejeDos; 
type
	rFecha = record
		dia : 1..31;
		mes : 1..12;
		anho : 2000..2023;
	end; 

	rVenta1 = record
		fecha : rFecha; 
		codProducto : integer;
		cantUnidades : integer;
	end; 
	
	rVenta2 = record
		codProducto : integer;
		totalVendido : integer; 
	end; 

	arbol_2 = ^nodo2; 
	nodo2 = record
		dato : rVenta2; 
		HI : arbol_2;
		HD : arbol_2; 
	end; 

	arbol_1 = ^nodo1; 
	nodo1 = record
		dato : rVenta1;
		HI : arbol_1; 
		HD : arbol_1;
	end; 
	
	
// -----------------------------------------------------------------------------------------
	{cargamos el primer arbol}
	procedure leerVenta (var v : rVenta1); 
	begin
			write ('Ingrese el codigo de producto: '); 
			readln (v.codProducto); 
				if (v.codProducto <>0) then 
					begin
						write ('Ingrese la cantidad de unidades vendidas: '); 
						readln (v.cantUnidades); 
					{	writeln ('---> Ingrese la fecha: '); 
						write ('Dia: '); readln (v.fecha.dia); 
						write ('Mes: '); readln (v.fecha.mes); 
						write ('Anho: '); readln (v.fecha.anho); 
					}end; 
	end; 

	procedure agregarEnArbol (var a : arbol_1; dato : rVenta1); 
	begin
		if (a = nil) then 
			begin
				new (a);
				a^.dato:= dato; 
				a^.HI:= nil; 
				a^.HD:= nil; 
			end
		else 
			begin
				if (dato.codProducto > a^.dato.codProducto) then 
					agregarEnArbol(a^.HD,dato)
				else
					agregarEnArbol(a^.HI,dato); 
			end;
	end; 

	procedure cargarArbol_1 (var a : arbol_1); 
	var
		 v : rVenta1; 
	begin
			leerVenta(v); 
			if (v.codProducto <>0) then
				begin
						agregarEnArbol(a,v); 
						cargarArbol_1(a)
				end; 
	end; 
	
	{no es necesario, lo tengo para probar si el arbol se carga bien. }
	procedure imprimirEnOrden (a : arbol_1); 
	begin
		if ( a <>nil ) then 
			begin
				imprimirEnOrden(a^.Hi);
				writeln ('Cod de producto: ',a^.dato.codProducto); 
				writeln ('Unidades vendidas: ',a^.dato.cantUnidades); 
				writeln;
				imprimirEnOrden(a^.HD);
			end; 
	end; 
// -----------------------------------------------------------------------------------------
	procedure agregarArbol_2(var a2: arbol_2; codProducto,unidadesVendidas : integer); 
	begin
	if (a2 = nil) then {si entra aca es porque el codigo de producto no se encuentra}
		begin
			new(a2); 
			a2^.dato.codProducto:= codProducto;   
			a2^.dato.totalVendido:= unidadesVendidas; {es lo mismo que inicializar las unidades vendidas del producto, pero en su primer valor de unidades vendidas}
			a2^.HI:= nil; 
			a2^.HD:= nil; 
		end
	else
	
		begin
			if (codProducto < a2^.dato.codProducto) then 
						agregarArbol_2(a2^.HI,codProducto,unidadesVendidas)
			else if (codProducto > a2^.dato.codProducto) then 
						agregarArbol_2(a2^.HD,codProducto,unidadesVendidas)
			else	{si entra aca es porque el codigo de producto ya existe en arbol 2}
				a2^.dato.totalVendido:= a2^.dato.totalVendido + unidadesVendidas; 
		end; 
	end; 

	{para generar el arbol 2, necesitamos recorrer el arbol 1
	* en este inciso estamos recorriendo el arbol 1,y generando el arbol 2
	* 
	* }
	procedure generarArbol_2 (var a2: arbol_2; a1 : arbol_1); 
	begin
		if (a1 <>nil) then 
			begin
				generarArbol_2( a2 ,  a1^.HI); 
					agregarArbol_2(a2,a1^.dato.codProducto,a1^.dato.cantUnidades); 
				generarArbol_2( a2 ,  a1^.HD); 
			end; 
	end; 
// -----------------------------------------------------------------------------------------
	procedure imprimirArbol_2(a2 : arbol_2);  
	begin
		if (a2 <> nil) then 
			begin
				imprimirArbol_2(a2^.HI); 	
				writeln ('--->>Codigo de producto: ',a2^.dato.codProducto); 
				writeln ('Unidades total vendidas: ',a2^.dato.totalVendido); 
				writeln; 
				imprimirArbol_2(a2^.HD); 
			end; 
	end; 

// -----------------------------------------------------------------------------------------
	procedure cargarDosArboles (var a1: arbol_1; var a2: arbol_2); 
	begin
		cargarArbol_1(a1); 
		writeln ('Asi quedo cargado el arbol 1:'); 
		imprimirEnOrden(a1); 
		generarArbol_2(a2,a1); 
		writeln ('Asi quedo cargado el arbol 2: '); 
		imprimirArbol_2(a2); 
	end; 
// -----------------------------------------------------------------------------------------
	procedure inicializarArbol_1 (var a : arbol_1); 
	begin
		a := nil; 
	end; 
	
	procedure inicializarArbol_2(var a : arbol_2);
	begin
		a:= nil; 
	end; 
// -----------------------------------------------------------------------------------------


{b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}
function calcularCantVendidas (a1 : arbol_1; suma : integer; codProd : integer) : integer; 
begin
	if ((a1 <>nil) and (codProd <= a1^.dato.codProducto) )  then 
		begin
			calcularCantVendidas:=calcularCantVendidas(a1^.HI,suma,codProd);
			
			if (codProd = a1^.dato.codProducto) then 
				suma:= suma + a1^.dato.cantUnidades; 
			
			calcularCantVendidas:= calcularCantVendidas (a1^.HD,suma,codProd); 
		end
	else
		calcularCantVendidas:= suma; 

end; 


procedure incisoB (a1 : arbol_1); 
var
codProducto : integer;
suma: integer;
begin
	suma:=0;
	write ('Ingrese un codigo de producto: '); 
	readln (codProducto); 
	writeln ('El codigo de producto ',codProducto, ' tiene ',calcularCantVendidas(a1,suma,codProducto), ' ventas.');  
end; 
	
// -----------------------------------------------------------------------------------------	
{programa principal}
var
	a1 : arbol_1; 
	a2 : arbol_2; 
begin
	inicializarArbol_1(a1); 
	inicializarArbol_2(a2);
	cargarDosArboles(a1,a2); 
	incisoB(a1); 
end.


