{ 12. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación. }

program doce ; 
const 
 Tonelada_PorHA_zona1 = 6; // 6 toneladas por hectareas
 Tonelada_PorHA_zona2 = 2.6 ;// 2,6 toneladas por hectareas  
 Tonelada_PorHA_zona3 = 1.4 ; // 1.4 toneladas por hectareas
 
 
 type 
  tipoZonaSiembra = 1..3; 
 
 procedure cargarDatos (var tipoZona: tipoZonaSiembra; var cantHectareas: integer; var PrecioTonelada: real);  
 begin
  write ('Ingrese el tipo de zona : (1 , 2 o 3 ) : '); 
   readln (tipoZona); 
   write ('Ingrese la cantidad de hectareas ( ha ) :  ');
    readln (cantHectareas); 
   write ('Ingrese el precio por tonelada: '); 
    readln (PrecioTonelada);  
 end; 

function rendimientoEconomico (cantHectareas: integer; PrecioTonelada: real; tipoZona: tipoZonaSiembra): real; 
 begin
   if ( tipoZona = 1 ) then 
     rendimientoEconomico:= ( ( cantHectareas *Tonelada_PorHA_zona1 ) * PrecioTonelada)
    else if ( tipoZona = 2 ) then 
       rendimientoEconomico:= ( ( cantHectareas * Tonelada_PorHA_zona2 ) * PrecioTonelada ) 
    else 
       rendimientoEconomico:= ( ( cantHectareas * Tonelada_PorHA_zona3 ) * PrecioTonelada ) ;       
 end; 

var
tipoZona : tipoZonaSiembra; 
cantHectareas: integer; 
PrecioTonelada: real;  
begin
// se deberia calcular UNA sola vez: 
cargarDatos (tipoZona,cantHectareas,PrecioTonelada); 
writeln ('El rendimiento economico de dicha plantacion es de: $',rendimientoEconomico (cantHectareas,PrecioTonelada,tipoZona):2:2); 
end.
