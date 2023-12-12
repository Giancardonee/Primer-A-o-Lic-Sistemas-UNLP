program FactorialRecursion;
type 

listaEnteros = ^nodo; 
nodo = record
	dato : integer;
	sig : listaEnteros; 
end; 

procedure agregarAdelante (var pI : listaEnteros; dato: integer); 
var
	nuevo : listaEnteros; 
begin
	new(nuevo); 
	nuevo^.dato:= dato; 
	nuevo^.sig:= pI;
	pI:= nuevo;
end;
procedure inicializarLista (var pI : listaEnteros); 
begin
	pI:= nil; 
end; 

procedure cargarLista (var pI : listaEnteros); 
var
	num : integer; 
begin
	readln (num); 
	while (num <> 0) do 
		begin
			agregarAdelante(pI,num); 
			readln (num); 
		end; 
end; 
 
procedure imprimirListaRecursiva (pI : listaEnteros); 
begin
	if (pI = nil) then 
		writeln ('Se termino de imprimir la lista')
	else 
		begin
			writeln ('numero: ',pI^.dato); 
			imprimirListaRecursiva(pI^.sig); 
		end;
end; 

var
	L : listaEnteros; 
begin
	inicializarLista(L); 
	cargarLista(L); 
	imprimirListaRecursiva(L); 
end.
