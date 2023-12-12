{
4. Una maternidad dispone información sobre sus pacientes. 
* De cada una se conoce: nombre, apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). 
* La maternidad necesita un programa que analice esta información, determine e informe:

a. Para cada embarazada, la semana con mayor aumento de peso.

b. El aumento de peso total de cada embarazada durante el embarazo.
}

program cuatro; 
const 
	cantSemanas = 42; 
type 
	str20 = string[20]; 
	
	vSemanas = array [1..cantSemanas] of real; 
	
	auxPeso = record
			kg : vSemanas; 
			DimL : integer ;  
	end; 
	
	paciente = record
			nombre : str20; 
			apellido : str20; 
			peso : auxPeso; 
	end; 
	
	listaPacientes = ^nodo; 
	nodo = record
			elemento : paciente;
			siguiente : listaPacientes;
	end; 
	
	
	procedure crearLista (var pI : listaPacientes); 
	begin
			pI:= nil; 
	end; 
	
	
	procedure LeerPeso ( var  p : auxPeso); 
	var
		semana : integer;
		ppeso : real; 
		pos : integer;
	begin
			pos:= 0;
			semana:= 1;
			write ('Ingrese el peso de la semana ',semana, ': ' );
			readln (ppeso); 
			while (ppeso <> 0) do 
				begin
					pos := pos + 1; 
					p.kg[pos]:= ppeso;
					semana:= semana + 1; { esto lo uso para llevar el contador de la siguiente semana}
																{puedo usar pos + 1}										
					write ('Ingrese el peso de la semana ',semana, ': ' );
					readln (ppeso); 
				end;
				p.dimL:= pos; 
	end;
	
	procedure LeerPaciente (var p : paciente; var v : vSemanas); 
	var
		dimL : integer;
	begin
			dimL:= 0; 

			write ('Ingrese el nombre: ');  readln (p.nombre);
			if (p.nombre <> 'fin') then begin 
			write ('Ingrese el apellido: ');  readln (p.apellido);
			LeerPeso (p.peso); 
			p.peso.DimL:= dimL; 
			writeln ; 
			end; 
	end;
	
	procedure agregarAdelante (var pI : listaPacientes ; dato : paciente); 
	var
		nuevo : listaPacientes;
	begin
		new(nuevo); 
		nuevo^.elemento:= dato;
		nuevo^.siguiente:= nil;
		
		nuevo^.siguiente:= pI;
		pI:= nuevo; 
	end;
	
	procedure imprimir( v : vSemanas; dimL : integer ; p : paciente); 
	var
		i : integer;
	begin
			writeln ('Datos de la persona ',p.nombre,' ' ,p.apellido); 
			for i := 1 to dimL do 
				begin
					writeln (v[i]); 
				end
	end;
	
	procedure cargarLista (var pI : listaPacientes); // se dispone
	var
		p : paciente;
		v : vSemanas;
	begin
			LeerPaciente(p,v);
			 while ( p.nombre <> 'fin') do 
				begin
					agregarAdelante(pI,p); 
					imprimir(v,p.peso.dimL,p); 
					LeerPaciente(p,v);
				end;
	end;

	{ a. Para cada embarazada, la semana con mayor aumento de peso. }
	{ funcion que recorre el vSemanas y retorna la semana max}
	function semanaMayorAumento (p : paciente): integer ; 
	var
		max, diferencia: real;
		semanaMax,pos : integer;
	begin
	max:= 0;
	semanaMax:= 0;
	pos:= 2;
		while ( pos <= p.peso.DimL) do 
			begin 
				diferencia:= (p.peso.kg[pos] - p.peso.kg[pos -1] );
				if (  diferencia > max ) then begin
					max:= diferencia;
					semanaMax:= pos;
					end; 
				pos:= pos + 1;
			end; 
		semanaMayorAumento:= semanaMax; 
	end;
	
	
	{ b. El aumento de peso total de cada embarazada durante el embarazo. }
	 { funcion que debe hacer una diferencia entre el ultimo elemento del vector, y el primer elemento
	 * En ese resultado vamos a tener el aumento total }
	function aumentoPesoTotal (p :  paciente): real ; 
	begin
		aumentoPesoTotal:= ( p.peso.kg[p.peso.dimL] - p.peso.kg[1]); 
	end;
	
	
	
	{ prog principal }
	var
		l : listaPacientes;
	begin
		crearLista(l); 
		cargarLista(l); 
		//procesarPacientes(l); 
	end.


	 { procedure procesarPacientes ( l : listaPacientes); 
	begin
		while ( l <> nil ) do 
			begin
					writeln ('Datos de la embarazada ',l^.elemento.nombre, ' ',l^.elemento.apellido ); 
					writeln ('La semana con mayor aumento de peso fue ',semanaMayorAumento(l^.elemento)); 
					writeln ('El aumento de peso total del embarazo fue de ',aumentoPesoTotal(l^.elemento):2:2, ' kg' ); 
					
					l:= l^.siguiente; 
			end;
	end;} 
