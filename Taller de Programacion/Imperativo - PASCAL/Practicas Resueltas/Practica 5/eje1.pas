{
El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
 Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. 


a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra.La lectura finaliza cuando llega el código de
identificación -1.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.

d) Un módulo recursivo que retorne el monto total de las expensas.
 }

program eje1; 
const
	dimF = 300;
type
	oficina = record
		cod_Identificacion : integer; 
		dniPropietario : integer;
		valorExpensa : real;
	end; 

	vOficinas = Array [1..dimF] of oficina; 
	
	procedure leerOficina (var o : oficina); 
	begin
		write ('Ingrese el codigo de identificacion: '); readln (o.cod_Identificacion); 
			if ( o.cod_Identificacion <> -1 ) then 
				begin
					write ('Ingrese el dni del propietario: '); readln (o.dniPropietario); 
					write ('Ingrese el valor de la expensa: '); readln (o.valorExpensa); 
					writeln; 
				end; 
	end; 
	
	procedure agregarEnVector (var v : vOficinas; var dimL : integer; dato : oficina); 
	begin
		dimL:= dimL+1; 
		v[dimL]:= dato; 
	end; 
	
	procedure cargarVector (var  v : vOficinas; var dimL : integer); 
	var
		ofi : oficina; 
	begin
		dimL:= 0; 
		leerOficina(ofi); 
			while  ( (dimL < dimF) and (ofi.cod_Identificacion <> -1) )  do 
				begin
					agregarEnVector (v,dimL,ofi); 
					leerOficina(ofi); 
				end; 
	end; 

	procedure imprimirVector (v : vOficinas ; dimL : integer); 
	var
		i : integer;
	begin
			for i:= 1 to dimL do 
				begin
							writeln ('Oficina ',i, ' :  ' ); 
							writeln ('Codigo de oficina : ',v[i].cod_Identificacion); 
				end; 
	end; 

	procedure ordenarVector (var v : vOficinas; dimL : integer); 
	var
		i,j,pos : integer; 
		aux : oficina; 
	begin
		for i:= 1 to (dimL - 1) do 
			begin
				pos:= i; 
					for j:= i+1 to dimL do 
							if ( v[ j ].cod_Identificacion < v[ pos ].cod_Identificacion ) then 
									pos:= j; 
						
				aux:= v[pos]; 
				v[pos]:= v[i]; 
				v[i]:= aux; 	
			end; 
	end; 
	
	function busquedaDicotomica (v : vOficinas; dimL : integer; codBuscado : integer): integer;
	var
		pri,ult,medio : integer; 
	begin
		pri:= 1; 
		ult:= dimL; 
		medio:= (pri+ult) div 2; 
			while ( ( pri <= ult) and ( codBuscado <> v[medio].cod_Identificacion) ) do 
				begin
					if ( codBuscado < v[ medio ].cod_Identificacion )then 
						ult:= medio-1
					else
						pri:= medio+1; 
						
						medio:= ( pri + ult ) div 2; 
				end; 
			if ( ( pri <= ult) and ( codBuscado = v[medio].cod_Identificacion) ) then 
					busquedaDicotomica:= medio
			else
					busquedaDicotomica:= 0;
	end; 

	procedure moduloC (v : vOficinas; dimL : integer); 
	var
		codigoBuscado : integer; 
		resultado : integer;
	begin
			write ('Ingrese un codigo de identificacion para buscar: '); readln (codigoBuscado); 
			resultado:= busquedaDicotomica(v,dimL,codigoBuscado); 
				if ( resultado <> 0) then  
				writeln ('Se encontro el codigo de oficina. El dni del propietario es ',v[resultado].dniPropietario)
				else
					writeln ('No se encontro el codigo de oficina ingresado. '); 
	end;	

	function retornarTotalExpensas (v : vOficinas; dimL : integer; pos : integer) : real;   
	begin
		if ( pos = dimL) then 
			retornarTotalExpensas:= 0
		else
			retornarTotalExpensas:= retornarTotalExpensas(v,dimL,pos+1); 
			retornarTotalExpensas:= retornarTotalExpensas + v[pos].valorExpensa;
	end; 

	procedure moduloD (v : vOficinas; dimL : integer); 
	begin
		writeln ('El monto total de las expenss es: ',retornarTotalExpensas(v,dimL,1):2:2); 
	end; 

	var
		v : vOficinas; 
		dimL : integer; 
	begin
		{inciso A}
		cargarVector(v,DimL); 
		imprimirVector(v,dimL); 
		writeln ('---------------------------------------------------------------------' );
		{inciso B}
		ordenarVector(v,dimL); 
		imprimirVector(v,dimL); 
		writeln ('---------------------------------------------------------------------' );
		{inciso C }
		moduloC(v,dimL); 
		writeln ('---------------------------------------------------------------------' );		
		{inciso D}
		moduloD(v,dimL); 
		writeln ('---------------------------------------------------------------------' );
			
		
	end.
