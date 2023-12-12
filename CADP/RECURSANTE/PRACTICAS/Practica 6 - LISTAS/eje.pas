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

{ este procedure debe almacenar los datos en el mismo orden que se ingresaron}
	procedure agregar_atras(var L: lista; v: integer);
	var
		nuevo,pU : lista;
		
	begin
			new (nuevo); 
			nuevo^.num:= v; 
			nuevo^.sig:= nil; 
			
			if (pI = nil) then { es porque es el primer elemento}
				pI:= nuevo
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
	pri : lista;
	valor : integer;
begin
			pri := nil;
			write('Ingrese un numero: ');
			readln(valor);
			while (valor <> 0) do
			 begin
					armarNodo(pri, valor);
					write('Ingrese un numero: ');
					readln(valor);
			 end;
	imprimirLista(pri);

	write ('-----> Ingrese un valor para incrementar cada elemento: '); 
	readln (valor); 
	
	incrementarLista(pri,valor); 
	imprimirLista(pri)
	
	

end.

