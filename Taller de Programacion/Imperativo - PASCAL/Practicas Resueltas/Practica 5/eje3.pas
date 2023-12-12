{Un supermercado requiere el procesamiento de sus productos. 
De cada producto se conoce: \
	código, rubro (1..10), stock y precio unitario. 

Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}


{EJERCICIO PLANTEADO: 
 
 Voy a tener un vector de arboles. Donde cada rubro (1..10) es una posicion del vector, que va a tener un arbol 
 ordenado por codigo de producto (porque la busqueda por codigo debe ser lo mas eficiente posible) 
 
 No deberia tener repetidos en este arbol, ya que cada codigo de producto debe ser unico. 
 
}

program eje3;
const	
	cantRubros = 10;
type
	rangoRubros = 1..cantRubros; 
	
	producto = record
		codigo : integer;
		stock : integer;
		precioUnitario : real;
	end; 
	
	arbolProducto = ^nodo; 
		nodo = record
		dato : producto;
		HI : arbolProducto ; 
		HD : arbolProducto
	end;
	
	vRubros = array [rangoRubros] of arbolProducto; 
{------------------------------------------------------------------------------------------------------------------------------------------}	
{------------------------------------------------------------------------------------------------------------------------------------------}			
	procedure inicializarVecArbol (var v : vRubros); 
	var
		i : integer;
	begin
		for i:= 1 to cantRubros do 
			v[i]:= nil; 
	end;
	
	procedure leerProducto (var p : producto; var rubro : rangoRubros); 
	begin
		write ('Ingrese el codigo de producto: '); readln (p.codigo); 
			if (p.codigo <> -1) then 
				begin
					write ('Ingrese el rubro: '); readln (rubro); 
					write ('Ingrese el stock: '); readln (p.stock); 
					write ('Ingrese el precio unitario: '); readln (p.precioUnitario); 
				end;
		 writeln (' ----------------------------------------------------------------'); 
	end;
	
	procedure agregarEnArbol (var a : arbolProducto; dato: producto); 
	begin
		if (a = nil) then 
			begin
				new (a); 
				a^.dato:= dato;
				a^.HI:= nil;
				a^.HD:=nil;
			end
		else
			begin
					if (dato.codigo < a^.dato.codigo) then 
						agregarEnArbol(a^.HI,dato)
						
					else if (dato.codigo > a^.dato.codigo) then {pongo el if porque los repetidos no los voy a almacenar. }
							agregarEnArbol(a^.HD,dato); 
	
			end;
	end;

	procedure cargarProductos (var v : vRubros); 
	var
		rubro : rangoRubros;
		p : producto;
	begin
		leerProducto(p,rubro); 
			while (p.codigo <> -1) do 
				begin
					agregarEnArbol(v[rubro],p);
					leerProducto(p,rubro); 
				end;
	end;
{------------------------------------------------------------------------------------------------------------------------------------------}	
{------------------------------------------------------------------------------------------------------------------------------------------}	
	procedure imprimirArbol (a : arbolProducto); 
	begin
		if (a <>nil) then 
			begin
					imprimirArbol(a^.HI); 
					
					writeln ('Codigo de producto: ',a^.dato.codigo); 
					writeln ('Stock: ' ,a^.dato.stock);
					writeln ('Precio unitario: $',a^.dato.precioUnitario:2:2); 
					writeln; 
					imprimirArbol(a^.HD); 
			end;
	end;

	procedure imprimirVecRubros (v : vRubros); 
	var
		i : integer;
	begin
		for i:= 1 to cantRubros do 
			begin
				if (v[i] <> nil) then 
				begin
						writeln ('--->>Productos del rubro ',i, ' :'); 
						imprimirArbol(v[i]); 
						writeln; 
				end;
			end;
	end;
{------------------------------------------------------------------------------------------------------------------------------------------}	
{------------------------------------------------------------------------------------------------------------------------------------------}	
	{b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
	de producto y retorne si dicho código existe o no para ese rubro.}

	function buscarProducto (a : arbolProducto ; codProducto : integer) : boolean;
	begin
		if (a = nil) then 
			buscarProducto:= false
		else
			begin
						if (a^.dato.codigo < codProducto) then 									   {si es menor, voy a la izq}
							buscarProducto:= buscarProducto(a^.HI,codProducto)
						else if (a^.dato.codigo > codProducto) then 							   {si es mayor, voy a la der}
								buscarProducto:= buscarProducto(a^.HD,codProducto)
						else																										{si es igual, retorno true}
								buscarProducto:= true; 
			end;
	end; 
	
	
	procedure incisoB (v : vRubros); 
	var
		rubro: rangoRubros;
		codigoProd: integer;
		resultado: boolean;
	begin
		write ('Ingrese un  rubro: '); readln (rubro); 
		write ('Ingrese un codigo de producto: '); readln (codigoProd); 
		resultado:= buscarProducto(v[rubro],codigoProd); 
		if (resultado = true) then 
			writeln ('El codigo de producto ',codigoProd, ' se encuentra en el rubro ',rubro)
		else  
			writeln ('El codigo de producto ',codigoProd, ' no se encuentra en el rubro ',rubro ); 
			
			writeln; 
	end;
{------------------------------------------------------------------------------------------------------------------------------------------}	
{------------------------------------------------------------------------------------------------------------------------------------------}	
	{c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
	rubro, el código y stock del producto con mayor código.}
	
	{Voy a usar un procedimiento que retorne el codigo y el stock del producto con mayor codigo. 
		Ya que tengo que devolver dos cosas. 
			Como se sabe que el arbol esta ordenado por codigo de producto, debemos desplazarnos full derecha}
			
	procedure sacarMaxCodProducto ( a : arbolProducto; var codMax,stock : integer); 
	begin
		if (a <> nil) then 
			begin
					if (a^.HD = nil) then 
						begin
							codMax:= a^.dato.codigo;
							stock:= a^.dato.stock; 
						end
					else
						sacarMaxCodProducto(a^.HD,codMax,stock); 
			end;
	end;		
	
	procedure incisoC (v : vRubros); 
	var
		i : integer;
		codMax,Stock : integer;
	begin
			for i:= 1 to cantRubros do 
				begin
					if (v[i] <> nil) then 
						begin
							sacarMaxCodProducto(v[i],codMax,Stock);
							writeln ('-->>Del rubro ',i, '. El codigo de producto maximo tiene estos datos: '); 
							writeln ('>>>Codigo de producto: ',codMax); 
							writeln ('>>>Stock: ',stock); 						
							writeln;
						end;
				end;
	end;
{------------------------------------------------------------------------------------------------------------------------------------------}	
{------------------------------------------------------------------------------------------------------------------------------------------}	
	{d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
	retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
	ingresados.}

	function calcularProdIntermedios (a : arbolProducto; valor1,valor2 : integer): integer;
	begin
		if (a = nil) then
			calcularProdIntermedios:= 0
		else
			begin
			
					calcularProdIntermedios:= calcularProdIntermedios (a^.HI,valor1,valor2) + calcularProdIntermedios(a^.HD,valor1,valor2) ; 
						if ( (a^.dato.codigo> valor1) and (a^.dato.codigo<valor2) )then 
							calcularProdIntermedios:= calcularProdIntermedios + 1; 
			
			end;
	end;

	procedure informarProductosIntermedios (v : vRubros; valor1,valor2 : integer); 
	var
		i,resultado: integer;
	begin
			for i:= 1 to cantRubros do 
				begin
					if (v[i] <> nil) then 
						begin
							resultado:= calcularProdIntermedios(v[i],valor1,valor2); 
							writeln ('--->>En el rubro ',i, ': ');
							writeln ('La cantidad de productos entre los valores ',valor1, ' y ',valor2, ' son: ',resultado  );
							writeln; 
						end
					else
						begin
								writeln ('El rubro ',i, ' se encuentra vacio. No ningun producto cargado.'); 
								writeln ('Por lo tanto, la cantidad de productos entre los valores ',valor1, ' y ',valor2, ' son 0.' ); 
								writeln; 
						end;
				end;
	end;

	procedure incisoD (v : vRubros); 
	var
		valor1,valor2 : integer;
	begin
		write ('Ingrese el primer valor: '); readln (valor1); 
		write ('Ingrese el segundo valor: '); readln (valor2); 
		writeln; 
		informarProductosIntermedios(v,valor1,valor2); 
	end;
{------------------------------------------------------------------------------------------------------------------------------------------}	
{------------------------------------------------------------------------------------------------------------------------------------------}	

	{programa principal}
	var
		v : vRubros; 
	begin
		inicializarVecArbol(v); 
		cargarProductos(v); 
		imprimirVecRubros(v); 
		
		incisoB(v); 
		
		incisoC(v); 
		
		incisoD(v); 
	end.
