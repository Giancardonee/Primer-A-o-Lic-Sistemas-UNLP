{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes 
a la Facultad de Informática de la UNLP en el año 2020. De cada alumno se lee: 
nro de inscripción, DNI, apellido, nombre y año de nacimiento. Una vez leída
y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program ocho; 
const 
    dimF = 4; { cambiar a 400 para que quede acorde al enunciado. }
type
    str20 = string[20] ;
    Alumno = record 
        nro_Inscripcion : integer ; 
        dni : integer; 
        apellido :str20; 
        nombre : str20 ; 
        anhoNacimiento : integer ; 
    end;
    vector = array [1..dimF] of Alumno; 

 { cargamos el vector con los datos ingresados }
procedure cargarVector (var v : vector ); 
var
i : integer; 
begin
    for i:= 1 to dimF do 
        begin
            write ('Ingrese el Nro de inscripcion: '); readln (v[i].nro_Inscripcion); 
            write ('Ingrese el dni: '); readln(v[i].dni);
            write ('Ingrese el apellido: '); readLn (v[i].apellido); 
            write ('Ingrese el nombre: '); readln (v[i].nombre); 
            write ('Ingrese el anho de nacimiento: '); readln (v[i].anhoNacimiento); 
        end;
end;

{ funcion para calcular si el dni tiene solo digitos pares }
{ devuelve True, en caso de que sean todos los digitos pares }
function esDniPar (dni : integer): boolean; 
var
    dig : integer ; 
    ok : boolean ; 
begin
ok:= True ; 
    while ((dni <> 0) and (ok = True)) do
      begin
          dig:= dni MOD 10 ; { me traigo el digito }
          if (dig mod 2 = 0 )then 
            dni:= dni DIV 10 { sigo descomponiendo el numero }
          else 
            ok:= False ;     { si al menos 1 digito es impar. Retorno false}
      end;
esDniPar:= ok ; 
end;

{ Apellido y nombre de los dos alumnos de mayor edad.}
{ debo calcular edad maxima, pero por año de nacimiento. Lo calculo de esta forma:
a menor año de nacimiento mayor edad. }

procedure RecorrerVector (v : vector; var ApellidoMax1,ApellidoMax2 : str20; var nombreMax1,nombreMax2: str20 ; var cantDniPares : integer); 
var
i,anho1, anho2 : integer ; 
begin
cantDniPares:= 0 ; 
anho1:= 2025 ; anho2:= 2024;    
    for i:= 1 to dimF do 
        begin
            if (v[i].anhoNacimiento < anho1) then 
              begin  
                anho1:= v[i].anhoNacimiento; 
                ApellidoMax2:= ApellidoMax1; 
                ApellidoMax1:= v[i].apellido;
                nombreMax2:= nombreMax1;
                nombreMax1:= v[i].nombre;
              end
            else if (v[i].anhoNacimiento < anho2) then 
              begin
                anho2:= v[i].anhoNacimiento; 
                ApellidoMax2:= v[i].apellido;     
                nombreMax2:= v[i].nombre; 
              end;  

{ calculo la cantidad de dni con dígitos pares }
   if (esDniPar(v[i].dni)) then 
     cantDniPares:= cantDniPares + 1 ; 
        end;
end;

Function porcentajeDniPar (cantDniPares : integer): real;
begin 
porcentajeDniPar:= (( cantDniPares/dimF) * 100 ); 
end; 

{ programa principal }
var
v: vector; 
ApellidoMax1,ApellidoMax2 : str20 ; 
nombreMax1,nombreMax2 : str20 ;  
cantDniPares : integer ; 
begin
cargarVector(v);
RecorrerVector(v,ApellidoMax1,ApellidoMax2,nombreMax1,nombreMax2,cantDniPares); 

writeln ('El porcentaje de dni pares es: ',porcentajeDniPar(cantDniPares):2:2); 
writeln ('Los datos de los dos alumnos de mayor edad son:  ');
writeln (' (1) Nombre y apellido:   ',nombreMax1, ' ' ,ApellidoMax1); 
writeln (' (2) Nombre y apellido:  ',nombreMax2, ' ',ApellidoMax2); 
end.j
