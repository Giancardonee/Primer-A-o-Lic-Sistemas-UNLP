{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral;
 3.lenticular; 4. irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) La cantidad de galaxias de cada tipo.
b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}


{cuenta con datos correspondientes a las 53 galaxias
 se debe usar un vector de 1 hasta 53.}

{ su tipo (1. elíptica; 2. espiral; 3.lenticular; 4. irregular)
 para almacenar su tipo puedo usar un vector de 1 hasta 4. 
 tambien podria usar un registro,pero no se si seria correcto.}

program doce; 
const 
    cantGalaxias = 53; 
type
    rangoTipo = 1..4;
    str20 = string[20]; 
    galaxia = record
        masa : real;
        DistanciaPC : real; 
        tipo : rangoTipo; 
        nombre : str20; 
    end;    
vectorGalaxia = array [1..cantGalaxias] of galaxia;
vectorTipo  = array [rangoTipo] of integer; 
procedure cargarVector (var v : vectorGalaxia); 
var
i:integer;
begin
    for i:= 1 to cantGalaxias do 
        begin
            write('Ingrese el nombre de la galaxia: '); readln (v[i].nombre); 
            write('Ingrese la masa de la galaxia: ');readln( v[i].masa ) ;
            write('Ingrese la distancia en parsecs: '); readln (v[i].DistanciaPC) ; 
            write('Ingrese el tipo (1. elíptica; 2. espiral; 3.lenticular; 4. irregular): '); readln(v[i].tipo); 
        end;
end;

{La cantidad de galaxias de cada tipo.}
{primero debo inicializar cada posicion del vector en 0, porque usp un vector contador}
procedure inicializarVectorTipo (var vTipo : vectorTipo); 
var
i:integer;
begin
  for i:= 1 to 4 do 
    vTipo[i]:= 0;
end;
{ debo pasar como parametro el vector, y v[i].tipo 
 de esta manera, incremento el tipo ingresado}
procedure contarTipoGalaxia (var vTipo : vectorTipo; tipo : integer); 
begin
    vTipo[tipo]:=vTipo[tipo]+ 1; 
end;

{La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.}

{Hago una funcion que me devuelva True si se lee alguna galaxia principal.
 Si devuelve True, sumo la masa a la variable masa3Galaxias}
{para sacar el porcentaje que representa, debo tener 2 variables: 
una para almacenar la masa total de las 3 galaxias (masa3Galaxias)
otra para almacenar la masa total de todas las galacias (masaTotal)}

{le debo pasar como parametro v[i].nombre}
function esGalaxiaPrincipal (nombreGalaxia : str20): boolean; 
begin
  esGalaxiaPrincipal:= ((nombreGalaxia = 'Via Lactea') or (nombreGalaxia = 'Andromeda') or (nombreGalaxia = 'Triangulo')); 
end;

{La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
por galaxia no irregular entiendo que son los primeros 3 tipos de galaxia }
{hago una funcion, que corrobore si es una Galaxia no irregular.
 Si devuelve True, debo incrementar la variable cantGalaxiasNoRegulares }
 {debo pasarle como parametro v[i].tipo, v[i].DistanciaPC}
function esGalaxiaNoRegular (tipoGaaxia : integer; distancia : real): boolean; 
begin
  esGalaxiaNoRegular:= (((tipoGaaxia>= 1) and (tipoGaaxia <= 3)) and (distancia < 1000) ); 
end;


{ El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

{ debo pasarle como parametros: nombreMax1,nombreMax2,v[i].nombre,v[i].masa}
procedure dosGalaxiasMaxMasa (var nombreMax1,nombreMax2 : str20; nombreGalaxia : str20; masaGalaxia: real; var max1,max2 : real);
begin
  if (masaGalaxia > max1) then 
    begin
      max2:= max1; 
      max1:= masaGalaxia;
      nombreMax2:=nombreMax1; 
      nombreMax1:= nombreGalaxia;
    end
  else if (masaGalaxia > max2) then 
    begin
      max2:= masaGalaxia; 
      nombreMax2:=nombreGalaxia; 
    end;
end; 

{procedimiento de las dos galaxias minimas}
{ debo pasarle como parametro: nombreMin1,nombreMin2,v[i].nombre,v[i].masa}
procedure dosGalaxiasMinMasa (var nombreMin1,nombreMin2: str20; nombreGalaxia : str20; masaGalaxia : real; var min1,min2 : real );
begin
  if (masaGalaxia < min1) then
    begin
          min2:= min1; 
          min1:=masaGalaxia; 
          nombreMin2:= nombreMin1; 
          nombreMin1:=nombreGalaxia;
        end
      else if (masaGalaxia < min2) then
        begin
          min2:= masaGalaxia;
          nombreMin2:=nombreGalaxia;
        end;      
end;

function porcentajeGalaxiasPrincipales(masa3Galaxias : real ): real;
begin
  porcentajeGalaxiasPrincipales:= ((masa3Galaxias/cantGalaxias)*100); 
end;

procedure procesar_y_recorrerVectorGalaxia(vGalaxia: vectorGalaxia ;  var vTipo: vectorTipo); 
var
nombreMin1,nombreMin2,nombreMax1,nombreMax2 : str20; 
i,cantGalaxiasNoRegulares: integer;
masa3Galaxias, masaTotal : real; 
min1,min2 : real ; 
max1,max2: real ; 
begin
nombreMin1:= ' '; nombreMin2:= ' '; 
nombreMax1:= ' '; nombreMax2:= ' '; 
min1:= 32000; min2:= 32001; 
max1:= -1 ; max2:= -2;
cantGalaxiasNoRegulares:=0; 
masa3Galaxias:= 0;
masaTotal:= 0;
{aca recorro y proceso todo el vector} 
  for i:= 1 to cantGalaxias do 
    begin
      contarTipoGalaxia(vTipo,vGalaxia[i].tipo); 
      if (esGalaxiaPrincipal(vGalaxia[i].nombre))then
          masa3Galaxias:= masa3Galaxias + vGalaxia[i].masa;
      if (esGalaxiaNoRegular(vGalaxia[i].tipo,vGalaxia[i].DistanciaPC)) then 
           cantGalaxiasNoRegulares:= cantGalaxiasNoRegulares + 1;

      dosGalaxiasMaxMasa(nombreMax1,nombreMax2,vGalaxia[i].nombre,vGalaxia[i].masa,max1,max2); 
      dosGalaxiasMinMasa(nombreMin1,nombreMin2,vGalaxia[i].nombre,vGalaxia[i].masa,min1,min2); 

      masaTotal:= masaTotal + vGalaxia[i].masa; 
    end;
  writeln('El nombre de las dos Galaxias con mayor masa son: '); 
  writeln('(1) ',nombreMax1); 
  WriteLn('(2) ',nombreMax2); 

  writeln ('El nombre de las dos Galaxias con menor masa son: ');
  writeln('(1) ',nombreMin1); 
  WriteLn('(2) ',nombreMin2); 

  writeln('La cantidad de galaxias no regulares que se encuentran a menos de 1000pc son: ',cantGalaxiasNoRegulares); 
 
  writeln('La masa total acumulada de las 3 Galaxias principales es: ',masa3Galaxias); 
  writeln('Representa un % ',porcentajeGalaxiasPrincipales(masa3Galaxias), ' respecto a las masas de todas las galaxias');
{Informo la cantidad de galaxias de cada tipo}
for i:= 1 to 4 do 
  WriteLn('La cantidad de galaxias de tipo ',i, ' son: ',vTipo[i]); 
end; 


{programa principal}
var 
vGalaxia: vectorGalaxia;
vTipo: vectorTipo; 
begin
inicializarVectorTipo(vTipo); {en este vector cuento la cantidad de tipos de galaxia}
cargarVector(vGalaxia); {en este procedimiento cargo todos los datos de las 53 galaxias}
procesar_y_recorrerVectorGalaxia(vGalaxia,vTipo);
end.
