{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.

b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.

c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina}

program eje2; 
const
	oficinasMax = 300; 
type
	rangoOficinas  = 1..oficinasMax; 
	
	oficina = record
		codigo : integer; 
		dniPropietario: string[20]; {puede ser int tamb, pero como no hacemos operaciones sobre el dni, es mejor un str}
		valorExpensa : real; 
	end; 
	
	vOficinas = array [rangoOficinas] of oficina;
	
	procedure LeerOficina (var o : oficina); 
	begin
		write ('Ingrese el codigo de identiicacion: '); 
		readln (o.codigo);
			if ( o.codigo <> -1) then 
				begin
					write ('Ingrese el dni del propietario: '); 
					readln (o.dniPropietario); 
					write ('Ingrese el valor de expensa: '); 
					readln (o.valorExpensa); 
				end; 
	end; 

	procedure cargarVector (var v : vOficinas; var dimL : integer); 
	var
		ofi : oficina; 
	begin
		dimL:= 0;
		LeerOficina(ofi); 
			while ( (dimL <= oficinasMax) and (ofi.codigo<> -1) ) do 
				begin
					dimL:= dimL + 1; 
					v[dimL]:= ofi;
					LeerOficina(ofi); 
				end; 
	end;

procedure ordenarInsercion (var v : vOficinas ; dimL : integer); 
var
	i , j : integer; 
	actual : oficina;
begin
	for i:= 2 to dimL do 
		begin
			actual:= v[i]; 
			j:= i - 1; 
				while ( ( j > 0 ) and ( v[j].codigo > actual.codigo) ) do 
					begin
						v[j+1]:= v[ j ]; 
						j := j -1;
					end;
			v[j + 1]:= actual;
		end; 
end; 

procedure ordenarSeleccion (var v : vOficinas; dimL : integer); 
var
	i,j,pos : integer ;  
	aux : oficina; 
begin
	for i:= 1 to (dimL-1) do 
		begin
			pos:= i; 
			for j:= i+1 to dimL do 
				begin
					if ( v[j].codigo < v[pos].codigo )then 
						pos:= j;
				end; 
		aux:= v[pos]; 
		v[pos]:= v[i]; 
		v[i]:= aux
		end; 
end; 

procedure mostrarVector (v : vOficinas; dimL : integer); 
var
	i : integer; 
begin
	for i:= 1 to dimL do 
		begin
			writeln ('-- -- -- > Datos de la oficina ',i); 
			writeln ('El codigo de identificacion es: ',v[i].codigo); 
			writeln ('El dni del pripietario es: ',v[i].dniPropietario); 
			writeln ('El valor de la expensa es: $',v[i].valorExpensa:0:2, ' pesos.'); 
			writeln ; {salto de linea}
		end; 
end; 



{programa principal}


var
	vec : vOficinas; 
	dimL : integer;
begin
	cargarVector(vec,dimL);
	{inciso b}
	//ordenarInsercion (vec,dimL);
	//mostrarVector(vec,dimL); 
	{inciso c}
	ordenarSeleccion (vec,dimL);
	mostrarVector(vec,dimL);   
end.
{ACLARACION: es alpedo tener los dos modulos invocados, si quieren probar comenten un metodo de seleccion y su mostrarvector
* PD: funcionan los dos metodos :) }
