program Registros;
type
str20 = string[20];
alumno = record
codigo : integer;
nombre : str20;
promedio : real;
end;
procedure leerAlumno(var alu : alumno);
begin
write('Ingrese el codigo del alumno: ');
readln(alu.codigo);
if (alu.codigo <> 0) then begin
write('Ingrese el nombre del alumno: '); readln(alu.nombre);
write('Ingrese el promedio del alumno: '); readln(alu.promedio);
end;
end;

procedure calcularAlumnoMax (a: alumno; var promedioMax: real ; var alumnoMax: str20); 
	begin
		if (a.promedio > promedioMax) then
			begin
				promedioMax:= a.promedio; 
				alumnoMax:= a.nombre; 
			end; 
	
	end; 

{ declaración de variables del programa principal }
var
a : alumno;
max : real; 
alumnoMax: str20; 

{ cuerpo del programa principal }
begin
max:= -1; 
alumnoMax:= ' ' ; 
leerAlumno (a); 
while (a.codigo <> 0) do 
	begin
		calcularAlumnoMax (a,max,alumnoMax); 
		leerAlumno (a); 
	end; 
	writeln ('El nombre del alumno con mayor promedio es: ',alumnoMax, ' con un promedio de: ',max:2:2); 
end.
