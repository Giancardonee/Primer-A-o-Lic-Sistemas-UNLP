{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes.
 Para ello,cuenta con información sobre todos los viajes realizados durante el mes de marzo.
 De cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31),
  monto de dinero transportado y distancia recorrida por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200).
 La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, 
  que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.

c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km. 

Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program tres; 
const 
    dimF = 200; 
type
    rangoDias = 1..31;
    rViaje = record 
        dia : rangoDias;
        dineroTransportado:real;
        kmRecorridos: real; 
    end;
vViajes = array [1..31] of rViaje;
vContadorViajesDias = array [1..31] of integer; 
procedure LeerViaje (var viaje : rViaje);
begin
    write('Ingrese la cantidad de km Recorridos: '); readln (viaje.kmRecorridos);
     if (viaje.kmRecorridos<>0)then 
        begin
            write('Ingrese el dia que se realizo el viaje: '); readln(viaje.dia); 
            write ('Ingrese el dinero transportado: '); readln (viaje.dineroTransportado); 
        end;
end;

procedure contarVectorDias (var vContador : vContadorViajesDias; dia : rangoDias);
begin
	vContador[dia]:= vContador[dia] + 1; 
end; 

procedure cargarVector (var v : vViajes; var DimL : integer; var vContador : vContadorViajesDias);
var
viaje : rViaje;
begin
  DimL:= 0 ; 
  LeerViaje(viaje);
  while ((DimL<= DimF) and (viaje.kmRecorridos <> 0))do 
   begin
        DimL:= DimL + 1;
        v[DimL]:= viaje; 
        contarVectorDias(vContador,v[DimL].dia); 
        LeerViaje(viaje);
   end;
end;

procedure inicializarVContador (var vContador : vContadorViajesDias);
var
i : integer;
begin
  for i:= 1 to 31 do 
    vContador[i]:= 0 ;     
end;

procedure viajeMenosDinero (vViaje : vViajes ; i : integer ;  var min : real;var DistanciaMin : real; var DiaMin: rangoDias);
begin
  if (vViaje[i].dineroTransportado < min) then 
        begin 
             min:= vViaje[i].dineroTransportado; 
             DistanciaMin:= vViaje[i].kmRecorridos; 
             DiaMin:= vViaje[i].dia; 
        end;        
end;

{Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.}
procedure ProcesarVectorViaje (vViaje : vViajes; DimL : integer; vContadorViajes : vContadorViajesDias); 
var
montoPromedio,min,distanciaMin : real ; 
i,i2:integer;
diaMin : rangoDias;

begin
  diaMin:= 1;
  distanciaMin:= -1; 
  min:= 32000;
  montoPromedio:= 0 ;
    for i:= 1 to DimL do 
        begin
          montoPromedio:= montoPromedio + vViaje[i].dineroTransportado;
          viajeMenosDinero(vViaje, i, min, distanciaMin, diaMin);
				for i2:= 1 to 31 do  {solamenter se van a mostrar los dias que se hizo al menos 1 viaje}
					begin 
						if (vContadorViajes[i2] >= 1) then 	
							writeln ('En el dia ',i2, ' se hicieron ',vContadorViajes[i2], ' viajes')
					end; 
        end;

montoPromedio:= (montoPromedio / DimL); 
writeln; { salto de linea }
writeln ('El monto promedio transportado es: $',montoPromedio:2:2); 
writeln; { salto de linea }
writeln('El dia que se transporto menos dinero, se transportaron $',min:2:2, ' pesos.'); 
writeln('Fue en el dia ',diaMin, ' se recorrieron ',distanciaMin:2:2, 'km'); 
end;

{c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km. } 
function esViaje100km (kmRecorridos:real): boolean; 
begin
	esViaje100km:= (kmRecorridos = 100); 
end; 

procedure eliminarViaje (var v : vViajes; var DimL : integer; pos: integer); 
var
i : integer; 
begin
	if ( (pos>= 1) and (pos <= DimL) ) then 
		begin 
				for i := pos to (DimL - 1 ) do 
					v[i]:= v[i+1]; 
			DimL:= DimL - 1 ;		
		end; 
end; 

procedure EliminarViajes100km (var v: vViajes; var DimL : integer); 
var 
i : integer; 
begin
	for i:= DimL downto 1 do 
		begin
				if (esViaje100km(v[i].kmRecorridos)) then 
					eliminarViaje(v,DimL,i); 
			
		end; 
end; 
{ programa principal }
var
vContador : vContadorViajesDias;
vViaje : vViajes;
DimL : integer;
begin
inicializarVContador(vContador);    
cargarVector(vViaje,DimL,vContador);
ProcesarVectorViaje(vViaje,DimL,vContador); 
EliminarViajes100km(vViaje,DimL); 
end.
