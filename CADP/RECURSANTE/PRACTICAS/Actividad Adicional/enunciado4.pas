
Enunciado 4
Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 0.
Realizar un programa que lea y almacene la información de los empleados en una
estructura de datos adecuada. Una vez completada la carga, procese la información de los
empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● el código del empleado que cobra el mejor sueldo en cada país
}
program enunciado4;
const 
    cantEmpleados = 4; // poner 2000
    cantPaises = 25;
type 
    rangoCodEmpleado = 0..cantEmpleados; 
    rangoPais = 1..cantPaises; 

    empleado = record 
        codEmpleado : rangoCodEmpleado; 
        codPais : rangoPais; 
        sueldo : real; 
        antiguedad: integer;
    end;

    {aca voy a almacenar toda la informacion de cada empleado}
    vEmpleados = array [1..cantEmpleados] of empleado ;

    {aca voy a tener la cantidad de empleados de cada pais}
    vContadorEmpleados = array [1..cantPaises] of integer;

    mas_cobran = record 
        sueldo : real ;
        codEmpleado : rangoCodEmpleado; 
    end;
    {aca voy a tener el codigo de empleado y el sueldo, del empleado que mas cobra de cada pais}
    vSueldosMax = array [1..cantPaises] of mas_cobran; 


    { modulos }

    procedure LeerEmpleado (var e : empleado); 
    begin
        write ('Ingrese el codigo de empleado: '); readln (e.codEmpleado); 
            if (e.codEmpleado <> 0) then 
                begin
                        write ('Ingrese el codigo de pais: '); readln (e.codPais); 
                        write ('Ingrese el sueldo del empleado: '); readln(e.sueldo); 
                        write ('Ingrese la antiguedad del empleado: '); readln(e.antiguedad);
                end;
                writeln; // salto de linea 
   
    end;

    procedure CargarVector(var v : vEmpleados; var DimL : integer);
    var 
        e : empleado;
    begin
      DimL:= 0 ;
      LeerEmpleado (e); 
      while ( (e.codEmpleado <> 0) and (DimL < cantEmpleados ) )  do 
        begin
          DimL:= DimL + 1; { incremento posicion } 
          v[DimL]:= e;      { asigno el empleado en el vector}
          LeerEmpleado(e);  
        end;
    end;

    procedure inicializarVectores (var v1: vContadorEmpleados; var v2 : vSueldosMax); 
    var 
        i : integer;
    begin
        for i:= 1 to cantPaises do 
            begin
                v1[i]:= 0 ; 
                v2[i].sueldo:= -1 ; 
                v2[i].codEmpleado:= 0;      
            end;
    end;

    { ● el país con mayor cantidad de empleados }
    function paisMasEmpleados (v: vContadorEmpleados): integer; { retorna EL PAIS maximo }
    var 
        i,max,paisMax : integer;
    begin
        max:= -1; 
        paisMax:= 0; 
        for i:= 1 to cantPaises do 
                if (v[i] > max) then 
                    begin
                        max:= v[i]; { en v[i] voy a tener la cantidad de empleados por pais }
                        paisMax:= i;    { en i tengo el pais actual que estare calculando el max}
                    end;
        paisMasEmpleados:= paisMax;
    end;

    { ● la cantidad de empleados de más de 10 años de antigüedad
     cuyo sueldo bruto no alcance los 1500 dólares}

    function cumpleAntiguedad_Salario (salario : real; antiguedad : integer): boolean;
    begin
      cumpleAntiguedad_Salario:= ( ( salario <1500) and (antiguedad>10 ) ); { devuelve True y debo contar en variable cantCumplen} 
    end;

    { ● el código del empleado que cobra el mejor sueldo en cada país }

    procedure calcularMax ( e: empleado ; var v: vSueldosMax); 
    begin
      if (e.sueldo > v[e.codPais].sueldo ) then 
        begin
            v[e.codPais].sueldo:= e.sueldo; 
            v[e.codPais].codEmpleado:= e.codEmpleado
        end;
    end;
    

    { informar empleado con mas salario por pais }
    procedure informarEmpleadosMax (v : vSueldosMax); 
    var 
        i : integer;
    begin
        for i:= 1 to cantPaises do { recorro todos los paises, por cada pais informo el empleado max}
            writeln ('En el pais ',i, ' el empleado con mayor sueldo es: ',v[i].codEmpleado); 
    end;

    procedure procesarVector (v1: vEmpleados; DimL : integer; var v2 : vContadorEmpleados; var v3 : vSueldosMax; var cantCumplen : integer);
    var 
        pos : integer;
    begin
        cantCumplen:= 0 ;
        pos:= 1; 
        while (pos <= DimL) do 
            begin
                { incremento empleado por pais }
                v2[v1[pos].codPais]:= v2[v1[pos].codPais] + 1; { podria modularizarlo un poco mas. }

                { calculo los empleados que cumplen con las condiciones (antiguedad>10 y sueldo <1500)}
                if (cumpleAntiguedad_Salario(v1[pos].sueldo,v1[pos].antiguedad)) then 
                    cantCumplen:= cantCumplen + 1;  

                { calculo el maximo por cada pais }
                calcularMax(v1[pos], v3); 

                pos:= pos + 1; { incremento de pos para poder seguir recorriendo el vector. }
            end;
    end;


    { programa principal }
    var 
    v1 : vEmpleados; 
    v2 : vContadorEmpleados; 
    v3 : vSueldosMax; 
    cantCumplen,DimL : integer;
    begin 
        inicializarVectores (v2,v3); 
        CargarVector(v1,DimL); 
        procesarVector(v1,DimL,v2,v3,cantCumplen); 
        informarEmpleadosMax(v3); 
        writeln ('La cantidad de empleados que cumplen las condiciones son: ',cantCumplen); 
        writeln ('El pais con mas empleados es: ',paisMasEmpleados(v2)) ; 
    end. 