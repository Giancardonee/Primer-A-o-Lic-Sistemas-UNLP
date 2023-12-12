{
	Un psicologo necesita un sistema para administrar a sus pacientes.
		De cada paciente se lee: dni,codPaciente,obraSocial (1: ioma 2: pami 3: osde 4: galeno 5: no tiene)
		y costo abonado por sesion. Implemente un programa que: 
		
			a) Genere un ABB ordenado por dni, para ello genere informacion hasta el paciente con
				dni igual a 0
				
				
			b) Generar una estructura con dni y cod de paciente de los pacientes de ioma. Ordenados
			por dni descendente.
			
			c) Dado un dni: Modificar la obra social de dicho paciente a una recibida.
			Considere que el paciente puede no existir.
}
program parcial1; 
type
	rangoObraSocial = 1..5; 
	
	paciente = record
		dni : integer;
		codPaciente : integer;
		obraSocial : rangoObraSocial;
		costoPorSesion: real;
	end;
	
	arbol = ^nodo; 
	nodo = record
			dato : paciente;
			HI : arbol;
			HD : arbol; 
	end;

	rPacientesIoma = record
		dni : integer;
		codPaciente: integer;
	end;

	listaIoma = ^nodo2;
	nodo2 = record
		dato : rPacientesIoma;
		sig: listaIoma;
	end;


procedure inicializarArbol (var a : arbol); 
begin
	a:= nil; 
end;

procedure inicializarListaIoma (var pI : listaIoma); 
begin
	pI := nil; 
end;

procedure agregarAdelante (var pi : listaIoma; dni,codPaciente : integer); 
var
	nue : listaIoma;
begin
	new(nue); 
	nue^.dato.dni:= dni;
	nue^.dato.codPaciente:= codPaciente;
	nue^.sig:= pI;
	pI:= nue;
end;

procedure leerPaciente (var p : paciente); 
begin
	write ('Ingrese el dni del paciente: '); readln (p.dni); 
		if (p.dni <>0) then 
			begin
				write ('Ingrese el codigo de paciente: '); readln (p.codPaciente); 
				write ('Ingrese la obra social del paciente: '); readln (p.obraSocial); 
				write ('Ingrese el costo por sesion: '); readln (p.costoPorSesion); 
				writeln; 
			end;
end;


procedure agregarEnArbol (var a : arbol ;dato : paciente); 
begin
	if (a = nil) then 
		begin
			new(a); 
			a^.dato:= dato;
			a^.HI:= nil;
			a^.HD:= nil;
		end
	else
		begin
				
				if (dato.dni < a^.dato.dni) then 
					agregarEnArbol(a^.HI,dato)
				else if (dato.dni> a^.dato.dni) then 
					agregarEnArbol(a^.HD,dato);
		
		end;
end;

procedure cargarArbol (var a : arbol); 
var
	p : paciente;
begin
	leerPaciente(p); 
		while (p.dni <>0) do 
			begin
				agregarEnArbol(a,p);
				leerPaciente(p);
			end; 		
end; 
{-------------------------------------------------------------------------------------------------------------------------------------------}
{	b) Generar una estructura con dni y cod de paciente de los pacientes de ioma. Ordenados
			por dni descendente. } 

function tiene_ioma (obraSocial : rangoObraSocial): boolean;
begin
	tiene_ioma:= obraSocial = 1; 
end;


procedure incisoB (a : arbol; var pI :listaIoma); 
begin
	if (a <>nil) then 
		begin
			incisoB(a^.HI,pI); 
		
			if (tiene_ioma(a^.dato.obraSocial)) then 
				agregarAdelante(pI,a^.dato.dni,a^.dato.codPaciente); 
		
			incisoB(a^.HD,pI); 
		end;
end; 

{-------------------------------------------------------------------------------------------------------------------------------------------}
	{c) Dado un dni: Modificar la obra social de dicho paciente a una recibida.
			Considere que el paciente puede no existir.}

// os : obra social 

procedure buscarPaciente_ModificarOS (a : arbol; dni,os: integer; var ok : boolean); 
begin

	if ( ( a <>nil) and (ok = false)) then  
		begin
				if (a^.dato.dni < dni ) then 
					buscarPaciente_ModificarOS(a^.HI,dni,os,ok)
				else if ( a^.dato.dni > dni ) then 
						buscarPaciente_ModificarOS(a^.HI,dni,os,ok)
				else
					begin			{si entra aca es porque es igual}
								a^.dato.obraSocial:= os;	
								ok:= true
					end;
		end;
		
end;
procedure incisoC (a : arbol); 
var
	dni : integer;
	modificarObraSocial : integer;
	ok: boolean;
begin
	ok:= false; 
	writeln ('Estas en el inciso C.');
	write ('Ingrese un dni: '); readln (dni); 
	write ('Ingrese una obra social, para modificarle al paciente (si existe): '); readln (modificarObraSocial); 
	buscarPaciente_ModificarOS(a,dni,modificarObraSocial,ok); 
	if (ok) then 
		writeln ('Se cambio correctamente la obra social del dni ',dni)
	else
		writeln ('El paciente con dni ',dni, ' no existe.' ); 
end;
{-------------------------------------------------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------------------------------------------------------------}

procedure imprimirArbol (a : arbol); 
begin
	if (a <>nil) then 
		begin
				imprimirArbol(a^.HI);
		
				writeln ('Dni del paciente: ',a^.dato.dni); 
		
				imprimirArbol(a^.HD);
		end;
end;

procedure imprimirListaIoma (pI : listaIoma); 
begin
	if (pI <> nil) then 
		begin
				writeln ('Paciente con dni: ',pI^.dato.dni);
				writeln ('Su codigo de paciente es: ',pI^.dato.codPaciente); 
				
				imprimirListaIoma(pI^.sig);
		end;
end;

{-------------------------------------------------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------------------------------------------------------------}
{programa principal}
var
	a : arbol;
	pacientesIoma: listaIoma;
begin
	inicializarArbol(a); 
	inicializarListaIoma(pacientesIoma); 
	
	cargarArbol(a); 
	incisoB(a,pacientesIoma); 
	
	incisoC(a); 
	
	imprimirArbol(a);
	imprimirListaIoma(pacientesIoma); 
end.
