{7. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}

program siete; 
const 
 corte = 10; 
 procedure descomponerNum(num:integer; var cant_dig, suma_dig: integer); 
  var
     digito: integer; 
  begin
    while ( num <> 0 )do 
      begin
         digito:= num mod 10; 
         cant_dig:= cant_dig + 1 ; 
         suma_dig:= suma_dig + digito; 
         num:= num div 10; 
      end; 
  end; 

var
num,cant_dig,suma_dig: integer; 
begin
cant_dig:= 0 ; 
repeat
suma_dig:= 0; 
write('Ingrese un numero: '); 
 readln(num); 
descomponerNum (num,cant_dig,suma_dig); 
until ( suma_dig = corte ); 
writeln ('La cantidad total de digitos leidos son: ',cant_dig); 
end.
