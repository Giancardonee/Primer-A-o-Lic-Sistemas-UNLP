{ 

CADP 2022-TEMA 1 COMPLETO
02/07/2022
La catedra de CADP necesita un programa para generar el listado de alumnos ingresantes que rendirán el parcial.
 Para ello, la catedra DISPONE de un listado con todos alumnos que ingresaron este año a la facultad. 
 De cada alumno se conoce su DNI nombre y apellido, nota obtenida en curso de ingreso (entre 4 y 10), turno (entre 1 y 4) y 
 si estuvo prosente o ausente en cada una de las 12 clases de práctica
 
    a) Realizar un modulo que reciba la información de los alumnos y retome una nueva estructura de datos que
   contenga solo aquellos alumnos que podrán rendir el parcial/ Para poder rendir el parcial,
   los alumnos deber contar con al menos 8 asistencias en las 12 clases de practica
 
  b) Realizar un modulo que reciba la estructura de datos generada en el inciso anterior, e IMPRIMA en pantalla 
	1. Apellido y nombre y el DNI de los alumnos que hayan obtenida nota 8 o superior en el ingreso
	2. Turno con mayor cantidad de alumnos en condiciones de rendir el examen.
	3. Cantidad de alumnos que no posean ningún digito cero en su DNI

NOTA: Implementar el programa principal

}  

	program parcial5; 
		const
			cantClases = 12;
			cantTurnos = 4;
		type
			rangoNota = 4..10;
			rangoTurno = 1..4;
			str40 = string[40];
			
			vPresencias = array [1..cantClases] of boolean;
			
			alumno = record 
					dni : integer;
					nombreCompleto : str40;
					notaIngreso : rangoNota;
					turno : rangoTurno;
					presenciaClases : vPresencias; 
			end;
			
			listaAlumnos = ^nodo; 
			nodo = record
					elemento : alumno;
					siguiente : listaAlumnos
			end;
			
			vTurnos = array [1..cantTurnos] of integer;
			
			procedure crearLista ( var L : listaAlumnos); 
			begin
				L := nil;
			end;
			
			procedure inicializarVecTurnos ( var v : vTurnos); 
			var
					i : integer;
			begin
					for i:= 1 to cantTurnos do 
						v[i]:= 0;
			end;
			
			procedure agregarAdelante (var LC : listaAlumnos; dato : alumno); 
			var
				nuevo : listaAlumnos; 
			begin
				new(nuevo); 
				nuevo^.elemento:= dato;
				nuevo^.siguiente:=LC;
				LC:= nuevo;
			end;
			
			function cumpleRendirParcial (v : vPresencias) : boolean;
			var
				cant, pos : integer;
			begin
				cant:= 0;;
				pos:= 1;
				while ( (pos <= cantClases ) and (cant < 8) ) do 
					begin
							if ( v[pos] = True ) then 
								cant:= cant + 1;
						pos:= pos + 1;
					end;
				cumpleRendirParcial:= (cant = 8) ;
			end;
			
			procedure procesarListaAlumnos ( L : listaAlumnos; var LCumplen : listaAlumnos); 
			begin
				while ( L <> nil ) do 
					begin
					
							if (cumpleRendirParcial(L^.elemento.presenciaClases)) then 
									agregarAdelante(LCumplen,L^.elemento); 
									
						L:= L^.siguiente;
					end;
			end;
			
			function tieneNotaSuperior8 ( nota : integer): boolean;
			begin
				tieneNotaSuperior8:= (nota >= 8); 
			end;
			
			function noPoseeNingunDig0 (dni : integer): boolean;
			var
					dig : integer;
					ok: boolean;
			begin
				ok:= True;
					while ( (dni <> 0 )  and (ok = true) ) do 
						begin
							dig:= dni mod 10; 
							
							if (dig = 0 ) then 
									ok:= False; 
							
							dni:= dni div 10;
						end;
					noPoseeNingunDig0:= ok; 
			end;
			
			function calcularTurnoMax ( v : vTurnos): rangoTurno; 
			var
				turnoMax : rangoTurno;
				max , i : integer; 
			begin
				max:= -1; 
				for i:= 1 to cantTurnos do 
					begin
							if ( v[i] > max ) then 
								begin
									max:= v[i]; 
									turnoMax:= i ;
								end;
					end; 
				calcularTurnoMax:= turnoMax; 	
			end;
			
			procedure recorrerListaCumplen (LC : listaAlumnos); 
			var
				v : vTurnos; 
				cant : integer; 
			begin
				cant:= 0;
				inicializarVecTurnos(v); 
				while ( LC <> nil ) do 
					begin
						
								{ inciso b) 1. }
						if (tieneNotaSuperior8(LC^.elemento.notaIngreso)) then 
							writeln ('El alumno ',LC^.elemento.nombreCompleto, ' tiene nota 8 o superior en el ingreso. ' );
						
								{ inciso b) 2.   incremento el turno del alumno }
								v[LC^.elemento.turno]:= v[LC^.elemento.turno]  + 1; 
								
								
								{ inciso 3 calculo si el alumno no posee ningun dig 0 en el dni }
								if (noPoseeNingunDig0(LC^.elemento.dni)) then 
									cant:= cant + 1; 
	
						LC:= LC^.siguiente;
					end;
				writeln ('La cantidad de alumnos que no poseen ningun digito 0 en su dni son:  ',cant); 
				writeln ('El turno con mayor cantidad de alumnos en condiciones de rendir es: ',calcularTurnoMax(v)); 
			end;



		{ programa principal }
		var
			LAlumnos , LCumplen: listaAlumnos;
		begin
			crearLista(LAlumnos); 
			crearLista(LCumplen);
			
			cargarListaAlumnos (LAlumnos); // se dispone 
			
			procesarListaAlumnos(LAlumnos,LCumplen); 
			recorrerListaCumplen(LCumplen); 
		end.
