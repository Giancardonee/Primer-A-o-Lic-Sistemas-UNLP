{
8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
 
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. 
* De cada transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia 
(1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). 
 Esta estructura no posee orden alguno. 
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular).
 Esta nueva estructura debe estar ordenada por número de cuenta origen.

Una vez generada la estructura del inciso a), utilizar dicha estructura para:

b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
esto lo hacemos con un corte de control, porque la nueva lista esta ordenada por nro de cuenta de origen

c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
	vector cotador de 1 a 7 (cantidad de motivos)
	
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.
si es mes Junio , o 6 y el nro de cuenta destino tiene menos dig pares que impares, sumo a la variable 
}
program eje8; 
const
	cantMotivosTransf = 7; 
type
	rangoMeses  = 1..11; {entre enero y noviembre}
	rangoMotivosTransf = 1..cantMotivosTransf; 
	rangoDias = 1..31; 
	str20 = string[20]; 


	fech = record 
			dia : rangoDias; 
			mes : rangoMeses; 
	end; 
	
	transferencia = record
			nroCuentaOrigen : integer;
			dniTitularOrigen : integer; 
			nroCuentaDestino : integer;
			dniTitularDestino : integer;
			fecha : fech; 
			hora : str20; {pense en poner real, pero asumo que se ingresa una hora por ej: 12 : 45 y asi queda en string }
			monto : real; 
			codMotivoTransf: rangoMotivosTransf; 
	end; 
	
	listaTransferencias = ^nodo; 
	nodo = record
			elemento : transferencia; 
			siguiente : listaTransferencias; 
	end; 
	
	vContadorMotivos = array [1..cantMotivosTransf] of integer; 
	
	procedure cargarLista (var L : listaTransferencias); // se dispone 
	begin
	end; 

	
	procedure crearListaNueva (var LN : listaTransferencias); 
	begin
			LN:= nil; 
	end;
	
	{ordenamos de menor a mayor por nroCuentaOrigen}
	procedure insertarOrdenado ( var LN : listaTransferencias; dato : transferencia );
	var
		anterior,actual,nuevo : listaTransferencias; 
	begin
		new(nuevo); 
		nuevo^.elemento:= dato; 
		anterior:= LN; 
		actual:= LN; 
		while ( (actual <> nil ) and  (dato.nroCuentaOrigen < actual^.elemento.nroCuentaOrigen) ) do 
			begin
				anterior:= actual;
				actual:= actual^.siguiente; 
			end; 
			if ( actual = anterior ) then 
				LN:= nuevo
			else
				anterior^.siguiente:= nuevo; 
			nuevo^.siguiente:= actual; 
	end; 
	
	
	procedure procesarLista (L1 : listaTransferencias ; var LN : listaTransferencias); 
	begin
		while ( L1 <> nil ) do 
			begin
	
					if (L1^.elemento.nroCuentaOrigen <> L1^.elemento.nroCuentaDestino) then 
						insertarOrdenado(LN,L1^.elemento); 
			
					L1:= L1^.siguiente; 
			end; 
	end; 
	
		function cumpleDigitos (num : integer): boolean;
		var
			dig,cantP, cantI: integer; 
		begin
				cantP:=0 ; cantI:=0;
				while (num <> 0) do 
					begin
							dig:= num mod 10; 
							
							if ( dig mod 2 = 0 ) then 
								cantP:= cantP + 1
							else 
								cantI:= cantI + 1;
								
						num:= num div 10; 
					end; 
				cumpleDigitos:= (cantP < cantI ); 
		end;  
		
		function esMesJunio (mes : rangoMeses): boolean;
		begin
			esMesJunio:= ( mes = 6 ); 
		end; 
		
		procedure inicializarVcontador (var v : vContadorMotivos); 
		var
			i : integer; 
		begin
				for i:= 1 to cantMotivosTransf do 
					v[i]:= 0; 
		end; 
		
		procedure procesarNuevaLista ( LN : listaTransferencias; var v : vContadorMotivos; var cantCumple : integer ); 
		var
		cuentaActual : integer; 
		montoTotal : real; 
		begin
			cantCumple:=0;
			inicializarVcontador(v); 
			while ( LN <> nil ) do 
				begin
				cuentaActual:= LN^.elemento.nroCuentaOrigen; 
				montoTotal:= 0; 
					while ( (LN <> nil ) and (LN^.elemento.nroCuentaOrigen = cuentaActual) ) do 
						begin
							montoTotal:= montoTotal + LN^.elemento.monto; 

							{ incremento el codigo de motivo segun la transferencia }	
							v[LN^.elemento.codMotivoTransf] := v[LN^.elemento.codMotivoTransf] + 1;  
								
								if ( ( esMesJunio(LN^.elemento.fecha.mes) ) and (cumpleDigitos(LN^.elemento.nroCuentaOrigen)) ) then 
									cantCumple:= cantCumple + 1; 
								
								LN:= LN^.siguiente; 
						end; 
						{ b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros. }
						writeln ('Para la cuenta de origen ',cuentaActual, ' el monto total transferido es: ',montoTotal ); 		
				end;
		end; 
		
		function calcularMotivoMax ( v : vContadorMotivos): rangoMotivosTransf; 
		var
			i,max : integer;
			codMax : rangoMotivosTransf;  
		begin
			max:= -1; 
			for i:= 1 to cantMotivosTransf do 
				begin
						if ( v[i] > max ) then 
								begin 
										max:= v[i]; 
										codMax:= i; 
								end; 
				end; 
					calcularMotivoMax:= codMax; 
		end; 
		
		procedure informar ( v : vContadorMotivos ; cantCumplen : integer); 
		begin
			writeln ('El codigo de motivo que mas transferencias a terceros tuvo fue ',calcularMotivoMax(v)); 
			writeln ('La cant de transferencias a terceros en el mes de Junio, las cuales la cuenta destino tiene menos dig pares que impares son: ',cantCumplen); 
		end; 
	{programa principal}
	var 
	L1, LNueva : listaTransferencias; 
	vCont : vContadorMotivos; 
	cantCumplen : integer;
	begin
		cargarLista(L1); // se dispone , se crea y se carga la lista.  
		crearListaNueva(LNueva); 
		
		procesarLista (L1,LNueva);  //L1 se dispone, y se genera LNueva con algunos datos de L1
		procesarNuevaLista (LNueva,vCont,cantCumplen); 
		
		informar (vCont,cantCumplen); 
	end.
	
	
	

	
