{ 11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda. }

{De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión     -----> Registro}


program once; 
type 
	str20 = string[20];
	avion = record 
			codAvion : integer;
			paisSalida : str20; 
			paisLlegada : str20 ; 
			kmRecorridos : real ;
			porcentajeOcupacion : real;
	end;

{ leemos el avion }
procedure LeerAvion ( var a : avion ); 
begin
	write ('Ingrese el codigo de avion: '); readln (a.codAvion);
	if ( a.codAvion <>44 ) then 
		begin
			write ('Ingrese el Pais de Salida: '); readln (a.paisSalida); 
			write ('Ingrese el Pais de Llegada: ') ; readln (a.paisLlegada); 
			write ('Ingrese los Km recorridos: '); readln (a.kmRecorridos); 
			write ('Ingrese el Porcentaje de ocupacion del vuelo: '); readln (a.porcentajeOcupacion); 
		end;
end;

{  Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron. }
{ para saber la cantidad de km que recorrio un avion, debo sumar los vuelos que hizo el mismo avion 
* es decir, mientras el codigo de avion sea el mismo, por lo tanto
* se necesita una variable contadora que tenga la suma de todos los km recorridos por el avion 
* esa variable, al leer un codigo de avion nuevo, se inicializa en 0. Esto nos sirve para sacar minimo y maximo. }


{ calculo los dos aviones con mayor cantidad de km}
procedure dosAvionesMasKm (codigoAvion : integer; var max1,max2 : real ;var avionMax1,avionMax2 : integer; kmTotales: real ); 
begin
	if ( kmTotales > max1 )then 
		begin
			max2:= max1; 
			max1:= kmTotales;
			avionMax2:= avionMax1;
			avionMax1:= codigoAvion;
		end
	else if ( kmTotales > max2 ) then
		begin
			max2:= kmTotales;
			avionMax2:= codigoAvion;
		end;
end;

{ calculo los dos aviones con menor cantidad de km }
procedure dosAvionesMenosKm (codigoAvion : integer; var min1,min2: real; var avionMin1,avionMin2 : integer ; kmTotales : real ); 
begin
	if ( kmTotales < min1 ) then 
		begin
			min2:= min1; 
			min1:= kmTotales;
			avionMin2:= avionMin1 ; 
			avionMin1:= codigoAvion;
		end
	else if ( kmTotales < min2 ) then
		begin
			min2:= kmTotales; 
			avionMin2:= codigoAvion;
		end;
end;

 { El avión que salió desde más países diferentes.  }
procedure avionMasPaises (codigoAvion : integer; var cantMaxPaises : integer; cantPaises : integer; var avionMaxPaises : integer  ); 
begin
	if ( cantPaises > cantMaxPaises ) then 
		begin
				cantMaxPaises:= cantPaises;
				avionMaxPaises:= codigoAvion ; 
		end;
end;

{ La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión. }
 function vuelosMas5milKm_ocupacion60 (kmRecorridos : real; ocupacion : real) : boolean;
 begin
	vuelosMas5milKm_ocupacion60:= ( (kmRecorridos >5000) and (ocupacion<60) );  
 end;
 
 { La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda. }
 function vueloAustr_NZelanda_max10milKM (paisLlegada : str20 ;kmRecorridos : real ): boolean ; 
 begin
 vueloAustr_NZelanda_max10milKM:= ( (kmRecorridos<10000) and ((paisLlegada ='Australia') or (paisLlegada = 'Nueva Zelanda')) );   
 end;
 
  { programa principal }
  var
  kmTotales,max1,max2,min1,min2 : real ;
  avionMax1,avionMax2,avionMin1,avionMin2,avionPaisesMax : integer ;
  cantMaxPaises,cantPaises : integer ;
  cant1 : integer ; { La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión }
  cant2 : integer; { La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda }
  auxCodAvion : integer;
  auxPaisSalida : str20;
  a : avion ; 
  begin
  avionMax1:= -1; avionMax2:= 0;  avionMin1:= -1; avionMin2:= 0;  {inicializo codAviones max y min }
  max1:= -1; max2:= -1; min1:= 32000;  min2:= 32000; cantMaxPaises:= -1;   { inicializo maxs y mins }
  cant1:= 0 ; cant2:= 0 ; { inicializo cantidad de vuelos }

 LeerAvion (a); 
	while  (a.codAvion <> 44 ) do 
		begin
			kmTotales:= 0 ; 
			cantPaises:= 0; 		
				AuxCodAvion :=a.codAvion; 
					 while ( (a.codAvion <> 44 ) and (a.codAvion  = AuxCodAvion) ) do 	{ corte de control codigo de avion ( ordenado por codigo de avion) }
							begin
							auxPaisSalida := a.paisSalida ;
												 while ( (a.codAvion<>44)  and (a.codAvion = AuxCodAvion) and (a.paisSalida = auxPaisSalida)) do  {de cada avion por pais de salida ( corte de control por pais de salida ) }
														begin
													
																	if (vuelosMas5milKm_ocupacion60(a.kmRecorridos,a.porcentajeOcupacion)) then 
																		cant1:= cant1 + 1 ; 
																	
																	if (vueloAustr_NZelanda_max10milKM(a.paisLlegada,a.kmRecorridos)) then
																		cant2:= cant2 + 1 ; 
													
																	kmTotales:= kmTotales + a.kmRecorridos; 
																	cantPaises:= cantPaises + 1 ;
																																				
																 writeln; { salto de linea }
																	
															LeerAvion (a); 
													end; { fin del corte de control de paises de salida }
										
										 { Los dos aviones que más kilómetros recorrieron } 
											dosAvionesMasKm(auxCodAvion,max1,max2,avionMax1,avionMax2,kmTotales);  { se le pasa auxCodAvion porque tiene el avion anterior al ultimo que se leyo }
											{ Los dos aviones que menos km recorrieron }
											dosAvionesMenosKm(auxCodAvion,min1,min2,avionMin1,avionMin2,KmTotales); { se le pasa auxCodAvion porque tiene el avion anterior al ultimo que se leyo }
											
												{  El avión que salió desde más países diferentes. }
												avionMasPaises(auxCodAvion,cantMaxPaises,cantPaises,avionPaisesMax); 
											
							end; { fin del corte de control de codigo de avion }	
		end; { fin del while de corte de programa.}
			writeln; { salto de linea }
writeln ('Los dos aviones que MAS km recorrieron tienen codigo: ',avionMax1, ' y ',avionMax2); 
writeln ('Los dos aviones que MENOS km recorrieron tienen codigo: ',avionMin1, ' y ',avionMin2); 
writeln ('El avion que salio desde mas paises es el avion con codigo: ',avionPaisesMax); 
writeln ('La cantidad de vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion son: ',cant1); 
writeln ('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda son: ',cant2);
  end.

