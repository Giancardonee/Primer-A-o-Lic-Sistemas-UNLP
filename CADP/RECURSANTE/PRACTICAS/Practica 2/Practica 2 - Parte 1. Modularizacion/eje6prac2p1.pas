{a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.}

{b. Implemente un programa que invoque al módulo del inciso a.} 

//Calculo si es par o no 
function EsPar(num:integer): boolean; 
begin
   EsPar:= ((num mod 2) = 0)  ; 
 end; 

// Calculo max
function calcularMaxPar (max,num:integer): integer; 
begin
    if ( num > max ) and (EsPar(num)) then 
       max:= num; 
       
  calcularMaxPar:= max
end; 

procedure LeerNumeros; 
var
max,num: integer; 
begin
max:= -1; 
  writeln ('Ingrese un numero: '); 
   readln (num); 
while ( num > 0 ) do 
   begin
   
       max:= calcularMaxPar(max,num); 
  writeln ('Ingrese un numero: '); 
   readln (num); 
   end; 
   
		writeln('El numero maximo par es: ',max); 
end; 


begin
LeerNumeros; 
end. 
