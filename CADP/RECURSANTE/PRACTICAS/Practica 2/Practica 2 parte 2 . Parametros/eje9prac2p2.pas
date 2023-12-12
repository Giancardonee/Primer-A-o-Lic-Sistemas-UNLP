{9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program nueve; 
const 
  corte = 200; 
  
  procedure CargarDatos (var nombre, apellido: string; var nro_inscripcion: integer); 
    begin
     write ('Ingrese su nombre: '); 
       readln (nombre); 
      write ('Ingrese su apellido: '); 
        readln (apellido); 
       write ('Ingrese el numero de inscripcion: '); 
        readln (nro_inscripcion);
    end;  

procedure min2Apellidos (var min1,min2: integer; var apellidoMin1,ApellidoMin2: string; apellido: string; nro_inscripcion: integer) ; 
 begin
    if ( nro_inscripcion < min1 ) then 
       begin 
		  min2:= min1; 
		  min1:= nro_inscripcion; 
		  apellidoMin2:= apellidoMin1; 
		  apellidoMin1:= apellido; 
      end
    else if ( nro_inscripcion < min2 )then  
       begin
          min2:= nro_inscripcion; 
          apellidoMin2:= apellido; 
       end;  
 end; 

procedure max2Nombres (var max1,max2: integer; var nombreMax1,nombreMax2: string; nombre: string; nro_inscripcion: integer); 
 begin
     if ( nro_inscripcion > max1 ) then 
        begin
           max2:= max1; 
           max1:= nro_inscripcion; 
           nombreMax2:= nombreMax1; 
           nombreMax1:= nombre; 
           end
      else if ( nro_inscripcion > max2 )then 
            begin
               max2:= nro_inscripcion; 
               nombreMax2:= nombre;  
            end;   
  end; 

function esPar (nro_inscripcion: integer): boolean; 
 begin
   esPar:= (( nro_inscripcion mod 2 ) = 0 ); 
 end; 

function porcentaje_pares (cant_alum,cant_alum_pares: integer): real; 
 begin
   porcentaje_pares:= ( ( cant_alum_pares / cant_alum ) * 100) ; 
 end; 

// prog principal 
var
nro_inscripcion,min1,min2,max1,max2,cant_alum,cant_alum_pares: integer; 
apellido,nombre,apellidoMin1,apellidoMin2,nombreMax1,nombreMax2: string; 
porcentaje: real; 
begin
min1:= 9999; 
min2:= 9999; 
max1:= -1; 
max2:= -1; 
apellidoMin1:= ' ' ; 
apellidoMin2:= ' ' ; 
nombreMax1:= ' ' ; 
nombreMax2:= ' ' ; 
cant_alum:= 0 ; 
cant_alum_pares:= 0 ; 
repeat
  CargarDatos (nombre,apellido,nro_inscripcion); 
  min2Apellidos (min1,min2,apellidoMin1,apellidoMin2,apellido,nro_inscripcion); 
  max2Nombres (max1,max2,nombreMax1,nombreMax2,nombre,nro_inscripcion); 
  cant_alum:= cant_alum + 1 ; 
  if (esPar (nro_inscripcion) ) then 
    cant_alum_pares:= cant_alum_pares + 1; 
until (nro_inscripcion = corte); 
porcentaje:= porcentaje_pares (cant_alum,cant_alum_pares); 
 writeln ('--> El porcentaje de alumnos con nro de inscripcion par es: %',porcentaje:2:2); 
 writeln ('Los apellidos de alumnos con nro de inscripcion mas chicos son: ',apellidoMin1, ' y ' ,apellidoMin2); 
 writeln('Los nombres de alumnos con nro de inscripcion mas grande son: ',nombreMax1, ' y ' ,nombreMax2); 
end. 
