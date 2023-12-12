 { 6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe: 
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz. }

program seis ; 
type 
	str20 = string[20]; 
  Procesador = record 
		marca : str20 ; 
		linea : str20 ; 
		cantNucleos : integer ; 
		Ghz : integer ; 
		nm : integer ;
  end; 

//-------------------------------------------------------------------------------------------------
procedure LeerProcesador (var proce : Procesador ); 
begin 
writeln ; 
	write ('Ingrese la cantidad de Nucleos del procesador: '); readln (proce.cantNucleos) ; 
		if (proce.cantNucleos <> 0 ) then 
			begin
				write ('Ingrese la Marca del procesador: '); readln (proce.marca);
				write ('Ingrese la Linea del procesador: '); readln (proce.linea) ; 
				write ('Ingrese la cantidad de Ghz del procesador: '); readln (proce.Ghz); 
				write ('Ingrese la cantidad de Nm del procesador: '); readln (proce.nm); 
			end; 
end; 
//-------------------------------------------------------------------------------------------------
// ● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
function Min3NucleosMax22nm ( p : Procesador ): boolean ; 
begin
Min3NucleosMax22nm:= ( (p.cantNucleos >=3) and (p.nm <=22)); 
end; 
//-------------------------------------------------------------------------------------------------


//-------------------------------------------------------------------------------------------------
//● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
{ cant solamente va a tener la cantidad de procesadores con transitores = 14 nm }
procedure calcularMax (marca : str20; var max1,max2 : integer; var marcaMax1,marcaMax2 : str20 ; cant : integer); 
begin
	if ( cant > max1 )then 
		begin
			max2:= max1; 
			max1:= cant; 
			marcaMax2:= marcaMax1 ;
			marcaMax1:= marca ;
		end
	else if ( cant > max2 ) then 
		begin
			max2:= cant; 
			marcaMax2:= marca; 
		end; 
end; 

function Transitor14nm ( transitor : integer ): boolean;
begin
	Transitor14nm:= ( transitor = 14) ; 
end; 

//-------------------------------------------------------------------------------------------------
{● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz. }
// Si devuelve True , incremento mi variable contadora cant2 
function multicoreAMD_INTELmin2Ghz ( p : Procesador ): boolean ;
begin
	multicoreAMD_INTELmin2Ghz:= ( (p.cantNucleos > 1) and ( (p.Marca ='Intel') or (p.Marca = 'AMD') ) and (p.Ghz >=2) ) ; 
end; 


// Prog Principal.

{en cant1 cuento la cantidad de procesadores de 14nm POR MARCA 
*es decir cuando se lea una marca nueva, cant1 va a valer 0} 
// en cant2 cuento los procesadores multicores de AMD o INTEL, con al menos 2Ghz
var
cant1,cant2,max1,max2 : integer ; 
marcaActual,marcaMax1,marcaMax2: str20; 
p : Procesador; 
begin
max1:= -1 ;  max2:= -1; 
marcaMax1:= '...' ; marcaMax2:= '...'; 
cant1:= 0 ;  
LeerProcesador (p); 
 while ( p.cantNucleos <> 0 ) do 
	begin
		marcaActual:= p.marca; 
		cant2:= 0 ; 
			while ( ( p.marca = marcaActual ) and (p.cantNucleos <> 0) ) do  {corte de control} 
					begin
						if (Min3NucleosMax22nm(p)) then 
							write ('El procesador con marca ',p.marca, ' de la linea ',p.linea,' Tiene como minimo 3 nucleos y transitores de a lo sumo 22nm') ; 
						if (Transitor14nm(p.nm)) then 
							cant2:= cant2 + 1; 
						if (multicoreAMD_INTELmin2Ghz(p)) then 
							cant1:= cant1 + 1 ; 
						LeerProcesador (p); 
					end; 	
		calcularMax (p.marca,max1,max2,marcaMax1,marcaMax2,cant2); 		
	end; 
		writeln ('La cantidad de procesadores multicores de AMD o Intel, con al menos 2 Ghz son: ',cant1); 
		writeln ('Las dos marcas con mayor cantidad de procesadores con transitores de 14nm son: ',marcaMax1, ' y ' ,marcaMax2); 	
end. 
