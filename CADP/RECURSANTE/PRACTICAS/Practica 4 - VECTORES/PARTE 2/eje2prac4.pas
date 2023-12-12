{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias. } 

program dos; 
const 
    dimF = 500; 
type 
    str20 = string[20];
    Alumno = record
        nombre : str20; 
    end; 
  vAlumnos = array [1..DimF] of Alumno;   

// Cargamos el vector 
procedure cargarVector(var v : vAlumnos; var DimL : integer);
var
nombre : str20; 
begin
  DimL:= 0 ; 
  write ('Ingrese el nombre: '); readln (nombre);
  while ((DimL <= DimF) and (nombre <> 'zzz')) do 
    begin
        DimL:= DimL + 1 ; 
        v[DimL].nombre:= nombre ;   
        write ('Ingrese el nombre: '); readln (nombre);
    end;
end;

function estaEnVector (v: vAlumnos; nombreBuscado: str20; DimL : integer): integer;
var
pos: integer;
esta: boolean; 
begin
esta:= False; 
pos:= 1 ; 
    while ((pos<=DimL) and (not esta)) do
      begin
           if (v[pos].nombre = nombreBuscado) then 
               esta:= True  
           else 
                pos:= pos + 1; 
      end;
    if (esta) then 
        estaEnVector:= pos
    else 
      estaEnVector:= -1; 
end;


//Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
procedure Leer_y_eliminar (var v : vAlumnos; var DimL : integer);
var
pos : integer;
nombreLeido : str20; 
i : integer;
pude: boolean;
begin
  write ('Ingrese el nombre a eliminar: '); readln (nombreLeido);
    pos:= (estaEnVector(v,nombreLeido,DimL));
    if (pos <> -1) then 
        begin
          for i:= pos to (DimL -1) do 
            begin
                v[i]:= v[i+1]; 
            end;
           DimL:= DimL - 1 ;  
           pude:= True;  
        end
    else 
        pude:= False; 

  if (Pude) then
    writeln('se pudo eliminar la 1er ocurrencia del nombre ingresado')
  else 
    writeln('**ERROR** El nombre ingresado no se encuntro en el vector.'); 

end;

//c. Lea un nombre y lo inserte en la posición 4 del vector.
procedure Leer_y_insertar(var v : vAlumnos; var DimL: integer );
var 
nombre : str20; 
pos : integer; 
i : Integer;
pude : boolean;
begin
  pude:= False; 
  pos:= 4;
  write('Ingrese el nombre a insertar en la POS 4: '); readln (nombre); 
  if (((DimL + 1)<DimF) and (pos>= 1) and (pos <= DimL)) then   
    begin
       for i:= DimL downto pos do  { desde el final hacia la pos buscada }
         v[i+1]:= v[i]; { muevo cada elemento una posicion mas } 
      v[pos].nombre:= nombre;  { agrego el nombre en la posicion pedida }
      pude:= True;      { Se pudo insertar el nombre.  }
      DimL:= DimL + 1 ; 
    end;
    if (pude) then 
        writeln('Se inserto correctamente el nombre en la posicion 4')
    else 
        begin
             writeln('**ERROR** no se pudo insertar el nombre.');
             WriteLn('La posicion',pos, ' no es valida');   
        end;
       
end;

//d. Lea un nombre y lo agregue al vector.
procedure Leer_y_agregar (var v: vAlumnos; var DimL : Integer); 
var 
nombre: str20; 
begin
  if ((DimL + 1)<=DimF) then 
  begin 
		write ('Ingrese un nombre:'); Readln(nombre); 
		DimL:= DimL + 1 ; 
		v[DimL].nombre:=nombre; 
		writeln ('Se agrego correctamente el nombre en el vector.');
   end
 else 
    writeln('**ERROR** El vector se encuentra lleno,no se pudo agregar el nombre');
end;

procedure mostrarVector (v : vAlumnos; DimL : integer); 
var 
i: integer;
begin
	for i := 1 to DimL do 
		writeln(v[i].nombre); 
end;

var
v : vAlumnos; 
DimL : integer ;
begin
  cargarVector(v,DimL); 
  Leer_y_eliminar(v,DimL);
  mostrarVector(v,DimL); 
  Leer_y_insertar(v,DimL); 
   mostrarVector(v,DimL); 
  Leer_y_agregar(v,DimL); 
    mostrarVector(v,DimL); 
end.
