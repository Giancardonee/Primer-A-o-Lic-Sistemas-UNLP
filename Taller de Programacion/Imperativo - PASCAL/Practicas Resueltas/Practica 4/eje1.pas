{1. Implementar un programa modularizado para una librería que:

a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto.
 --->> Arbol, ordenado por codProducto
 
 De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total. 
-->> El registro del arbol

De cada venta se lee código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. 
El ingreso de las ventas finaliza cuando se lee el código de venta -1.
-->> Registro venta

b. Imprima el contenido del árbol ordenado por código de producto.
--> Imprimir In orden 

c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.
-->> full procedure recursivo


d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.

e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).}

program eje1; 
type
	
	venta = record
		codVenta : integer;
		codProducto: integer;
		cantUnidades: integer;
		precioUnitario:real;
	end;

	producto = record
		codProducto: integer;
		cantVendidas: integer;
		montoTotal: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato : producto;
		HI : arbol;
		HD: arbol
	end;
	
	procedure inicializarArbol(var a : arbol); 
	begin
		a:= nil; 
	end; 
	
	procedure leerVenta (var v : venta); 
	begin
		write ('Ingrese el codigo de venta: '); 
		readln (v.codVenta);
			if (v.codVenta <> -1) then 
				begin
					write ('Ingrese el codigo de producto: ');
					readln (v.codProducto);
					write('Ingrese la cantidad de unidades: '); 
					read (v.cantUnidades); 
					write ('Ingrese el precio unitario: '); 
					read (v.precioUnitario); 
				end;
		writeln(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
	end;

	procedure asignarCampos (var p : producto; v : venta);
	begin
		p.codProducto := v.codProducto; 
		p.cantVendidas := v.cantUnidades;
		p.montoTotal := (v.cantUnidades * v.precioUnitario);  
	end;

	procedure actualizarProducto (a : arbol; cantUnidades: integer; precioUnitario: real ); 
	begin
		a^.dato.cantVendidas:= a^.dato.cantVendidas + cantUnidades;
		a^.dato.montoTotal:= a^.dato.montoTotal + ( cantUnidades * precioUnitario ); 
	end;

	procedure agregarEnArbol (var a : arbol; v : venta); 
	var
		p : producto;
	begin
			if (a = nil) then 
				begin
					new(a); 
					asignarCampos (p,v); 
					a^.dato:= p;
					a^.HI:= nil;
					a^.HD:=nil;
				end
		else
				begin
					if (v.codProducto < a^.dato.codProducto) then {si el codigo de producto es menor, mando a la izq}
							agregarEnArbol(a^.HI,v)
					else 
						if ( v.codProducto > a^.dato.codProducto) then {si el codigo de producto es mayor, mando a la der}
							agregarEnArbol(a^.HD,v)
					else 																	{si el codigo de producto es igual, actualizo unidades vendidas y monto}
							actualizarProducto(a,v.cantUnidades,v.precioUnitario); 
				end;
	end;
	
	
	{MODULO A}
	procedure cargarArbol (var a : arbol); 
	var
		v : venta; 
	begin
		leerVenta(v); 
		while (v.codVenta <> -1) do 
			begin
				agregarEnArbol(a,v);
				leerVenta(v);
			end;
	end;
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
	procedure imprimirDatos (p : producto); 
	begin
		writeln ('--->> Codigo de producto: ',p.codProducto); 
		writeln ('Unidades totales vendidas: ',p.cantVendidas); 
		writeln ('Monto total: ',p.montoTotal:2:2); 
	end; 
	
	
	{MODULO B}
	procedure imprimirEnOrden (a : arbol); 
	begin
	if ( a <> nil ) then
			begin
				//if (a^.HI <> nil) then 
				imprimirEnOrden(a^.HI); 
				{ - - - - - - - acciones - - - - - - - }
					imprimirDatos(a^.dato); 
				{ - - - - - - - acciones - - - - - - - }
				//if (a^.HD <> nil) then 
				imprimirEnOrden(a^.HD);
			end
	end;
	
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
	{MODULO C}
	{c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
	código de producto con mayor cantidad de unidades vendidas.}
	
	procedure actualizarMaximo(cantVendidas: integer;codProdActual : integer; var codProdMax,maxUnidades: integer); 
	begin
		codProdMax:= codProdActual;
		maxUnidades:= cantVendidas; 
	end; 
	
	procedure calcularProdMasVendido (a : arbol; var codProdMax,maxUnidades: integer); 
	begin
		if( a<> nil) then 
			begin
					calcularProdMasVendido(a^.HI,codProdMax,maxUnidades); 
					{ - - - - - - - acciones - - - - - - - }
						if (a^.dato.cantVendidas > maxUnidades) then 
							actualizarMaximo(a^.dato.cantVendidas,a^.dato.codProducto,codProdMax,maxUnidades); 
					{ - - - - - - - acciones - - - - - - - }
					calcularProdMasVendido(a^.HD,codProdMax,maxUnidades); 
			end;
	end;
	
	procedure moduloC (a : arbol); 
	var
		codProdMax,maxUnidades: integer;
	begin
		codProdMax:= 0000;
		maxUnidades:= -1; 
		calcularProdMasVendido(a,codProdMax,maxUnidades); 
		if (maxUnidades = -1) then 
			writeln ('El arbol esta vacio pa.')
	else
			writeln ('El codigo de producto con mas unidades vendidas es: ',codProdMax); 
	end;
{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
	{	MODULO D }
	{d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
	producto y retorne la cantidad de códigos menores que él que hay en la estructura.}
	function cantCodMenores (a : arbol; codMin : integer): integer;
	begin
		if ( a = nil ) then 
			cantCodMenores:= 0
		else
		if (codMin > a^.dato.codProducto) then 
			cantCodMenores:= 1+ cantCodMenores(a^.HI,codMin) + cantCodMenores(a^.HD,codMin) 
		else
			cantCodMenores:=  cantCodMenores(a^.HI,codMin); 
	end;
	
	procedure moduloD (a : arbol); 
	var
		unCodigo : integer;
		cant : integer;
	begin
		write ('Ingrese un codigo de producto: '); readln (unCodigo); 
		cant:= cantCodMenores(a,unCodigo); 
		if (cant = 0) then 
			writeln ('No se encontro ningun codigo de producto menor a ',unCodigo)
		else
			writeln ('La cantidad de codigos menores a  ',unCodigo, ' son: ',cant ); 
	end;
	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
	{e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).}
	
function obtenerMontoTotalEnRango(a: arbol; rangoMin, rangoMax: integer): real;
begin
  if (a = nil) then
    obtenerMontoTotalEnRango := 0
  else
	  begin
		if (a^.dato.codProducto > rangoMin) and (a^.dato.codProducto < rangoMax) then
		  obtenerMontoTotalEnRango := obtenerMontoTotalEnRango(a^.HI, rangoMin, rangoMax) + obtenerMontoTotalEnRango(a^.HD, rangoMin, rangoMax) + a^.dato.montoTotal
		
		else 
		
			if (a^.dato.codProducto < rangoMin) then
				obtenerMontoTotalEnRango := obtenerMontoTotalEnRango(a^.HD, rangoMin, rangoMax)
		
		else
		  obtenerMontoTotalEnRango := obtenerMontoTotalEnRango(a^.HI, rangoMin, rangoMax);
	  
	  end;
end;
	
	
		procedure moduloE (a : arbol); 
		var
			codMax,codMin : integer;
		begin
			writeln ('Ingrese  un codigo de producto (rangoMin): ');
			readln (codMin); 
			writeln ('Ingrese un codigo de producto (rangoMax): '); 
			readln (codMax); 
			writeln ('El monto total entre el rango de los codigo de productos ',codMin, ' y ',codMax, ' es: ',obtenerMontoTotalEnRango(a,codMin,codMax) ); 
		end;

	{ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
var
	a : arbol;
begin
	inicializarArbol(a);
	{MODULO AAAAAAAA}
	cargarArbol(a); 
	
	{MODULO BBBBBBBB}
	imprimirEnOrden(a); 
	
	{MODULO CCCCCCC}
	moduloC(a); 
	
	{MODULO DDDDDDD}
	moduloD(a); 
	
	{MODULO EEEEEEEE}
	moduloE(a); 
	

end.
	
