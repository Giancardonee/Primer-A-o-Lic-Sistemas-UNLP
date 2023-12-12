{
9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente.
}

program JugamosConListas;
	type
		lista = ^nodo;
			nodo = record
			num : integer;
			sig : lista;
		end;

procedure agregarAlFinal (var pI,pU : lista; valor : integer); 
var
	nuevo : lista; 
begin
	new(nuevo); 
	nuevo^.num:= valor; 
	nuevo^.sig:= nil; 
	if ( pI = nil ) then {si la lista esta vacia}
		begin
			pI:= nuevo; 
			pU:= nuevo; 
		end
	else
		begin
			pu^.sig:= nuevo; 
			pU:= nuevo; 
		end; 
end; 

procedure imprimirLista (pI : lista); 
begin
	writeln ('La lista cargada es: '); 
	while ( pI <> nil) do 
		begin
				write (pI^.num, ' ' ); 
			pI:= pI^.sig; 
		end; 
end; 
// -----------------------------------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------------------------------------
{ a. EstáOrdenada: recibe la lista como parámetro y
*  retorna true si la misma se encuentra ordenada, o false en caso contrario. }
function estaOrdenadaAscendente (pI : lista): boolean; 
var
	ok: boolean; 
	anterior,actual : lista; 
begin
	ok:= True; 
	actual:= pi; 
	while (( actual <> nil) and (ok = true) and ( actual^.sig <>nil) ) do 
		begin
		anterior:= actual; 
		actual:= actual^.sig; 
			if ( anterior^.num > actual^.num) then 
				ok:= False; 
		end; 
	estaOrdenadaAscendente:= ok ; 
end; 

function estaOrdenadaDescendente (pI : lista): boolean; 
var
	ok : boolean; 
	anterior,actual : lista; 
begin
	ok:= True; 
	actual:= pI; 
	while ( (actual <> nil) and (ok) and (actual^.sig <> nil) ) do 
		begin
		anterior:= actual; 
		actual:= actual^.sig; 
     { si el anterior es menor al siguiente (actual)}
		if (anterior^.num < actual^.num ) then 
			ok:= False; 
	{retorna false porque no esta ordenado de manera descendente}
		end; 
	estaOrdenadaDescendente:= ok; 
end; 

procedure estaOrdenada (pI : lista); 
begin
	if (estaOrdenadaAscendente(pI)) then 
		writeln ('La lista esta ordenada de forma ascendente')
	else 
		if (estaOrdenadaDescendente(pI)) then 
			writeln('La lista esta ordenada de forma descendente')
	else
		writeln ('La lista no esta ordenada'); 
end; 
// ---------------------------------------------------------------------------------------------------------------

{ b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.}
procedure eliminarValor (var pI : lista;  valor : integer; var pude: boolean); 
var
actual, anterior: lista; 
begin
actual:= pI; 
pude:= False; 
while ( ( actual <> nil) and (actual^.num <> valor)) do 
	begin
		anterior:= actual; 
		actual:= actual^.sig; 
	end; 
	if (actual <> nil) then 	{es porque debo eliminar } 
		begin 
			if (actual = pI) then { es la primer posicion}
				pI:= pI^.sig
		else
			anterior^.sig:= actual^.sig; 				
		 dispose (actual); 
		pude:= True; 
		end; 
end; 

procedure cargarLista (var pI,pU : lista);
var
	num : integer;  
begin
	write ('Ingrese un numero: '); readln (num);
	while (num <> 0) do 
		begin
			agregarAlFinal(pI,Pu,num); 
			write ('Ingrese un numero: '); readln (num); 
		end; 
end; 
 
 procedure crearLista (var L  :lista); 
 begin
	L:= nil; 
 end; 
 
 procedure incisoB (var pI : lista); 
 var
	pude: boolean; 
	valorEliminar: integer; 
 begin
	write ('Ingrese un valor a eliminar en la lista: ') ; readln (valorEliminar); 
		eliminarValor(pI,valorEliminar,pude); 
			if (pude) then 
		begin 
			writeln ('Se elimino correctamente el numero ',valorEliminar);
			imprimirLista (pI); 
		end
	else
		writeln ('El numero ',valorEliminar, ' no se encontro en la lista.' ); 	
 end; 
 
 procedure agregarAdelante (var pI2 : lista ; valor : integer); 
 var
	nuevo : lista; 
 begin
	new(nuevo); 
	nuevo^.num:= valor; 
	nuevo^.sig:= nil; 
 end; 
 
 procedure incisoC (pI : lista; var pI2: lista; A,B : integer); 
 begin
	while (pI <> nil) do 
		begin
				if ( (pI^.num > A ) and (pI^.num < B) ) then 
						agregarAdelante (pI,pI^.num); 
		
			pI:= pI^.sig; 
		end; 
 
 end; 
 
var
pI,pU,pI2: lista;
a,b : integer; 
begin
	crearLista(pI);
	cargarLista(pI,pU); 
	imprimirLista (pI); 
	
	
	{inciso a. (informo si esta ordenada o no)}
	estaOrdenada(pI); 
	
	{inciso b. informo si pude eliminar o no}
	incisoB(pI); 
	
	{inciso c. El modulo recibe dos valores: A y B y retorna una lista con los 
	* nros mayores que A, pero menores que B}
	writeln ('Ingrese un numero: '); readln (a);
	writeln ('Ingrese otro numero: '); readln(b); 
	incisoC (pI, pI2,a,b); 
	
	
end.
