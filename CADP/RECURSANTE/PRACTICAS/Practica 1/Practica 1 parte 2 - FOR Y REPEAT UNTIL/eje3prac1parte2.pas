{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota.}

{ ASUMIMOS QUE LA NOTA ES ENTERA, POR LO TANTO USAMOS UN SUBRANGO}

program tres; 
type
 notas = 1..10; 
 str40 = string[40]; 
 var
 nota: notas; 
 nombre: str40; 
 nota_8_mayor, nota_7: integer; 
 begin
 nota_8_mayor := 0; 
 nota_7 := 0 ; 
  repeat 
   write ('Ingrese su nombre: ') ; 
     readln (nombre) ; 
       write ('Ingrese la nota obtenida en EPA: ');
          readln (nota); 
            if ( nota >= 8 ) then 
               nota_8_mayor:= nota_8_mayor + 1  
            else if ( nota = 7) then 
               nota_7:= nota_7 + 1 ;  
 until (nombre = 'ZZ'); 
 
 writeln ('Los alumnos con nota 8 o mayor son: ',nota_8_mayor); 
 writeln ('Los alumnos con nota igual a 7 son: ',nota_7) ; 
 end.
