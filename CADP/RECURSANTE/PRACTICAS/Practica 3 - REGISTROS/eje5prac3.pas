{ 5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro }

program tres; 
type
	str20 = string[20]; 
	
	auto = record
		marca : str20; 
		modelo : str20;
		precio : real; 
	end;
	
procedure LeerAuto (var a : auto); 
begin
write ('Ingrese la marca del auto: '); readln (a.marca); 
	if(a.marca <> 'zzz') then  
		begin
			write('Ingrese el modelo del auto: '); readln (a.modelo);
			write ('Ingrese el precio del auto: '); readln (a.precio); 
		end;
end;

procedure CalcularMax (a : auto; var max: real; var modeloMax,marcaMax : str20); 
	begin
		if ( a.precio > max ) then 
			begin
				max:= a.precio; 
				modeloMax:= a.modelo;
				marcaMax:= a.marca; 
			end;
	end;
	
function calcularPromedio (sumaPrecios : real ; cantAutos: integer): real;
	begin
		calcularPromedio:= (sumaPrecios / cantAutos);
	end;

var 
max, sumaTotal : real; 
cantAutos: integer;
modeloMax,marcaMax,marcaActual: str20; 
a : auto ; 
begin
max:= -1; 
	LeerAuto (a); 
	while ( a.marca <> 'zzz' ) do 
		begin
			cantAutos:= 0 ; 
			sumaTotal:= 0 ;
			marcaActual:= a.marca; 
				while ( a.marca = marcaActual )do  { corte de control por Marca }
					begin
						cantAutos:= cantAutos + 1 ; 
						sumaTotal:= sumaTotal + a.precio; 
						CalcularMax(a,max,modeloMax,marcaMax); 
						LeerAuto (a); 
					end;
				writeln ('El precio promedio de la marca ',marcaActual, ' es:',calcularPromedio(sumaTotal,cantAutos):2:2 ); 
		end;
	writeln ('El auto mas caro es de la marca ',marcaMax, ' y su modelo es: ',modeloMax); 
end.
