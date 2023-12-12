{
 10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo:
*  cuando un cliente ingresa al local, se registra su DNI y se le entrega un número
*  (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. Se pide:
* 
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.

b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.

c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.

d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán
todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a
uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.
}

{en este caso vamos a suponer que el primer  cliente tiene el numero 100
* y por cada cliente nuevo, el numero se ira incrementando}
program eje10; 
type
	cliente = record
			dni : integer; 
			nroEspera : integer; 
	end; 
	
	listaDeEspera = ^nodo; 
	nodo = record
			elemento : cliente; 
			siguiente: listaDeEspera; 
	end; 

	procedure crearLista (var pI : listaDeEspera); 
	begin
			pI:= nil; 
	end; 
	
	procedure LeerCliente (var c : cliente); 
	begin
		write ('Ingrese el dni del cliente: '); 
		readln (c.dni);
	end; 

	
	{ b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
	en espera, asigna un número al cliente y retorna la lista de espera actualizada. }
procedure RecibirCliente(dni: integer; var pI: listaDeEspera);
var
  actual: listaDeEspera;
  numeroEspera: integer;
begin
  actual := pI;     {uso la variable actual para recorrer la lista}
  numeroEspera := 100;  {uso esta variable para asignar el nro de espera}

  while (actual <> nil)  do		{mientras no se termine la lista}
  begin
    actual^.elemento.nroEspera := numeroEspera; {le asigno a cada cliente el numero de espera}
    numeroEspera := numeroEspera + 1;		{incremento el numero de espera}
    actual := actual^.siguiente;						{paso al siguiente nodo de la lista}
  end;
end;

	{c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
	el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
	de espera.} 	
	
	{deberia borrar el primer cliente de la lista}
	procedure eliminarDeLaLista (var pI : listaDeEspera); 
	var
			borrar: listaDeEspera; 
	begin
		if (pI <> nil) then 
			begin 
				borrar:= pI ; 
				pI:= pI^.siguiente; 
				dispose (borrar); 
			end; 
	end; 
	
	{asumo que el clientea atender debe ser el primero de la lista}	
	procedure Atender (var pI : listaDeEspera; var nroDeEspera, dni : integer);  
	var
		num : integer; 
	begin
		{esto lo hago para que quede mas clean}
		 write ('Ingrese 00 para atender al cliente. '); 
		 readln (num); 
		if ( ( pI <> nil) and (num = 00) )  then 
				begin
					{me guardo el nro de espera y el dni del cliente a atender}
					nroDeEspera:= pI^.elemento.nroEspera; 
					dni:= pI^.elemento.dni;
					eliminarDeLaLista(pI); 				
				end; 	
	end; 
	
		procedure agregarAlFinal (var pI,pU : listaDeEspera; c : cliente); 
	var
		nuevo : listaDeEspera; 
	begin
		new (nuevo); nuevo^.elemento:= c; nuevo^.siguiente:= nil; 
			if (pI = nil) then 
				begin
					pU:= nuevo;
					pI:= nuevo; 
				end
			else
				begin
				pU^.siguiente:= nuevo; 
				pU:= nuevo; 
				end; 
	end;  
	
	procedure AtenderCliente (pI: listaDeEspera); 
	var
		nroEspera,Dni: integer; 
	begin
		while (pI <> nil) do 
			begin
				Atender(pI,nroEspera,Dni); 
				writeln ('-->Numero de espera actual: ',nroEspera); 
				writeln ('->>>Se atendio al cliente con numero de espera ',nroEspera, ' y dni ',Dni);  
				writeln; 
			end; 
	end;  
	
	procedure cargarListaDeEspera (var pI,pU : listaDeEspera); 
	var
		c : cliente; 
	begin
		LeerCliente(c); 
		while (c.dni <> 0) do 
			begin
				agregarAlFinal(pI,pU,c); 
				RecibirCliente(c.dni,pI); 
				LeerCliente(c); 
			end; 
	end; 
		
	procedure imprimirListaDeEspera (pI : listaDeEspera); 
	begin
		writeln;  {salto de linea}
		writeln ('--->Los datos de los clientes en lista de espera son: ') ;
		while (pI <> nil) do 
			begin
				writeln ('-Dni: ',pI^.elemento.dni, ' y su nro de espera es: ',pi^.elemento.nroEspera ) ; 
				pI:= pI^.siguiente; 
			end; 
			writeln; 
	end; 
	
	{ programa principal }
	var
		pI,pU : listaDeEspera;
	begin
		crearLista (pI); 
		cargarListaDeEspera(pI,pU); 
		imprimirListaDeEspera (pI);
		AtenderCliente(pI); 
		writeln ('Se atendieron todos los clientes :) '); 
	end. 
