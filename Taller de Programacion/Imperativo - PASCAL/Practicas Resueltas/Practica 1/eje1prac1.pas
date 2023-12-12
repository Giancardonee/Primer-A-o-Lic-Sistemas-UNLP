program eje1Practica1; 
const
	dimF = 50; 
	maxUnidades = 99; 
	codProdMax= 15; 
type
	rangoDias = 0..31; 
	rangoProductos = 1..codProdMax; 
	rangoUnidadesV = 1..maxUnidades;
	
	venta = record
		diaVenta : rangoDias; 
		codProducto : rangoProductos; 
		cantVendida : rangoUnidadesV; 
	end; 
	
	vVentas = array [1..dimF] of venta; 
	
	prodVendidos  = record
		codProducto : rangoProductos; 
		cantVendidos : integer; 
	end; 
	
	listaProd = ^nodo; 
	nodo = record
		elem : prodVendidos;
		sig : listaProd;
	end; 
	
	procedure inicializarLista (var pI : listaProd); 
	begin
		pI:= nil; 
	end; 
	procedure LeerVenta (var v : venta);
	begin
		//Randomize;
		writeln ('Ingrese el dia de la venta: '); 
		readln (v.diaVenta) ;
		if (v.diaVenta<> 0) then 
			begin
			//v.codProducto:= Random (14)+1;  
				writeln ('Ingrese el codigo de producto: '); 
				readln(v.codProducto); 
				
				// Muestro el numero random generado
			//writeln ('codigo de producto: ',v.codProducto);	
				writeln ('Ingrese la cantidad vendida (entre 1 y 99): '); 
				readln (v.cantVendida); 
			end; 
	end; 
	
	procedure cargarVector (var v : vVentas; var dimL : integer); 
	var
		rVenta : venta;
	begin
		dimL:= 0;
		LeerVenta(rVenta); 
		while (rVenta.diaVenta <>0) do 
			begin
				dimL:= dimL + 1;
				v[dimL]:= rVenta;
				LeerVenta(rVenta)
			end; 
	end; 
	
 procedure mostrarVector ( v : vVentas ; dimL : integer);
 var
	i : integer;
 begin
	for i:= 1 to dimL do 
		begin
			writeln ('Venta ',i, ': ');
			writeln ('Cod producto: ',v[i].codProducto); 
			writeln ('Dia venta: ',v[i].diaVenta); 
			writeln ('Cant vendida: ',v[i].cantVendida); 
			writeln ; 
		end;
		
 end; 	
	
procedure eliminarPosicion (var v : vVentas; var dimL : integer; pos : integer); 
var
	i : integer;
begin
		if (( pos >=1) and (pos <= dimL) )  then
			begin
				for i:= pos to dimL-1 do 
					begin
						v[i]:= v[i+1]; 
					end; 	
				dimL:= dimL - 1;
			end;
end;


// min es valor1 , max es valor2
procedure eliminarValoresVec (var v : vVentas; var dimL : integer; min: integer; max: integer); 
var
	pos : integer;
begin
	pos := 1;
	while ( (pos <= dimL ) and (v[pos].codProducto<= max) ) do 
		begin
				if ( (v[pos].codProducto>=min) and (v[pos].codProducto<=max) ) then {elimino}
					eliminarPosicion(v,dimL,pos)
				else
					pos:= pos + 1;		{aumento de pos}
		end;
end;



procedure ordenarVectorInsercion (var v : vVentas ; dimL : integer); 
var
	i , j : integer; 
	actual : venta; 
begin
	for i:= 2 to dimL do 
		begin
			actual:= v[i];
			j:= i - 1 ; 
				while ( (j >0) and (v[j].codProducto > actual.codProducto) ) do 
					begin
							v[ j+1 ] :=v[ j ]; 
							j:= j - 1 ;
					end; 
				v[ j+1 ] := actual; 
		end; 
end; 

procedure ordenarVectorSeleccion (var v : vVentas; dimL : integer); 
var
	aux : venta; 
	i,j,pos : integer; 
begin
	for i:= 1 to (dimL -1) do 
		begin
			pos:= i; 
				for j:= i+1 to dimL do 
					begin
						if (v[j].codProducto < v[pos].codProducto) then 
								pos:= j;
					end; 
			{intercambio valores}
			aux:= v[pos]; 
			v[pos]:= v[i]; 
			v[i]:= aux;
		end; 
end;

procedure agregarAtras (var pI, Pu : listaProd; dato : prodVendidos);
var
	nuevo: listaProd; 
begin
	new(nuevo); 
	nuevo^.elem:= dato; 
	if ( pI <> nil) then 
		begin
			pU^.sig:= nuevo; 
		end
	else
		begin
			pI:= nuevo; 
		end; 
	pU:= nuevo; 
end;  

procedure procesar(v: vVentas; dimL: integer; var pI, pU: listaProd);
var
	aux : prodVendidos; 
	i: integer;
	cantVendidas,prodActual : integer;

begin
	i:= 1; 
	while ( i <= dimL) do 
		begin
			cantVendidas:= 0;
				if ( v[i].codProducto mod 2 = 0 ) then 
					begin
						prodActual:= v[i].codProducto; 
						while ( (i<= dimL) and (v[i].codProducto = prodActual) ) do 
							begin
								cantVendidas:= cantVendidas + v[i].cantVendida;
								i:= i + 1;
							end;
					end;
					aux.codProducto:= prodActual; 
					aux.cantVendidos:= cantVendidas;
				agregarAtras(pI,pU,aux);
		end;	
end;

procedure cargarProductosPar(v: vVentas; dimL : integer; var pI,pU : listaProd); 
begin
		procesar(v,dimL,pI,pU);
end;

procedure mostrarListaProd(pI : listaProd); 
begin
writeln ('Productos con codProd par');
	while (pI <> nil) do 
		begin

			writeln ('codProducto: ',pI^.elem.codProducto);
			writeln ('Cantidad vendidos: ',pI^.elem.cantVendidos); 
			writeln;
			pI:= pI^.sig;  
		end; 
end; 

var
v : vVentas;
dimL : integer;
rango1,rango2 : integer;
pI,pU : listaProd; 
begin
	{inciso a}
	cargarVector(v,dimL); 
	writeln ('Vector sin ordenar: '); 
	{inciso b}
	mostrarVector (v,dimL); 
	
	{inciso c}
	//ordenarVectorSeleccion(v,dimL);  podemos usar este, o el de insercion
 	ordenarVectorInsercion(v,dimL); 
	writeln ('Vector ordenado: ');  
	{inciso d}
	mostrarVector(v,dimL);
	
	{inciso e}
	writeln ('Ingrese dos un rango para eliminar codigos de productos en el vector: '); 
	write ('Rango1 (minimo): '); readln (rango1); 
	write ('Rango2 (maximo): '); readln (rango2); 
	eliminarValoresVec(v,dimL,rango1,rango2); 
	
	{inciso f}
	mostrarVector(v,dimL);   
	
	inicializarLista(pI); 
	{inciso g}
	cargarProductosPar(v,dimL, pI,pU);
	mostrarListaProd(pI);
end.

{g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.}
{
* Si el codigo de producto es par (codProd mod 2 = 0)
* 	si ya se cargo en la lista: Sumo la cantidad de productos vendidos
* 	si no esta en la lista: Lo agrego a la lista, y le sumo el stock
* 
* 
* }

{
* 
* 	este modulo cumple, pero es mas casero jajaja, en cadp y taller no usamos los cortes de control de esta forma-
	procedure procesar(v: vVentas; dimL: integer; var pI, pU: listaProd);
var
  aux: prodVendidos;
  i, auxiliar: integer;
  contarVendidas: integer;
begin
  i := 1;
  while ( i <= dimL ) do
	  begin
		auxiliar := i;
		contarVendidas := 0;
		if  ( v[i].codProducto mod 2 = 0 ) then
		begin
		
				while (auxiliar <= dimL) and (v[auxiliar].codProducto = v[i].codProducto) do
					begin
						contarVendidas := contarVendidas + v[auxiliar].cantVendida;
						auxiliar := auxiliar + 1;
					end;
			  aux.codProducto := v[i].codProducto; // asigno el codigo de producto al campo auxiliar
			  aux.cantVendidos := contarVendidas; // asigno las unidades vendidas del codigo de producto par
			  agregarAtras(pI, pU, aux); // agrego en la lista (va a a quedar ordeada)
		
		end;
		i := auxiliar; // Saltar las entradas procesadas
	  end;
end;

}




