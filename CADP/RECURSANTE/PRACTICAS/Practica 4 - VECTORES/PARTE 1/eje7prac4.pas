{ 7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8 }

program siete;
const
	dimF = 9 ; 
type 
		vector = array [0..9] of integer;

procedure inicializarVector (var v : vector); 
var
i : integer ; 
begin
	for i:= 0 to dimF do 
		v[i]:= 0; 
end; 		

procedure descomponer (var v : vector; num : integer );
var
dig : integer ; 	
begin
	while (num <> 0) do 
		begin
			dig:= num MOD 10 ;  { me traigo el ultim digito }
			v[dig]:= v[dig] + 1 ; 	{ incremento la posicion del digito }
			num:= num DIV 10; { descompongo el numero }	
		end; 
end; 

procedure LeerNumeros (var v : vector); 
var
num: integer; 
begin
write ('Ingrese un numero: '); readln (num); 
	while (num <> -1) do 
		begin
				descomponer(v,num); 
				write ('Ingrese un numero: '); readln (num); 
		end; 
end; 

procedure recorrerPrimeraVez ( v : vector ) ; 
var
i : integer;
max : integer; 
posMax : integer; 
begin
max:= -1 ; 
	for i := 0 to dimF do 
		begin 
				if (v[i] > 0) then	
					writeln (i, ' = ',v[i], ' veces ' ); 

			{ calculo digito mas ocurrencias }
				if ( v[i] > max ) then 
					begin	
						max:= v[i];
						posMax:= i ;  
					end;	
		end; 
	writeln ('El digito con mayor cantidad de ocurrencias es el ',posMax); 	
end;

procedure recorrerSegundaVez (v: vector); 
var
i : integer;
begin
	for i:= 0 to dimF do 
		if (v[i] = 0 ) then 
			writeln ('El digito ',i, ' tiene 0 ocurrencias.'); 
end;  

var
v : vector ; 
begin
	inicializarVector(v); 
	LeerNumeros(v); 
	recorrerPrimeraVez(v); 
	recorrerSegundaVez(v); 
end.
