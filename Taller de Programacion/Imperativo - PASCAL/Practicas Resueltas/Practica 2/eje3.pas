{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.

b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.

c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.

d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.}

program eje3; 

type
	listaEnteros = ^nodo; 
	nodo = record
		dato : integer;
		sig : listaEnteros; 
	end; 
	
procedure agregarAdelante (var pI : listaEnteros ; dato : integer); 
var
	nuevo : listaEnteros; 
begin
	new(nuevo); 
	nuevo^.dato:= dato; 
	nuevo^.sig:= pI; 
	pI:= nuevo;
end; 	
	
procedure cargarLista (var pI :listaEnteros); 
var
	num : integer ; 
begin
		Randomize; 
		num:= random (101); 
		//readln(num); 
		if ( (num > 0) and (num <100) ) then 
			begin
					//			cargarLista(pI); aca me los carga en el orden que se leyeron 
				agregarAdelante(pI,num); 
				cargarLista(pI); // aca me los carga en el orden inverso
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



function calcularMin(l: listaEnteros; min : integer): integer;
begin
		
			if (l = nil) then	//caso base
				calcularMin:= min {devuelvo el resultado}
			else 		
				begin	// caso recursivo
						if (l^.dato < min) then 
							min:= l^.dato; 
							
				calcularMin:= calcularMin(l^.sig,min); 				
				end;

end;

function calcularMax (l : listaEnteros; max : integer): integer;
begin
	if (l = nil) then // caso base
		calcularMax:= max {devuelvo el resultado}
	else
		begin //caso recursivo
					if (l^.dato > max) then 
						max:=	l^.dato;
				calcularMax:= calcularMax(l^.sig,max); 
		end;
end;

procedure informarMAX_MIN (l : listaEnteros); 
var
	max,min : integer;
begin
	max:= -9999;
	min:= 9999;
	writeln ('El numero maximo fue: ',calcularMax(l,max)); 
	writeln ('El numero minimo fue: ',calcularMin(l,min));
end;

function buscarValor (l : listaEnteros; valor : integer): boolean;
begin
	if (l = nil) then //caso base
		buscarValor:= false // si llegue hasta aca es porque no se encontro el numero, entonces retorno false
	else
		begin // si no se encontro el numero y no llegue al final : 
			if (l^.dato = valor) then
				buscarValor:= true  // si encontre el numero termina la recursion y retorna
			else
				buscarValor:= buscarValor(l^.sig,valor); //si no encontre el numero sigue la recursionm
		end;
end;

procedure informarIncisoD (l : listaEnteros); 
var
	ok : boolean;
	num : integer;
begin
	writeln ('Ingrese un numero a buscar: ');
	readln (num);
	ok:= buscarValor(l,num); 
		if (ok = true) then 
			writeln ('se encontro el valor')
		else
			writeln ('no se encontro el valor :( ');
end;

{programa principal}
var
	pI : listaEnteros;
begin
	pI:= nil; 
	cargarLista(pI); 
	imprimirListaRecursiva(pI);
	informarMAX_MIN(pI); 
	informarIncisoD(pI); 
end. 
