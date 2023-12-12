{6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}

program seis; 
var
legajo,cant_alum,promMayor8_5, promMayor6_5: integer; 
porcentaje, promedio: real ; 
begin
cant_alum:= 0 ; 
promMayor6_5:= 0 ; 
promMayor8_5:= 0 ; 
  write('Ingrese numero de legajo: '); readln(legajo); 
	   while (legajo <> -1) do 
		   begin 
		write('Ingrese el promedio: '); 	readln(promedio); 
			cant_alum:= cant_alum + 1 ; 
					  if ((legajo < 2500) and (promedio > 8.5)) then 
						 promMayor8_5:= promMayor8_5 + 1 ; 
					  if (promedio > 6.5) then 
						  promMayor6_5:= promMayor6_5 + 1 ; 
			write ('Ingrese el legajo: '); readln (legajo); 	  
		   end; 
	writeln; 
    	
	writeln('--> La cantidad de alumnos leidos son ',cant_alum); 
	writeln('--> La cantidad de alumnos con promedio mayor a 6.5 son ',promMayor6_5) ; 
    porcentaje:= ((promMayor8_5/cant_alum)* 100 ); 
    writeln ('--> El porcentaje de alumnos con promedio mayor a 8.5, y legajo menor a 2500 son: %',porcentaje:2:2); 

end.
