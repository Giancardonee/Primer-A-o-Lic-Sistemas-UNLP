{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones. }

program seis; 
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

{En este caso, como debo calcular la POS max y el min en el mismo modulo
 uso un procedimiento para retornar DOS valores}
procedure PosMaxMin (v: vector; var posMax,posMin: integer; dimL: integer); 
var
 i : integer ; 
 max,min : integer;
begin
max:= -1 ; min:= 32000;
	for i:= 1 to dimL do 
		begin
		
			if ( v[i] > max ) then 
				begin
						max:= v[i]; 
						posMax:= i ; 
				end; 
		   if ( v[i] < min ) then
				begin
						min:= v[i]; 
						posMin:= i ; 
				end; 
		end;
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
	cargarVector(v,dimL); 
	PosMaxMin(v,posMax,posMin,dimL); 
	intercambio(v,dimL,posMin,posMax); 
	writeln ; {salto de linea}
	mostrarVector(v,dimL); 
	writeln ; {salto de linea}
	writeln ('El elemento maximo: ',v[posMin],' que se encontraba en la posicion: ',posMax ); 
	writeln ('fue intercambiado con el elemento minimo: ',v[posMax],  ' que se encontraba en la posicion: ',posMin); 
end.

