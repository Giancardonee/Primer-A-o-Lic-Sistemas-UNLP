{
2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código
1122, el cual debe procesarse.

La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.

Una vez finalizada la lectura de todos los clientes, se pide:

a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).

b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
 **   PREGUNRAR SI DEBO INFORMAR A MEDIDA QUE PROCESO, O DEBO GENERAR UNA NUEVA LISTA** 
 
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.
**  PREGUNTAR EL ( SEGURO EXISTE , me cambia la condicion del while? ) 	**
}

program dos; 
const
	codCorte = 1122; 
type
	str20 = string[20]; 
	rangoPoliza = 1..6; 
	cliente = record
		codCliente : integer;
		apellido : str20; 
		nombre : str20; 
		dni : integer;
		codPoliza : rangoPoliza; 
		montoBasico : real; 
	end; 
	
	vectorPolizas = array [rangoPoliza] of real; {en este vector se dispone el precio adicional, segun la poliza} 
	
	listaClientes = ^nodo; 

	nodo = record
			elemento : cliente;
			siguiente : listaClientes
	end; 
	
//	procedure CargarPrecioPolizas (var v : vectorPolizas );   * SE DISPONE * 
	
	procedure crearLista (var pI : listaClientes); 
	begin
		pI:= nil; 
	end; 
	
	procedure LeerCliente (var c : cliente); 
	begin
		write ('Ingrese el nombre: '); readln (c.nombre); 
		write ('Ingrese el apellido: '); readln (c.apellido); 
		write ('ingrese el codigo de cliente: '); readln (c.codCliente); 
		write ('Ingrese el dni: '); readln (c.dni); 
		write ('Ingrese el codigo de poliza: '); readln (c.codPoliza); 
		write ('Ingrese el monto basico: '); readln (c.montoBasico); 
	end; 

	procedure agregarAdelante (var pI : listaClientes; dato : cliente); 
	var
		nuevo : listaClientes; 
	begin
		new (nuevo); 
		nuevo^.elemento:= dato; 

		nuevo^.siguiente:= pI ; 
		pI:= nuevo; 
	end; 
	
	procedure cargarLista (var pI : listaClientes); 
	var
		c : cliente; 
	begin
		repeat
			LeerCliente(c); 
			agregarAdelante(pI,c); 
		until (c.codCliente = codCorte)
	end; 
	
	{ a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional). }
	procedure informarDatosCliente ( c : cliente; v : vectorPolizas); 
	var
		montoCompleto : real; 
	begin
		writeln ('El nombre y apellido del cliente es: ',c.nombre, ' ' ,c.apellido ,' y su dni es: ',c.dni ); 
		montoCompleto:= (c.montoBasico + v[c.codPoliza]); 	// el precio adicional se disóne 
		writeln ('El monto completo que debe pagar es ',montoCompleto);   
		{podria hacer el inciso b aca tambien en este modulo.	}	
	end; 
	
	{b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.}
	{modulo descomponer dni}
	function cantDigitos9 (dni : integer): integer;
	var
		dig : integer;
		cantDig9 : integer;  
	begin
		cantDig9:= 0 ; 
			while ( (dni <> 0) and (cantDigitos9<>2) )  do 
				begin
					dig:= dni mod 10; 
						if (dig = 9) then 
							cantDig9:= cantDig9 + 1; 
							
						dni:= dni div 10; 	
				end; 
		cantDigitos9:= cantDig9; 
	end;
	
	procedure recorrerLista ( l : listaClientes; v : vectorPolizas); 
	begin
			while ( l <> nil ) do 
				begin
						informarDatosCliente (l^.elemento,v); 
						
			{ b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
 **   PREGUNTAR SI DEBO INFORMAR A MEDIDA QUE PROCESO, O DEBO GENERAR UNA NUEVA LISTA** }			
						if ( cantDigitos9(l^.elemento.dni) = 2) then
								writeln (l^.elemento.nombre, ' ' ,l^.elemento.apellido, ' tiene al menos 2 digitos 9 en su dni. ' ); 
							
							
						l:= l^.siguiente; 
				end; 
	end; 

	{ c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura. }

	procedure eliminarCliente (var pI : listaClientes; codClienteBorrar : integer); 
	var
		actual,anterior : listaClientes; 
		pude : boolean; 
	begin
		pude:= False; 
		actual:= pI; 
		while (actual^.elemento.codCliente <> codClienteBorrar)  do 
			begin
					anterior:= actual;
					actual:= actual^.siguiente; 
			end;
			if ( actual <> nil ) then { es porque se encontro} 
				begin
						if (actual = pI) then  { debo eliminar la primera posicion}
								pI:= pI^.siguiente
						else			{debo eliminar en el medio o al final}
								anterior^.siguiente:= actual^.siguiente;
				
					dispose(actual); 
					pude:= True; 
				end; 
		if (pude) then 
			writeln ('Se elimino correctamente.')
		else
			writeln ('No se encontro el codigo de cliente en la lista. '); 
	end; 
	
	{ programa principal }
	var 
		pI : listaClientes;
		v : vectorPolizas; 
	begin
		crearLista(pI); 
		cargarPrecioPolizas (v); { se dispone}
		cargarLista(pI); 
		recorrerLista(pI,v);  
	end.
