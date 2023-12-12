program JugamosConListas;

type
	lista = ^nodo;
	
		nodo = record
			num : integer;
			sig : lista;
		end;


	procedure armarNodo(var L: lista; v: integer);
	var
		aux : lista;
	begin
			new(aux);
			aux^.num := v;
			aux^.sig := L;
			L := aux;
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



{ 
* a. Indicar qué hace el programa.
* El programa declara,crea una lista de enteros. 
* Y carga elementos en la lista mientras el valor ingresado sea distinto de 0
* Luego hace una especie de agregarAdelante media rara. 
* Y imprime en orden inverso los valores leidos. 
* }


{ 
* b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
* la lista queda conformada: 48, 13, 21, 10
* } 

{
* c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
	----> modulo imprimirLista
} 

{
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.
	----> modulo incrementarLista
}
