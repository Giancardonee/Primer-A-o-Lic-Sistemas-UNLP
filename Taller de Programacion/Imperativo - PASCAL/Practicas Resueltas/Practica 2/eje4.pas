{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
program a ;
const 
	dimF = 20 ;
type
	vec = array [1..dimF] of integer;
	
procedure cargarVector (var v : vec; var dimL : integer); 
var
	num : integer;
begin
	Randomize; 
	num:= random (101); 
	
	if ( ( num>0 )and (num < 100)) then 
		begin
			dimL:= dimL + 1; 
			v[dimL]:= num;
		
		if (dimL < dimF) then 
			cargarVector(v,dimL); 
		
		end;
end;

procedure imprimirVec (v : vec; dimL : integer; pos : integer); 
begin
	if (pos > dimL) then  // caso base
		writeln ('Se termino de imprimir el vector')
	else
		begin
			writeln ('posicion ',pos, ': ',v[pos]); 
			imprimirVec(v,dimL,pos+1); 
		end;
end;

function sacarMax (v : vec; dimL: integer; pos: integer; max: integer): integer;
begin
	if (dimL > dimF) then 
		sacarMax:= max // aca termina la funcion 
	else
		begin
				if ( v[pos] > max ) then 
					max:= v[pos]; 
		
			if (pos < dimL) then 
				sacarMax:=sacarMax(v,dimL,pos+1,max); // caso recursivo
		end;
end;

function sumaRecursiva(v: vec; dimL: integer; pos: integer; sumaTotal: integer): integer;
begin
        if (pos < dimL) then	// caso recursivo
			begin
				 sumaTotal := sumaTotal + v[pos];    
				 sumaRecursiva := sumaRecursiva(v, dimL, pos + 1, sumaTotal)
			end
        else // caso base
            sumaRecursiva := sumaTotal; // Agregar esta línea para evitar la llamada recursiva innecesaria
    end;



var
 v : vec;
  dimL,pos ,max,suma : integer; 
 begin
	suma:= 0;
	max:= -9999; 
	dimL:= 0;
	pos:= 1;  
	cargarVector(v,dimL); 
	imprimirVec(v,dimL,pos);
	writeln ('El maximo es: ',sacarMax(v,dimL,pos,max)); 
	writeln ('La suma de todos sus elementos es: ',sumaRecursiva(v,dimL,pos,suma)); 
 end. 
