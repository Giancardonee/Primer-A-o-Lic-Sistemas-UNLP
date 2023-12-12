{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”} 

{ a ) Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:}



program dos; 
const
Nums_a_leer = 10 ; 
var
i,num,max,pos_max: integer; 
begin
max:= -1; 
  for i := 1 to Nums_a_leer do 
	begin
		write ('Ingrese un numero: '); 
		  readln (num) ; 
		    if ( num > max ) then 
		        begin 
		          max:= num ;
		          pos_max:= i ;  
	            end; 
	end ;
writeln (' ---> El numero maximo leido fue: ',max, ' en la posicion: ',pos_max); 
end.
