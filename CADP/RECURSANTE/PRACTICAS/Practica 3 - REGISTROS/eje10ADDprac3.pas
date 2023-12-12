{ 10. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:

// resumen 
* 
Leer cantEspecies. ( for i := 1 to cantEspecies )
primer corte de control ---> tipo de planta
segundo corte de control ---> pais donde se encuentra cada planta. 
* 

● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países. }

program diez; 
const 
	cantEspecies = 3 ; // poner 320 despues 

type
	str20 = string[20] ; 
	especie = record 
		nombreCientifico : str20 ; 
		promedioVida : real ; 
		tipoPlanta : str20 ; 
		clima : str20 ; 
		Pais_se_encuentra : str20 ; 
	end; 
	
procedure LeerEspecie ( var e : especie ); 
		begin
			//write ('Ingrese el Nombre Cientifico: '); readln (e.nombreCientifico); 
			//write ('Ingrese el Promedio de Vida ( en meses ): '); readln (e.promedioVida); 
			write ('Ingrese el Tipo de Planta ( árbol, conífera, arbusto, helecho, musgo, etc. ): ') ;readln (e.tipoPlanta); 
			//write ('Ingrese el Clima (templado, continental, subtropical, desértico,etc. ): '); readln (e.clima); 
			write ('Ingrese el Pais donde se encuentra: '); readln (e.Pais_se_encuentra); 
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
esPlantaNativa_Subtropical:= ( ( e.Pais_se_encuentra = 'Argentina') and ( e.clima = 'subtropical' ) );  
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

function paisCorte (pais : str20): boolean
begin
	paisCorte:= (pais = 'zzz'): 
end;

 {Leer cantEspecies. ( for i := 1 to cantEspecies )
primer corte de control ---> tipo de planta
segundo corte de control ---> pais donde se encuentra
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países. 
la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz' }


 { programa principal }
 
var
plantaPaisesMAX,nombreMax1,nombreMax2,tipoPlantaMin : str20 ; 
auxTipoPlanta, auxPais : str20 ; 
cantPaises,cantPaisesMax: integer ; 
i,cantTipoPlanta, min : integer ;
sumaPromedioVida,promedio,max1,max2 : real ; 
e : especie ; 
ok : boolean ; 
begin
min:= 32000;  max1:= -1 ; max2:= -1 ; cantPaisesMax:= -1; 
plantaPaisesMAX:= '...'; nombreMax1:= '...'; nombreMax2:= '...';
tipoPlantaMin:= '...'; 
	for i:= 1 to cantEspecies do 
		begin
			LeerEspecie (e); 
				cantTipoPlanta:= 0 ;
				 sumaPromedioVida:= 0 ; 
				 auxTipoPlanta := e.tipoPlanta; 
					while  (e.tipoPlanta = auxTipoPlanta) do  { primer corte de control }
						begin
									cantTipoPlanta:= cantTipoPlanta + 1; 
									sumaPromedioVida:= sumaPromedioVida + e.promedioVida; 	
									auxPais:= e.Pais_se_encuentra; { variable auxiliar para corte de control por pais } 
									cantPaises:= 0 ; { hace referencia a la cantidad de plantas de cada pais }
									{ nombre cientifico de las dos plantas mas longevas }
									plantasLongevas (e,max1,max2,nombreMax1,nombreMax2); 
										while ( (  e.tipoPlanta = auxTipoPlanta ) and ( e.Pais_se_encuentra <> 'zzz') and (e.Pais_se_encuentra = auxPais) ) do  
												begin
											{ ● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical. }
														if (esPlantaNativa_Subtropical(e)) then  
															writeln ('La planta: ',e.nombreCientifico, ' es nativa de argentina y se encuentra en regiones con climas subtropicales'); 
													cantPaises:= cantPaises + 1 ; 
												{ ● El nombre de la planta que se encuentra en más países.  }
													plantaMasPaises(e.nombreCientifico,cantPaisesMax,cantPaises,plantaPaisesMAX); 
													LeerEspecie (e); 
													if (paisCorte(e.Pais_se_encuentra))
												end; {end del while corte de control por Pais}
							{ tipo de planta minimo con menor cantodad  de plantas }
							minCantidad(tipoPlantaMin,min,cantTipoPlanta,e.tipoPlanta); 
					end;   {end del while corte de control por tipo} 
				{ tiempo promedio de vida de planta de cada tipo }
				promedio:=promedioVida(cantTipoPlanta,sumaPromedioVida); 
				writeln ('El tiempo promedio de vida de la planta de tipo ',auxTipoPlanta, ' es: ',promedio); 	
		end;   { end del for } 
	writeln ('El tipo de planta con menor cantidad de plantas es: ',tipoPlantaMin); 
	writeln ('El nombre cientifico de las dos plantas mas longevas son: ',nombreMax1, ' y ',nombreMax2); 
	writeln ('El nombre de la planta que se encuentra en mas paises es: ',plantaPaisesMAX); 
end. 



