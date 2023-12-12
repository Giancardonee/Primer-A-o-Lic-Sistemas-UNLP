{4.- Una librería requiere el procesamiento de la información de sus productos.
 De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
 * ->> Registro producto: código del producto, código de rubro (del 1 al 8) y precio
 * 
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
* ->> vector de listas, donde cada lista esta ordenada por cod producto
* 
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
* ->> recorro las listas (posiciones del array) e imprimo
* 
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
* ->> Generar un vector con dimF= 30, pero debemos controalr una dimL:
* 
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
*->> Ordenamos el vector, por insercion
* 
e. Muestre los precios del vector resultante del punto d).
* ->> imprimo el vector, teniendo en cuenta la dimL 
* 
f. Calcule el promedio de los precios del vector resultante del punto d).
* ->> Primero recorro el vector para sacar el la suma de precios
* ->> Despues saco promedio con  ( suma de precios / dimL )
* }
program eje4; 
const
	cantRubros = 8;
	dimF = 30;
type
	{declaracion}
	
	rangoRubros = 1..cantRubros;
	producto = record
		codProducto : integer;
		codRubro : rangoRubros; 
		precio : real;
	end;
	
	listaProductos = ^nodo;
	nodo = record
		dato : producto;
		sig : listaProductos; 
	end;
	
	vector = array [rangoRubros] of listaProductos; 
	vectorNuevo = array [1..dimF] of producto; 
 	{modulos}
	
	procedure inicializarListasVector (var v : vector);
	var
		i : integer;
	begin
		for i := 1 to cantRubros do 
			v[i]:= nil;
	end;
	
	procedure leerProducto (var p : producto); 
	begin
		write ('Ingrese el precio: '); readln (p.precio); 
		if (p.precio <>0) then 
				begin
					write ('Ingrese el codigo de rubro: '); readln (p.codRubro); 
					write ('Ingrese el codigo del producto: '); readln (p.codProducto); 
				end;
	end;
	
	procedure insertarOrdenado (var pI : listaProductos; dato : producto); 
	var
		nuevo,anterior, actual : listaProductos;
	begin
		new (nuevo); 
		nuevo^.dato:= dato;
		anterior:= pi;
		actual:= pi; 
		while ( (actual<>nil) and (dato.codProducto < actual^.dato.codProducto ) ) do 
			begin 
				anterior:= actual;
				actual:= actual^.sig;
			end; 
		if (actual = anterior) then 
			pI:= nuevo
		else
			anterior^.sig:= nuevo;
		nuevo^.sig:= actual; 
	end;

	procedure cargarVecLista (var v : vector); 
	var
		p : producto;
	begin
		leerProducto(p); 
		while (p.precio <>0) do 
			begin
				insertarOrdenado(v[p.codRubro],p); 
				leerProducto(p); 
			end;
	end;
	
	procedure incisoB (v : vector); 
	var
		rubroActual : rangoRubros;	
		actual : listaProductos; 
	begin
		for rubroActual:= 1 to cantRubros do 
			begin
				writeln ('- - - ->>>> DATOS DEL RUBRO ',rubroActual, ': ' ); 
				actual:= v[rubroActual];
					while (actual <>nil) do 
						begin
							writeln ('Codigo de producto: ',actual^.dato.codProducto); 
							actual:= actual^.sig;
						end;
					writeln ; // salto de linea 
			end; 
	end;
	
	
	{la listaProductos que recibe debe ser el vector[3]}
	procedure incisoC (pI : listaProductos; var vecNue : vectorNuevo; var dimL : integer); 
	begin
			dimL:= 0;
			while ((dimL < dimF) and (pI <> nil)) do 
				begin
					dimL:= dimL + 1;
					vecNue[dimL]:= pI^.dato;
					pI:= pI^.sig; 
				end;
	end;
	
	procedure ordenarInsercion (var v : vectorNuevo; dimL: integer); 
	var
		i,j : integer;
		actual: producto; 
	begin
		for i:= 2 to dimL do 
			begin
				actual:= v[i]; 
				j:= i-1;
					while ((j > 0) and (v[j].precio > actual.precio)) do 
						begin
							v[ j+1 ]:= v[ j ]; 
							j:= j - 1;
						end;
				v[j+1]:= actual;
			end;
	end;
	
	
	procedure mostrarVecNuevo (v : vectorNuevo; dimL : integer);
	var
		i : integer;
	begin
		writeln ('- - ->>>>Los precios del vector resultante son: '); 
			for i:= 1 to dimL do 
				begin
					writeln ('Producto ',i, ' .Su precio es: ',v[i].precio:0:2); 
				end;
	end; 
	
	function calcularSumaPrecios (v : vectorNuevo; dimL : integer): real;
	var
		i : integer;
		suma : real;
	begin
		suma:= 0;
			for i:= 1 to dimL do 
				begin
					suma:= suma + v[i].precio;
				end;
			calcularSumaPrecios:= suma; 
	end;
	
	function sacarPromedio (sumaPrecios : real; dimL : integer): real; 
	begin
		sacarPromedio:= (sumaPrecios / dimL); 
	end;
	
	procedure incisoF (v : vectorNuevo ; dimL : integer); 
	var
		suma: real;
	begin
		suma:= calcularSumaPrecios(v,dimL); 
		writeln ('El promedio de precios es: $',sacarPromedio(suma,dimL):0:2); 
	end;
	
{programa principal}
	var
		vecProd : vector;
		vecNuevo : vectorNuevo;
		dimL : integer;
	begin
		inicializarListasVector(vecProd); 
		cargarVecLista(vecProd); 
		incisoB(vecProd); 
		incisoC(vecProd[3],vecNuevo,dimL); 
		ordenarInsercion(vecNuevo,dimL); 
		mostrarVecNuevo(vecNuevo,dimL); 
		incisoF(vecNuevo,dimL); 
	end.
