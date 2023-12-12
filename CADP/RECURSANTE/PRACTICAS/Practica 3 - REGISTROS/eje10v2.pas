{ 10. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:

{ LeerEspecie
* // rosa ----> leo paises hasta 'zzz'

al terminar de leer el tipo: 
El tiempo promedio de vida de las plantas de cada tipo.


 al terminar de leer todo (con el for)
  El tipo de planta con menor cantidad de plantas.
  El nombre científico de las dos plantas más longevas.
  * 
*   }


● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países. }

program  diez; const 
	cantEspecies = 3 ; // poner 320 despues 

type
	str20 = string[20] ; 
	especie = record 
		nombreCientifico : str20 ; 
		promedioVida : real ; 
		tipoPlanta : str20 ; 
		clima : str20 ; 
		pais : str20 ; 
	end; 
	
procedure LeerEspecie ( var e : especie ); 
		begin
			write ('Ingrese el Nombre Cientifico: '); readln (e.nombreCientifico); 
			write ('Ingrese el Promedio de Vida ( en meses ): '); readln (e.promedioVida); 
			write ('Ingrese el Tipo de Planta ( árbol, conífera, arbusto, helecho, musgo, etc. ): ') ;readln (e.tipoPlanta); 
			//write ('Ingrese el Clima (templado, continental, subtropical, desértico,etc. ): '); readln (e.clima); 
			write ('Ingrese el Pais donde se encuentra: '); readln (e.pais); 
		end; 


// El tipo de planta con menor cantidad de plantas.
procedure minCantidad (var tipoPlantaMin : str20 ; var min : integer; cant : integer ; TipoPlanta : str20 ); 
begin
	if ( cant > min ) then 
		begin
				min:= cant; 
				tipoPlantaMin:= TipoPlanta; 
		end; 
end; 

//El tiempo promedio de vida de las plantas de cada tipo
function promedioVida ( cantPlantas : integer ; sumaPromedioVida : real  ) : real ;
begin
		promedioVida:= ( cantPlantas / sumaPromedioVida ); 
end; 

//● El nombre científico de las dos plantas más longevas.
 { seria el nombre de las dos plantas con mayor edad  }

procedure plantasLongevas (  e : especie ;   var max1,max2 : real ; var nombreMax1,nombreMax2 : str20 ); 
begin
	if ( e.promedioVida > max1 ) then 
		begin
			max2:= max1; 
			max1:= e.promedioVida; 
			nombreMax2:= nombreMax1; 
			nombreMax1:= e.nombreCientifico; 
		end
    else if ( e.promedioVida > max2 ) then
		begin
			max2:= e.promedioVida; 
			nombreMax2:= e.nombreCientifico; 
		end;
end; 

//Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
{ si esta funcion devuelve TRUE, debo informar dentro del programa Principal.  }
function esPlantaNativa_Subtropical ( e : especie ): boolean; 
begin
esPlantaNativa_Subtropical:= ( ( e.pais = 'Argentina') and ( e.clima = 'subtropical' ) );  
end; 

//● El nombre de la planta que se encuentra en más países. 
procedure plantaMasPaises ( nombrePlanta : str20 ; var cantPaisesMax : integer ; cantPaises: integer; var plantaPaisesMAX : str20 ); 
begin
	if ( cantPaises > cantPaisesMax ) then 
		begin
				cantPaisesMax:= cantPaises;
				plantaPaisesMAX:= nombrePlanta; 
		end; 
end; 

 { programa principal }
 var
 e : especie; 
i : integer ; 
plantaActual : str20 ;
paisActual : str20 ; 
 begin
	for i := 1 to cantEspecies do 
		begin
					LeerEspecie(e); 	// leer planta
						plantaActual:= e.tipoPlanta; 
							while ( e.tipoPlanta = plantaActual ) do 		{ mientras tipoPlanta = plantaActual}
								begin
										paisActual:=e.pais; 
								
														while ( (e.tipoPlanta = plantaActual ) and (e.pais <> 'zzz') and (e.pais = paisActual) ) do 												{ (tipoPlanta = tipoPlanta and (mientas que pais_se_encuentra <>'zzz') and (pais_se_encuentra = paisActual)}
																begin
															
												
												
												
																end;
										
																			
									end;
		end;
 end.
 
 
 
