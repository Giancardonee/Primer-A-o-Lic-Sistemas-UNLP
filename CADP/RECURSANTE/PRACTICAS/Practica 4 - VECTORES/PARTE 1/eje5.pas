{ realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0.
 Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento,
  e informe la operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”. }

program cinco; 
const
	dimF = 100; 
type
	vector = array [1..dimF] of integer; 
	
procedure cargarVector (var v : vector ; var dimL : Integer) ; 
var
num : integer ; 
begin
dimL:= 0 ;
write ('Ingrese un numero entero: '); readln (num);
	while ( (num <> 0) and (dimL < dimF) ) do 
		begin
				dimL:= dimL + 1 ; 
				v[dimL]:= num;
				write ('Ingrese un numero entero: '); readln (num);
		end; 
end;

function posicionMax (v : vector ; posMax : integer; dimL : integer): integer;  
var
i : integer; 
max : integer ; 
begin
	max:= -1; 
	posMax:= 1; 
	for i:= 1 to dimL do 
		begin
				if (v[i] > max) then 
				begin
					max:= v[i]; 
					posMax:= i; 	
				end; 
		end;
	posicionMax:= posMax; 	
end; 

function posicionMinima (v : vector ; posMin : integer; dimL : integer): integer; 
var
i : integer; 
min : integer; 
begin
	min:= 32000; 
	posMin:= 1 ;
	for i:= 1 to dimL do 
		begin
				if (v[i] < min) then 
				begin	
					min:= v[i]; 
					posMin:= i; 	
				end;
		end;
	posicionMinima:= posMin; 	
end; 

procedure intercambio (var v : vector; dimL : integer; posMin,posMax : integer ); 
var
auxPosMin : integer; 
begin
	auxPosMin:=v[posMin];
	v[posMin]:= v[posMax]; 
	v[posMax]:=auxPosMin; 
end; 

procedure mostrarVector (v: vector; dimL : integer ); 
var
i : integer; 
begin
	for i := 1 to dimL do 
		writeln ('la posicion ',i, ' = ' ,v[i]); 
end; 

{ programa principal }
var
v : vector; 
posMin,posMax : integer ; 
dimL : integer; 
begin
posMin:= 0 ; posMax:= 0 ; 
	cargarVector(v,dimL); 
	posMin:= posicionMinima(v,posMin,dimL); 
	posMax:= posicionMax(v,posMax,dimL); 
	intercambio(v,dimL,posMin,posMax); 
	writeln ('El elemento maximo: ',v[posMin],' que se encontraba en la posicion: ',posMax ); 
	writeln ('fue intercambiado con el elemento minimo: ',v[posMax],  ' que se encontraba en la posicion: ',posMin); 
end.
