{ b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio. }

program doce; 

const 
 PrecioTonelada = 320; 
 LocalidadCorte = 'Saladillo';
 HectareasCorte = 900 ;   
  Tonelada_PorHA_zona1 = 6; // 6 toneladas por hectareas
  Tonelada_PorHA_zona2 = 2.6 ;// 2,6 toneladas por hectareas  
  Tonelada_PorHA_zona3 = 1.4 ; // 1.4 toneladas por hectareas
 type 
 RangoTipoZona = 1..3 ; 
 
 procedure LeerDatosCampo (var Localidad: string; var haSembradas: integer; var TipoZona: RangoTipoZona; var cantCamposLeidos:integer); 
  begin
   write ('Ingrese la localidad: '); 
   readln (Localidad); 
   write ('Ingrese las hectareas sembradas: '); 
   readln (haSembradas); 
   write ('Ingrese el tipo de zona: ( 1, 2 o 3) : ');
   readln (TipoZona);
   cantCamposLeidos:= cantCamposLeidos + 1 ; 
    end;  
 
 function rendimientoEconomico (cantHectareas: integer; tipoZona: RangoTipoZona): real; 
 begin
   if ( tipoZona = 1 ) then 
     rendimientoEconomico:= ( ( cantHectareas *Tonelada_PorHA_zona1 ) * PrecioTonelada)
    else if ( tipoZona = 2 ) then 
       rendimientoEconomico:= ( ( cantHectareas * Tonelada_PorHA_zona2 ) * PrecioTonelada ) 
    else 
       rendimientoEconomico:= ( ( cantHectareas * Tonelada_PorHA_zona3 ) * PrecioTonelada ) ;       
 end; 

function tresDeFebrero (Localidad: string; rendimiento:real): boolean; 
 begin
    tresDeFebrero:= (Localidad = 'Tres de Febrero') and ( rendimiento > 10000 ); 
 end; 


procedure LocalidadMaxMinRendimiento (Localidad: string; rendimiento: real;  var max: real;  var LocalidadMax: string; var min:real; var LocalidadMin:string); 
 begin
		if ( rendimiento > max ) then 
		   LocalidadMax:= Localidad; 
		   
	   if ( rendimiento < min ) then 
		   LocalidadMin:= Localidad; 
		   
 end; 
 

 function RendimientoPromedio (cantCamposLeidos:integer; sumaRendimiento: real): real;
  begin
    RendimientoPromedio:= (sumaRendimiento / cantCamposLeidos); 
  end; 
 
 var
 Localidad,LocalidadMax,LocalidadMin: string; 
 cantCamposLeidos, haSembradas,cant3febreroRendimientoSuperior: integer; 
 tipoZona : RangoTipoZona; 
 max,min,rendimiento, sumaRendimiento: real; 

 begin
 max:= -1; 
 min:= 9999; 
 LocalidadMax:= ' ' ;
 LocalidadMin:= ' ' ; 
 cantCamposLeidos:= 0 ; 
  sumaRendimiento:= 0 ; 
  cant3febreroRendimientoSuperior:= 0; 
 repeat 
	 LeerDatosCampo(Localidad,haSembradas,tipoZona,cantCamposLeidos); 
	 rendimiento:= rendimientoEconomico (haSembradas,tipoZona); 
	 sumaRendimiento:= sumaRendimiento + rendimiento; 
	 
	 if tresDeFebrero (Localidad,rendimiento) then 
	   cant3febreroRendimientoSuperior:=cant3febreroRendimientoSuperior + 1; 
	 
	 LocalidadMaxMinRendimiento (Localidad,rendimiento,max,LocalidadMax,min,LocalidadMin); 
 until (Localidad = LocalidadCorte) and (haSembradas = HectareasCorte);
 
 writeln ('El rendimiento economico promedio es de: ',RendimientoPromedio(cantCamposLeidos,sumaRendimiento):2:2); 
 writeln ('La Localidad con maximo rendimiento economico es: ',LocalidadMax); 
 writeln ('La Localidad con minimo rendimiento economico es: ',LocalidadMin);  
 writeln ('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 son: ',cant3febreroRendimientoSuperior)

 end.
