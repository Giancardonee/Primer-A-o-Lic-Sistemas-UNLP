 {El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante
 los meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program dos;
type 
	rangoDias = 1..31; 
	rangoMeses = 1..12; 
	
	fechaCasamientos = record 
		dia : rangoDias; 
		mes : rangoMeses; 
		anho : integer ; 
	
	end;

procedure leerCasamiento (var c : fechaCasamientos); 
	begin
		write ('Ingrese el anho del casamiento: '); readln (c.anho);
		 if ( c.anho = 2019 ) then 
		   begin
		     write ('Ingrese el mes del casamiento: '); readln (c.mes); 
			  write ('Ingrese el dia del casamiento: '); readln (c.dia); 
		   end;
	end; 

 function casamientoVerano (mes : rangoMeses): boolean ; 
	begin
		casamientoVerano:= ((mes = 1) or (mes = 2) or (mes = 3) );
// tambien podria hacer ( (si mes >=1) and (mes <=3 ) ) 
	end; 

function Primeros10dias ( dia : integer): boolean ; 
	begin
		Primeros10dias:= ( (dia >= 1) and (dia <=10) ); 
	end; 

var
fechaCas : fechaCasamientos; 
casamientosVerano,casamientosPrimeros10Dias: integer;  
begin
casamientosVerano:= 0 ; 
casamientosPrimeros10Dias:=0 ; 
  leerCasamiento (fechaCas); 
 while ( ( fechaCas.anho <> 2020 ) and ( fechaCas.anho = 2019 ) ) do 
	begin
	
		if (casamientoVerano(fechaCas.mes)) then 
			casamientosVerano:= casamientosVerano + 1 ; 
	
		if ( Primeros10dias(fechaCas.dia) ) then
			casamientosPrimeros10Dias:= casamientosPrimeros10Dias + 1 ;
			
		leerCasamiento (fechaCas); 	
	end;
writeln ('Los casamientos en los meses de verano ( enero,febrero,marzo ) son: ',casamientosVerano); 
writeln ('Los casamientos en los primeros 10 dias de cada mes fueron: ',casamientosPrimeros10Dias); 

end. 
