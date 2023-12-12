 { El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes). }

program tressss; 

const 
	cantEscuelas = 2400; 
	alumnosDocente = 23.435 ; 
type 
 str20 = string[20];
 
 escuela = record 
	cue : integer; 
	nombre : str20; 
	cantDocentes : integer;
	cantAlumnos: integer;
	localidad : str20
 
 end;
 
 procedure LeerEscuelas (var e : escuela); 
 begin
	write ('Ingrese el Nombre de la escuela:'); readln (e.nombre);
	write ('Ingrese el Cue de la escuela:'); readln (e.cue);
	write ('Ingrese la Localidad de la escuela:'); readln (e.localidad);
	write ('Ingrese la Cantidad de Docentes de la escuela:'); readln (e.cantDocentes);
	write ('Ingrese la Cantidad de Alumnos de la escuela:'); readln (e.cantAlumnos);
 end;

function determinarRelacion ( alumnos,docentes: integer): real; 
begin
	determinarRelacion:= ( alumnos / docentes ); 
end;

procedure Calcular2min (var min1,min2: real; var nombreMin1, nombreMin2 : str20; var cueMin1,cueMin2: integer ; e : escuela);
var
relacion : real; 
begin
relacion:= (determinarRelacion(e.cantAlumnos,e.cantDocentes)); 

if ( relacion < min1 ) then 
	begin
		min2:= min1; 
		min1:= relacion; 
		cueMin2:= cueMin1; 
		cueMin1:= e.cue; 
		nombreMin2:= nombreMin1; 
		nombreMin1:= e.nombre; 
	end
else if ( relacion < min2 ) then 
	begin
		min2:= relacion ; 
		cueMin2:= e.cue; 
		nombreMin2:= e.nombre; 
	
	end;
end;


function relacionLPmayor ( e : escuela ): boolean;
begin
relacionLPmayor := (e.localidad = 'La Plata') and (determinarRelacion(e.cantAlumnos, e.cantDocentes) > alumnosDocente);
end; 

var
min1,min2: real; 
nombreMin1,nombreMin2 : str20 ;
cueMin1,cueMin2,escuelasLP_relacionMayorUNESCO, i: integer; 
e : escuela; 
begin
 min1:= 32000; min2:= 32000; 
 cueMin1:= 0 ; cueMin2:= 0; 
 nombreMin1:= ' '; nombreMin2:= ' ';
 escuelasLP_relacionMayorUNESCO:= 0 ; 
 
	for i:= 1 to cantEscuelas do
		begin
			LeerEscuelas (e); 
				if ( relacionLPmayor(e)) then 
					escuelasLP_relacionMayorUNESCO:= escuelasLP_relacionMayorUNESCO + 1 ;
			Calcular2min(min1,min2,nombreMin1,nombreMin2,cueMin1,cueMin2,e);
		end;
writeln ('La cantidad de escuelas de LP con relacion mayor a la sugerida por UNESCO son: ',escuelasLP_relacionMayorUNESCO);
writeln ('Las dos ecuelas con mejor relacion de docentes por alumno son: '); 
writeln (' ( 1 ) La escuela ',nombreMin1, ' con cue: ',cueMin1); 
writeln (' ( 2 ) La escuela ',nombreMin2, ' con cue: ',cueMin2); 
end.
