{ 7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios. }

	// la informacion se ingresa ordenada por universidad : corte de control por universidadActual
	// la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse
	
program siete; 
type 
	str20 = string[20]; 
	centro = record
		nombre : str20 ;
		universidad : str20 ; 
		Investigadores : integer ;
		Becarios : integer ; 
	end;
	
procedure LeerCentro ( var c : centro );
	begin
		writeln; 
		write ('Ingrese la cantidad de Investigadores: '); readln (c.Investigadores); 
		if ( c.Investigadores <> 0 ) then 
			begin
					write ('Ingrese el nombre del Centro: '); readln (c.nombre);
					write ('Ingrese el nombre de la Universidad: '); readln (c.universidad);
					write ('Ingrese la cantidad de becarios: '); readln (c.Becarios);
			end; 
	end;
	
//Universidad con mayor cantidad de investigadores en sus centros.
procedure MaxInvestigadoresUniversidad ( nombreUniversidad : str20 ; cantInvestigadores : integer; var max : integer ; var uniMaxInvestigadores : str20); 
	begin
			if ( cantInvestigadores > max ) then 
				begin
					max:= cantInvestigadores; 
					uniMaxInvestigadores:= nombreUniversidad; 
				end;
	end;

//Los dos centros con menor cantidad de becarios.
procedure calcularCentrosMinBecarios ( nombreCentro : str20 ; cantBecarios : integer ; var min1,min2 : integer; var nombreMin1,nombreMin2 : str20); 
begin
	if ( cantBecarios < min1 ) then 
		begin
			min2:= min1; 
			min1:= cantBecarios; 
			nombreMin2:= nombreMin1; 
			nombreMin1:= nombreCentro;
		end
	else if ( cantBecarios < min2 ) then 
		begin
			min2:= cantBecarios;
			nombreMin2:= nombreCentro; 
		end;
end;


 { ● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios. }
// Prog principal 
var
min1,min2,max : integer;
centrosPorUniversidad,cantBecarios, cantInvestigadores : integer; 
nombreMin1,nombreMin2,uniMaxInvestigadores : str20; 
universidadActual : str20 ; 
c : centro ; 
begin
min1:= 32000; min2:= 32000; max:= -1;
nombreMin1:= '...'; nombreMin2:= '...'; uniMaxInvestigadores:= '...'; 
	LeerCentro (c); 
	while ( c.Investigadores <> 0 ) do 
			begin
					universidadActual:= c.universidad; 
					centrosPorUniversidad:= 0 ; 
					cantBecarios:= 0 ; 
					cantInvestigadores:= 0 ; 
						while ( ( c.universidad = universidadActual ) and ( c.investigadores <> 0 ) ) do 
								begin
										centrosPorUniversidad:= centrosPorUniversidad + 1 ;
										cantBecarios:= cantBecarios + c.Becarios; 
										cantInvestigadores:= cantInvestigadores + c.Investigadores;
										MaxInvestigadoresUniversidad(universidadActual,cantInvestigadores,max,uniMaxInvestigadores); 
										calcularCentrosMinBecarios (c.nombre,cantBecarios,min1,min2,nombreMin1,nombreMin2); 
										LeerCentro (c); 
								end;
								writeln ('La cantidad de centros de la universidad ',universidadActual, 'es: ',centrosPorUniversidad); 
			end;
		writeln ('La universidad con mayor cantidad de investigadores es: ',uniMaxInvestigadores); 
		writeln ('Los centros con menor becarios son: ',nombreMin1, ' y ',nombreMin2); 	
end.


