{ 9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
. El intendente que obtuvo la mayor cantidad de votos en la elección.
. El intendente que obtuvo el mayor porcentaje de votos de la elección. }

{ Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad.  ----> Usamos un registro para almacenar los datos del candidato }

program nueve;
type 
	str20 = string[20]; 
	candidato = record 
		Localidad : str20 ; 
		Apellido : str20 ; 
		votosObtenidos : integer ; 
		VotantesLocalidad : integer ; 
	end;
	
{ Procedimiento para leer candidato }
procedure LeerCandidato ( var c : candidato ); 
begin
	write ('Ingrese la Localidad: '); readln (c.Localidad); 
	if  (c.Localidad <> 'Zarate') then
		begin
			write ('Ingrese el Apellido: '); readln (c.Apellido); 
			write ('Ingrese los Votos Obtenidos: '); readln (c.votosObtenidos); 
			write ('Ingrese los Votantes de la Localidad: '); readln (c.VotantesLocalidad); 
		end; 
end;

{ Procedimiento para calcular candidato mayor CANTIDAD de votos }
procedure candidatoMaxVotos ( c : candidato; var max : integer; var CandidatoMax : str20); 
begin
			if ( c.votosObtenidos >max ) then 
				begin
					max:= c.votosObtenidos; 
					candidatoMax:= c.Apellido; 
				end;
end;

{ funcion que calcula porcentaje }
function porcentajeVotos ( c : candidato ): real; 
begin
porcentajeVotos:= ( (c.votosObtenidos / c.VotantesLocalidad) * 100 ); 
end; 

 { Procedimiento para calcular el candidato con mayor PORCENTAJE de votos } 
procedure maxPorcentajeVotos ( c : candidato ; var porcentajeMAX : real ; var candidatoPorcentajeMax : str20); 
var
porcentaje_intendente : real;
begin
	porcentaje_intendente:= porcentajeVotos(c);
	if ( porcentaje_intendente > porcentajeMAX ) then
		begin
				porcentajeMAX:= porcentaje_intendente; 
				candidatoPorcentajeMax:= c.Apellido; 
		end;
end;

{ Programa Principal }
var
c : candidato ; 
max : integer; 
porcentajeMax: real ; 
candidatoMax,candidatoPorcentajeMax : str20; 
begin
porcentajeMax:= -1; max:= -1 ; { inicializo ambos maximos lo mas bajo posible }
candidatoMax:= '...'; candidatoPorcentajeMax:= '...'; 

	LeerCandidato(c); 
		while (c.Localidad <> 'Zarate') do  { evaluamos las dos opciones (una con inicial mayuscula y otra con minuscula)}
			begin
					candidatoMaxVotos(c,max,candidatoMax); 
					maxPorcentajeVotos(c,porcentajeMax,candidatoPorcentajeMax); 
						LeerCandidato(c); 
			end;
			writeln ; 
	writeln ('---> El candidato con mas votos es: ',candidatoMax); 
	writeln ('---> El candidato  con mayor porcentaje de votos es: ',candidatoPorcentajeMax, ' con un porcentaje de: %',porcentajeMax:2:1); 
end. 

