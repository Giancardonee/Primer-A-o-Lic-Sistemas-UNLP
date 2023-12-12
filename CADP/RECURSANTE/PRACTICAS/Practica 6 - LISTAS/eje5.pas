{ 
5. Realizar un programa que lea y almacene la información de productos de un supermercado. 
* De cada producto se lee: 
* código, 
* descripción, 
* stock actual, 
* stock mínimo 
* y precio.
*  La lectura finaliza cuando se ingresael código -1, que no debe procesarse. 
* Una vez leída y almacenada toda la información, calcular e informar:

a. Porcentaje de productos con stock actual por debajo de su stock mínimo.  
---> debo sacar la cantidad de productos leidos 
      y cantidad de productos con stock actual < stock minimo 
   	 luego saco porcentaje asi: (stockMin/prodLeidos) * 100 

b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
---> Dos formas de hacerlo: 
* 		1) Informar a medida que recorremos la lista (obviamente preguntando si cumple condicion)
			2)Hacer una nueva lista con los la descripcion y cod del producto que cumplen la condicion

c. Código de los dos productos más económicos.
}

program eje5; 
type 
	productos = record 
			codigo : integer; 
			descripcion : string; 
			stockActual : integer;
			stockMinimo : integer;
			precio : real; 
	end; 
	
	listaProductos = ^nodo; 
	
	nodo = record
			elemento : productos; 
			siguiente : listaProductos; 
	end; 
	
	procedure crearLista (var pI : listaProductos); 
	begin
		pI:= nil; 
	end; 
	
	procedure LeerProducto (var p : productos); 
	begin
		write ('Ingrese el codigo del producto: '); readln (p.codigo); 
		if (p.codigo <> -1) then 
			begin
				write ('Ingrese una descripcion del producto: '); readln (p.descripcion); 
				write ('Ingrese el stock actual: ') ;readln (p.stockActual); 
				write ('Ingrese el stock minimo: '); readln (p.stockMinimo); 
				write ('Ingrese el precio: '); readln (p.precio); 
				writeln('- - - - - - - - - - - - - - - - - - - - - - - - - - - - -')
			end; 
	end; 

	procedure agregarAlFinal (var pI,pU : listaProductos; p : productos); 
	var
		nuevo : listaProductos; 
	begin
			new (nuevo); 
			nuevo^.elemento:= p; 
			nuevo^.siguiente:= nil; 
			
			if (pI = nil) then { es porque es el primer elemento de la lista}
				begin
					pI := nuevo; 
					pU := nuevo; 
				end
			else
				begin
					pU^.siguiente:= nuevo; 
					pU:= nuevo; 
				end; 
	end; 
	
	procedure cargarLista (var pI,pU : listaProductos); 
	var
		prod: productos; 
	begin
		LeerProducto(prod); 
		while (prod.codigo <> -1) do 
			begin
				agregarAlFinal(pI,pU,prod); 
				LeerProducto(prod); 
			end; 
	end; 

	function descomponerCodigo (cod : integer): integer; 
	var
		dig : integer;
		cantPares : integer;  
	begin
			cantPares:= 0 ; 
			while (cod <>0) do 
				begin
					dig:= cod mod 10; 	 {me traigo el ultimo digito}
						if (dig mod 2 = 0) then 
							cantPares:= cantPares + 1; 
						
						cod:= cod div 10; {descompongo el codigo, saco ultimo digito}							
				end; 
			descomponerCodigo:= cantPares; 
	end; 

	{b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.}
	function cumpleCondicionCodigo (cod: integer): boolean; 
	begin
			cumpleCondicionCodigo:= (descomponerCodigo(cod) >= 3); 
	end; 


	{c. Código de los dos productos más económicos.}
	{debo inicializar min1,min2 , codMin1,codMin2 en el proceso de recorrer}
	{ este procedimiento lo invoco mientras recorro la lista. 
	* por cada nodo recorrido se deberia llamar al procedimiento. }
	procedure calcularDosMinimos (var min1,min2: real; var codMin1,codMin2 : integer; p : productos ); 
	begin
			if ( p.precio < min1 ) then 
				begin
						min2:= min1; 
						min1:= p.precio; 
						codMin2:= codMin1; 
						codMin1:= p.codigo;
				end
			else if ( p.precio < min2) then 
				begin
						min2:= p.precio; 
						codMin2:= p.codigo; 
				end; 
	end; 
	
	function cumpleMenorStock (stockActual,stockMin: integer): boolean; 
	begin
		cumpleMenorStock:=  (stockActual < stockMin); 
	end; 
	
	procedure recorrerLista (pI : listaProductos; var cantProductos,stockMenor : integer);
	var
		min1,min2: real; 
		
		codMin1,codMin2: integer;
		producto: productos; 
	begin
	min1:= 9999; min2:=9999; 
	codMin1:= -1; codMin2:= -1;  
	cantProductos:= 0 ;stockMenor:= 0; 
		while (pI <>nil) do 
			begin
		{es para modularizar y no estar accediento a pI^.elemento. Podria no usarse,}
						producto:= pI^.elemento; 
			
					{lo uso para sacar el porcentaje del inciso a}
					cantProductos:= cantProductos + 1 ; 
					if (cumpleMenorStock(producto.stockActual,producto.stockMinimo)) then 
						stockMenor:= stockMenor + 1; 
					
				
				{cod producto con minimo 3 dig pares}
				if (cumpleCondicionCodigo(producto.codigo)) then 
						begin 
							writeln ('El producto tiene en su codigo al menos 3 digitos pares, y su descripcion es: '); 
							writeln (producto.descripcion); 
						end;
						 
				{calculo los dos minimos}
				calcularDosMinimos(min1,min2,codMin1,codMin2,producto); 
			
				{avanzo al siguiente nodo}
				pI:= pI^.siguiente; 
			end; 
		writeln ('El codigo de los dos productos mas baratos es: '); 
		writeln ('---> ',codMin1); 
		writeln ('---> ',codMin2); 
	end;  
		
	{debo sacar el porcentaje de aquellos productos con stock actual menor al stock minimo}
	
	function calcularPorcentaje(cantProductos,stockMenor : integer): real; 
	begin
		calcularPorcentaje:= (( stockMenor / cantProductos) *100 ); 
	end; 	
		
	{ programa principal }
	var
	pI,pU : listaProductos; 
	cantProductos,stockMenor : integer; 
	begin
		crearLista(pI); 
		cargarLista(pI,pU); 
		recorrerLista(pI,cantProductos,stockMenor); 
		writeln ('El porcentaje de productos con stock actual menor al stock minimo es:  %',calcularPorcentaje(cantProductos,stockMenor):2:2); 
	end. 
	
