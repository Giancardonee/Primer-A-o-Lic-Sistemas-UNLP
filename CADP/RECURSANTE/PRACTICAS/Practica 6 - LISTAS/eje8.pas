{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado). } 

program eje8;
	type
	lista = ^nodo;
	nodo = record
			num : integer;
			sig : lista;
	end;

procedure imprimirLista (pI : lista); 
begin
	writeln ('La lista con los numeros cargados quedo: '); 
	while (pI <> nil) do 
		begin
				write (pI^.num, ' ' ); 
			pI:= pI^.sig; 
		end; 
end; 

procedure insertarOrdenado ( var pI : lista ; valor : integer);  
var
nuevo,actual,anterior: lista; 
begin
	new(nuevo); nuevo^.num:= valor; nuevo^.sig:= nil; 
	actual:= pI; 
	anterior:= pI; 
	while (( actual <> nil ) and ( valor > actual^.num) ) do
		begin
			anterior:= actual; 
			actual:= actual^.sig; 
		end; 
		if ( actual = anterior) then { es porque la lista esta vacia o se debe insertar en el primer elemento}
			pI:= nuevo
		else
			anterior^.sig:= nuevo; 	{ agregamos al medio, o al final}
	nuevo^.sig:= actual; 
end; 

var
pI : lista;
valor : integer;
begin
pI := nil;
write('Ingrese un numero: ');
readln(valor);
while (valor <> 0) do begin
insertarOrdenado (pI,valor); 
write('Ingrese un numero: ');
readln (valor);
end;
	 imprimirLista (pI); 
end.


