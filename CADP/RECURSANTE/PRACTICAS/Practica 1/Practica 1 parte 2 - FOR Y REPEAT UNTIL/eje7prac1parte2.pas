{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total quce le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program siete ;
const
Autos_a_leer = 100; 
type
str40 = string[40]; 
tiempos = real;
var
nombre, nombreMin1, nombreMin2, nombreMax1,nombreMax2: str40; 
tiempo,tiempoMin1,tiempoMin2,tiempoMax1,tiempoMax2: tiempos; 
i: integer; 
begin
// inicializo los min y max
tiempoMin1:= 9999; 
tiempoMin2:= 9999; 
tiempoMax1:= -1 ; 
tiempoMax2:= -1 ; 
// inicializo los nombres
nombreMin1:= ' ' ; 
nombreMin2:= ' ' ; 
nombreMax1:= ' ' ; 
nombreMax2:= ' ' ; 

  for i:= 1 to Autos_a_leer do 
     begin
      write('Ingrese el nombre del piloto: '); 
        readln(nombre); 
           write('Ingrese el tiempo en que finalizo la carrera: '); 
               readln(tiempo); 
                  // Calculo los dos nombres minimos (primeros dos lugares)
                     if (tiempo < tiempoMin1) then 
                        begin
                            tiempoMin2:= tiempoMin1;
                            tiempoMin1:= tiempo; 
                            nombreMin2:= nombreMin1; 
                            nombreMin1:= nombre;  
                        end        
                     else if (tiempo < tiempoMin2) then 
                        begin
                            tiempoMin2:= tiempo; 
                            nombreMin2:= nombre; 
                        end;  
                       if (tiempo > tiempoMax1) then 
                           begin
                             tiempoMax2:= tiempoMax1; 
                             tiempoMax1:= tiempo; 
                             nombreMax2:= nombreMax1; 
                             nombreMax1:= nombre; 
                             end 
                        else if (tiempo > tiempoMax2) then 
                            begin
                                tiempoMax2:= tiempo ; 
                                nombreMax2:= nombre; 
                            end; 
      writeln; // Salto de linea 
      end; 
writeln ('----> El nombre del piloto del 1er puesto es: ',nombreMin1); 
writeln ('----> El nombre del piloto del 2so puesto es: ',nombreMin2); 
writeln ('----> El nombre del piloto del ante ultimo puesto es: ',nombreMax2); 
writeln ('----> El nombre del piloto del ultimo puesto es: ',nombreMax1); 
end.
