{ 8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2020 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares. }


//Cada escuela puede presentar más de un proyecto .... 
{La información se ingresa ordenada consecutivamente por localidad ----> Corte de control por localidad -----> LocalidadActual 
*  y para cada localidad por escuela }

{lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse) 
* incluir  ( proyecto.codigo <> -1 ) dentro del while de corte  }
{ Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad. }

program ocho; 
type
str25 = string[25]; 
	datosDocente = record
			Dni : integer ; 
			nombre : str25 ; 
			apellido : str25 ; 
			email : str25 ; 
	end; 
	
	proyecto = record
		codigo :  integer; 
		titulo : str25 ; 
		docente : datosDocente ;
		AlumnosProyecto : integer ; 
		nombreEscuela : str25 ; 
		Localidad :  str25 ; 
	end;
//____________________________________________________________________________________
{ procedimientos para leer datos del proyecto y del docente  } 
procedure LeerDocente (var d : datosDocente ) ; 
begin
		write ('Ingrese el dni del docente: '); readln (d.dni);
		write ('Ingrese el nombre del docente: '); readln (d.nombre); 
		write ('Ingrese el apellido del docente: '); readln (d.apellido); 
		write ('Ingrese el email del docente: '); readln (d.email);
end;
procedure LeerProyecto ( var p : proyecto); 
begin
	write('Ingrese el codigo del proyecto: '); readln (p.codigo); 
	if ( p.codigo <> -1 ) then 
	begin
			write ('Ingrese el titulo del proyecto: '); readln (p.titulo); 
			write ('Ingrese la cantidad de alumnos que participan del proyecto: '); readln (p.AlumnosProyecto); 
			write ('Ingrese el nombre de la escuela: '); readln (p.nombreEscuela); 
			write ('Ingrese la Localidad: '); readln (p.localidad); 
			LeerDocente(p.docente); 
	end;
end;
//____________________________________________________________________________________


//____________________________________________________________________________________
{ Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.} 

 { si en el programa principal se lee la Localidad 'Daireaux' y esta funcion es TRUE ( el codigo tiene mismos dig pares que impares )
 * Informo dentro del programa principal el titulo del proyecto. } 
function DigitosCod_Pares_Impares_Iguales (codigo : integer): boolean;
var
dig, num : integer ;   { num es una variable opcional, podria operar directamente sobre el parametro codigo}
digPares , digImpares : integer ; 
ok : boolean ; 
begin
digPares:= 0 ; 
digImpares:= 0 ; 

		num:= codigo; { me traigo el codigo a descomponer en la variable num }
							while ( num <> 0) do 
									begin
												dig := num MOD 10 ;  {me traigo el ultimo digito }
														
						{ si el numero es par, incremento digPares, sino el numero es impar e incremento digImpares}									
															if ( dig MOD 2 = 0 ) then 
																	digPares:= digPares + 1 
															else 
																	digImpares:= digImpares + 1 ; 
							
										    num:= num DIV 10 ; { Descompongo el numero ( borro ultimo digito )}	
									end;
			{ una vez que salga del while es porque termine de descomponer el nro }
		if (digImpares = digPares ) then 
				ok:= True
		else 
				ok:= False; 
	
DigitosCod_Pares_Impares_Iguales:= ok ; 
end;
//____________________________________________________________________________________


{ Nombres de las dos escuelas con mayor cantidad de alumnos participantes }
procedure escuelasMax (alumnosParticipantes : integer ;  nombreEscuela : str25;  var max1,max2 : integer; var nombreMax1,nombreMax2: str25); 
begin
		if ( alumnosParticipantes > max1 ) then 
			begin
					max2:= max1; 
					max1:= alumnosParticipantes;
					nombreMax2:= nombreMax1; 
					nombreMax1:= nombreEscuela; 
			end
		else if ( alumnosParticipantes > max2 ) then 
			begin
				max2:= alumnosParticipantes;
				nombreMax2:= nombreEscuela; 
			end; 

end;

// prog principal
var
p : proyecto ;  { mi registro para almacenar datos de proyectos y docentes}
LocalidadCorte,EscuelaCorte : str25;  { variables para corte de control }
alumnosParticipantes,max1,max2 : integer;  { variable usada para calcular maximo }
nombreMax1, nombreMax2 : str25 ;       { en estas variables tengo las dos escuelas con mayor cant de alumnos participantes }
cantEscuelasLocalidad ,cantEscuelasTotal: integer ; 
begin
{ inicializo variables con ... para que no tenga ningun nombre valido }
LocalidadCorte:= '...'; EscuelaCorte:= '...';  
nombreMax1:= '...'; nombreMax2:= '...'; 
cantEscuelasTotal:= 0 ; 
{ inicializo maximos lo mas bajo posible para que se actualice ni bien leo la primera vez }
max1:= -1; max2:= -1; 


LeerProyecto(p); 
	while ( p.codigo <> -1 ) do  { corte de fin de programa. }
		begin
			LocalidadCorte:= p.Localidad; 
				cantEscuelasLocalidad:= 0 ; 
					while (( p.codigo <> -1) and (p.Localidad = LocalidadCorte ) ) do  { primer corte de control  ( por Localidad) }
												begin
														EscuelaCorte:= p.nombreEscuela;							
															alumnosParticipantes:= 0 ;  { al leer una NUEVA escuela, tengo que volver a contar los alumnos participantes del proyecto }
																					while ( ( p.codigo <> -1 ) and (p.nombreEscuela = EscuelaCorte) and (p.Localidad = LocalidadCorte) ) do { segundo corte de control  (por Escuela ) } 
																							begin
																							
																				{ Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares. } 
																											if ( ( p.Localidad = 'Daireaux') and (DigitosCod_Pares_Impares_Iguales (p.codigo)) ) then
																												writeln ('El proyecto con el titulo: ',p.titulo, 'tiene codigo con mismos digitos pares que impares'); 
																									cantEscuelasLocalidad:= cantEscuelasLocalidad + 1 ;  
																									alumnosParticipantes:= alumnosParticipantes + p.alumnosProyecto; 
																									cantEscuelasTotal:= cantEscuelasTotal + 1 ;
																									LeerProyecto(p); 
																									
																							end; { fin del corte de control de escuelaActual }
																				
														escuelasMax(alumnosParticipantes,EscuelaCorte,max1,max2,nombreMax1,nombreMax2); 	
							{ le paso EscuelaCorte como parametro porque es la Escuela que se estaba leyendo y contando los alumnos }
							  { si le paso la escuela de p.nombreEscuela estaria pasando una escuela distinta a la que se estaba leyendo }
												end;  {  fin del corte de control de LocalidadActual }
					writeln ('La cantidad de escuelas de la localidad: ',LocalidadCorte, ' son: ',cantEscuelasLocalidad); 					
										
		end;  { fin del while corte programa } 
	writeln ('La cantidad de escuelas totales son: ',cantEscuelasTotal) ;
	writeln ('Las escuelas con mayor cantidad de alumnos participantes son: '); 
	writeln (' ( 1 ) ',nombreMax1); 
	writeln (' ( 2 ) ',nombreMax2); 
end.

 { preguntar si lo que esta comentadio en linea 147 and (p.Localidad = LocalidadCorte)  tendria que estar o no } 
