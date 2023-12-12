{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6}
program dos ; 
procedure descomponerNum (num : integer);
var
	resto : integer ; 
begin
	if (num <>0) then 
		begin

				resto:= num mod 10; 
				num:= num div 10;
				descomponerNum(num);  // llamado recursivo
				writeln (resto); 	
		end ;
end; 

procedure pedirNumeros (); 
var
	num : integer; 
begin
	write ('Ingrese un numero: '); 
	readln (num); 
	if (num <>0) then 
		begin
			descomponerNum(num); 
			pedirNumeros();  // llamado recursivo
		end; 
end; 

{programa principal}

begin
	pedirNumeros(); 
; end. 
