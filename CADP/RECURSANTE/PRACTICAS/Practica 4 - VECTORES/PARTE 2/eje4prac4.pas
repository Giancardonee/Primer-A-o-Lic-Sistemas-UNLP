{ 4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado. }

program cuatro; 
const 
    dimF = 1000; 

type
    str20 = string[20]; 

   
   Alumno = record
        nroAlumno : integer;
        apellido: str20; 
        nombre: str20; 
        cantAsistencias : integer; 
    end; 
 vAlumnos = array [1..dimF] of Alumno; 

procedure LeerAlumno (var a : Alumno);
begin
	write ('Ingrese el nro de alumno: '); readln (a.nroALumno); 
	if (a.nroAlumno <> 0) then 
		begin
			write ('Ingrese el nombre del alumno: '); readln (a.nombre); 
			write ('Ingrese el apellido del alumno: '); readln (a.apellido); 
			write ('Ingrese la cantidad de asistencias del alumno: '); readln (a.cantAsistencias); 
		end; 
end; 

procedure cargarVector (var v : vAlumnos; var DimL : integer ); 
var 
rAlumno : Alumno; 
begin
	DimL:= 0 ; 
	LeerAlumno(rAlumno); 
	while ( (DimL<= DimF) and (rAlumno.nroAlumno <> 0) ) do 
			begin
					DimL:= DimL + 1 ; 
					v[DimL]:= rAlumno; 
					writeln; {solo para salto de linea}
					LeerAlumno(rAlumno); 
			end; 
end; 


 {b. Un módulo que reciba un alumno y lo inserte en el vector.}
{ver si la posicion es valida (mayor a 1 y menor a dimf)}
 {ver si diml+1 es menor igual a dimF}
  { voy desde la dimL downto pos }
  { v[i+1]:= v[i] } 
  {inserto la pos}
  {incremento la DimL}
  {devuelvo True en pude}
procedure insertarAlumno (var v : vAlumnos; var DimL : integer; alumnoInsertar : Alumno ; posInsertar : integer;var pude: boolean ); 
var
i : integer;  
begin
pude:= False; 
    if (((DimL+1)<= DimF) and (posInsertar >= 1) and (posInsertar <= DimL)) then 
      begin
        for i:= DimL downto posInsertar do 
            begin
               v[i+1]:= v[i]; 
            end;
          v[posInsertar]:= alumnoInsertar; {inserto el nombre en el campo nombre}
          DimL:= DimL + 1 ;          {incremento DimL porque tengo un elemento mas}
        pude:= True; 
       end;      
end;

function busquedaDicotomica (v : vAlumnos; DimL : integer;nRoAlumno : integer ): integer; 
var
pri, ult, med : integer;
begin
pri:= 1; ult:= DimL ; med:= ((pri + ult) div 2); 
while ((pri<=ult) and (nroAlumno <> v[med].nroAlumno)) do 
    begin
      if (nRoAlumno < v[med].nroAlumno) then 
        ult:= med - 1 
      else 
        pri:= med + 1;

     med:= ((pri+ult)div 2);    
    end;

    if ((pri<=ult) and (nRoAlumno = v[med].nroAlumno)) then 
        busquedaDicotomica:= med 
    else 
        busquedaDicotomica:= -1 ;     
end;
{Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.}
{chequeo si la posicion es valida}
{si la posicion es valida, voy desde pos to DimL-1}
{Decremento DimL (DimL:= DimL - 1)}
procedure eliminarPosicion (var v : vAlumnos ; var DimL: integer; pos : integer; var pude: boolean);
var 
i : integer ; 
begin
pude:= False; 
if ((pos>= 1) and (pos<=DimL)) then 
    begin 
        for i:= pos to DimL -1 do 
            v[i]:= v[i+1]; 
    pude:= True; 
    DimL:= DimL-1; 
    end; 
end; 

function esAlumno0Asistencias (asistencias : integer ): boolean ; 
begin
  esAlumno0Asistencias:= (asistencias = 0 ); 
end;

procedure mostrarVector (v : vAlumnos; DimL : integer); 
var
i: integer;
begin
	for i:= 1 to DimL do 
		begin 
			writeln ('------> Nro de alumno: ',v[i].nroAlumno); 
			writeln ('Nombre y apellido:  ',v[i].nombre, ' ' ,v[i].apellido); 
			writeln ('Cantidad de asistencias: ',v[i].cantAsistencias); 
			writeln('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -') ;
		end;
end; 

var
i,posInsertar,DimL,resultadoBusqueda,nroAlumno,posEliminar : integer; 
v : vAlumnos; 
pude: boolean; 
AlumnoInsertar : Alumno; 
begin
cargarVector(v,DimL); 
 //------------------------------------------------------------------------------------

{a.Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro.
El alumno seguro existe.} 
{Ya que el vector esta ordenado, deberia hacer busqueda dicotomica}
			
			write('Ingrese un numero de alumno para buscar en el vector: '); readln (nroAlumno); 
			resultadoBusqueda:= busquedaDicotomica(v,DimL,nroAlumno); 
			{si resultadoBusqueda es distinto de -1 es porque se encontro el alumno}
					if (resultadoBusqueda <> -1) then 
							writeln ('El nro de alumno ',nroAlumno,' se encuentra en la posicion ',resultadoBusqueda)
					else 
							writeln('El alumno no se encuentra en el vector.');

 //------------------------------------------------------------------------------------

 {b. Un módulo que reciba un alumno y lo inserte en el vector.}
 writeln ('Se leeran datos para insertar a un alumno. (luego se vera si se puede o no.) '); 
LeerAlumno(AlumnoInsertar); 
 write('Ingrese la posicion donde quisiera insertar el alumno: '); readln (posInsertar); 
 insertarAlumno(v,DimL,AlumnoInsertar,posInsertar,pude); 
 {esto tranquilamente podria ir dentro del modulo}
		 if (pude) then 
			begin 
					writeln('Se inserto el alumno ',AlumnoInsertar.nombre, ' en la posicion ',posInsertar, ' Exisotsamente.'); 
					mostrarVector(v,DimL);      
			end
		else 
		  writeln ('**ERROR** no se pudo insertar el alumno en la posicion deseada.');



//-----------------------------------------------------------------------------------------

{c.Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.}
		write('Ingrese una posicion a eliminar: '); readln (posEliminar); 
		eliminarPosicion(v,DimL,posEliminar,pude); 
		if (pude) then 
			begin  
			writeln ('Se elimino exitosamente la posicion ',posEliminar, ' en el vector exitosamente'); 
			mostrarVector(v,DimL);    
			end
		else 
			writeln ('No se pudo eliminar la posicion ',posEliminar, '. La posicion no es valida'); 

//------------------------------------------------------------------------------------------

{d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector}
			write ('Ingrese un nro de alumno para eliminar: '); readln (nroAlumno); 
			{para resolver este inciso, primero busco el nro de alumno si existe}
			resultadoBusqueda:= busquedaDicotomica(v,DimL,nroAlumno) ; 
			if (resultadoBusqueda <> -1) then 
				begin  
						eliminarPosicion(v,DimL,resultadoBusqueda,pude);
						writeln ('Se elimino el alumno correctamente.'); 
				end	
			else 
					writeln ('**ERROR** El nro de alumno no existe. '); 

//------------------------------------------------------------------------------------------

{e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.}
    for i:= DimL downto 1 do 
         if (esAlumno0Asistencias(v[i].cantAsistencias)) then 
				eliminarPosicion (v,DimL,i,pude); 
    mostrarVector(v,DimL);      

end.
