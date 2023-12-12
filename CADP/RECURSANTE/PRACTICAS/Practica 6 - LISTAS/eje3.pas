{

 3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás)
.
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado. 

}

program JugamosConListas;

type
	lista = ^nodo;
	
		nodo = record
			num : integer;
			sig : lista;
		end;

{ este procedure debe almacenar los datos en el mismo orden que se ingresaron
* tenemos un puntero inicial ( pI)
* y un puntero final, o ultimo puntero   ( pU )
* 
* }


	procedure agregar_atras( var pI,pU: lista; v: integer);
	var
		nuevo : lista;
		
	begin
			new (nuevo); 
			nuevo^.num:= v; 
			nuevo^.sig:= nil; 
			
			if (pI = nil) then { es porque es el primer elemento}
				begin 
					pI:= nuevo;
					pU:= nuevo;
				end
			else
				begin
					pU^.sig:= nuevo;
					pU:= nuevo;
				end;
	end;
	
	procedure imprimirLista (pI : lista); 
	begin
		while (pI <>nil) do 
			begin
				write (pI^.num, ' ' ); 
				pI:= pI^.sig; 
			end;
	end;
	
	procedure incrementarLista (pI : lista; valor : integer); 
	begin
		while ( pI <> nil) do 
			begin
				pI^.num:= pI^.num + valor; 
				
				pI:= pI^.sig;
			
			end; 
	end;
	
	
	
	{programa principal}

var
	pI,pU : lista;
	valor : integer;
begin
			pI := nil;
			write('Ingrese un numero: ');
			readln(valor);
			while (valor <> 0) do
			 begin
					agregar_atras(pI,pU,valor); 
					write('Ingrese un numero: ');
					readln(valor);
			 end;
	imprimirLista(pI);

	write ('-----> Ingrese un valor para incrementar cada elemento: '); 
	readln (valor); 
	
	incrementarLista(pI,valor); 
	imprimirLista(pI)
	
	

end.

