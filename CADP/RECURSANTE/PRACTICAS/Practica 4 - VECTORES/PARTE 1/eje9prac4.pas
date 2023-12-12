{ 9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse). }
program ocho; 
const 
    dimF = 400;
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
procedure cargarVector (var v : vector; var DimL: integer ); 
var
i : integer; 
dni : integer; 
begin
DimL:= 0 ; 
    write ('Ingrese el dni: '); readln(dni); 
        while ((dni <> -1) and (DimL <= dimF)) do 
          begin  
            DimL:= DimL + 1 ; 
            v[DimL].dni:= dni ; 
            write ('Ingrese el Nro de inscripcion: '); readln (v[DimL].nro_Inscripcion); 
            write ('Ingrese el apellido: '); readLn (v[DimL].apellido); 
            write ('Ingrese el nombre: '); readln (v[DimL].nombre); 
            write ('Ingrese el anho de nacimiento: '); readln (v[DimL].anhoNacimiento); 
            write ('Ingrese el dni: '); readln(dni); 
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

procedure RecorrerVector (v : vector; var ApellidoMax1,ApellidoMax2 : str20; var nombreMax1,nombreMax2: str20 ; var cantDniPares : integer; DimL : integer); 
var
i,anho1, anho2 : integer ; 
begin
cantDniPares:= 0 ; 
anho1:= 2025 ; anho2:= 2024;    
    for i:= 1 to DimL do 
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

Function porcentajeDniPar (cantDniPares,DimL : integer): real;
begin 
porcentajeDniPar:= (( cantDniPares/DimL) * 100 ); 
end; 

{ programa principal }
var
v: vector; 
ApellidoMax1,ApellidoMax2 : str20 ; 
nombreMax1,nombreMax2 : str20 ;  
DimL,cantDniPares : integer ; 

begin
cargarVector(v,DimL);
RecorrerVector(v,ApellidoMax1,ApellidoMax2,nombreMax1,nombreMax2,cantDniPares,DimL); 

writeln ('El porcentaje de dni pares es: ',porcentajeDniPar(cantDniPares,DimL):2:2); 
writeln ('Los datos de los dos alumnos de mayor edad son:  ');
writeln (' (1) Nombre y apellido:   ',nombreMax1, ' ' ,ApellidoMax1); 
writeln (' (2) Nombre y apellido:  ',nombreMax2, ' ',ApellidoMax2); 
end.

