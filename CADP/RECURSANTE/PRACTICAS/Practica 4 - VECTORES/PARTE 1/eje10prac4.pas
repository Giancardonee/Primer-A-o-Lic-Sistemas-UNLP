{ 10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}


//La carga finaliza al leer el salario 0 o al completarse el vector
{ tener en cuenta que debemos ingresar todos salarios positivos 
 ya que si ingresamos algun salario negativo, el programa daria un resultado erroneo }

 
// A lo sumo 300 empleados --> DimF 300


program diez ; 
const
    DimF = 300 ; 
type
vector = array [1..DimF] of real ; {el array es real porque vamos a almacenar salarios}

{ cargamos el vector hasta leer el auxSalario = 0 o hasta que se complete el vector}
procedure cargarVector (var v : vector ; var DimL : integer );
var 
auxSalario : real ; 
begin
DimL:= 0 ; 
write ('Ingrese el salario: ') ;readln (auxSalario); 
    while ((auxSalario <> 0) and (DimL <= DimF))do 
        begin
            DimL:= DimL + 1 ; 
            v[DimL]:= auxSalario; 
            write ('Ingrese el salario: ') ;readln (auxSalario); 
        end;
end;

{ a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, 
 implementar un módulo que reciba como parámetro un valor real X,
 el vector de valores reales y su dimensión lógica y retorne el mismo vector
 en el cual cada elemento fue multiplicado por el valor X. }
procedure incrementarSalarios ( x : real ; var v : vector ; DimL : integer );
var
i : integer ;
begin
  for i := 1 to DimL do 
    begin
      v[i]:= (v[i] * x ); { incrementamos un 15% el salario}
    end;
end;

function SueldoPromedio (sumaSueldos : real ; DimL: integer): real; 
begin
  SueldoPromedio:= ( sumaSueldos / DimL ); 
end;

{b)Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}
procedure mostrarSueldoPromedio (v : vector; DimL : integer ); 
var
i : integer ; 
sumaSueldos : real ; 
begin
sumaSueldos:=0 ; 
    for i := 1 to DimL do 
        sumaSueldos:= sumaSueldos + v[i]; 

  writeln ('El sueldo promedio de los empleados es:',SueldoPromedio(sumaSueldos,DimL));       
end;

{ programa principal }
var
v : vector ; 
dimL : integer ; 
x : real ; 
begin
  cargarVector(v,dimL); 
  x:= 1.15; { esta variable se usa para incrementar el salario un 15% }  
  incrementarSalarios(x,v,dimL);   
  mostrarSueldoPromedio(v,dimL);   
end.