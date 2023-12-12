{ 
Enunciado 3
Se dispone de datos de empleados de una empresa multinacional. De cada empleado se
conoce su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y
25), la antigüedad en años y el sueldo bruto en dólares.
 La información se encuentra ordenada por código de país.
Realizar un programa que procese la información de los empleados, e informe:

● el país con mayor cantidad de empleados
    recorro todo el vDatosEmpleados, y voy calculando por cada pais la cantidad de empleado
    para luego sacar el maximo. 

● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares

● el código del empleado que cobra el mejor sueldo en cada país
    para cada pais --> for i:= 1 to cantPaises
        recorro el vector vDatosEmpleados y calculo maximo MIENTRAS este en el mismo pais ( i (seria el codigo del pais) )
}


{ se dispone de datos de empleados: Ya esta el vector cargado. 
    solo deberiamos invocarlo y poner se dispone.
}

program enunciado3; 
const
    cantPaises = 25; 
    cantEmpleados = 10; // poner 2000 para que vaya acorde al enunciado. 
type 
    rangoPaises = 1..25; 
    rangoCodEmpleado = 1..2000; 

    empleado = record 
        codigoEmpleado : rangoCodEmpleado;
        codigoPais : rangoPaises; 
        antiguedad : integer;
        sueldo : real;
    end;

    vDatosEmpleados = array [1..cantEmpleados] of empleado; 


    empleado_sueldoMax = record 
        sueldo : real; 
        codigoEmpleado : rangoCodEmpleado;
    end; 


    { se dispone la carga de vDatosEmpleados, y se encuentra ordenado por codigo de pais. }
    //procedure cargarVector (v : vDatosEmpleados;var  DimL : integer)

    function esPaisMasEmpleados (cantEmpleados, max : integer): boolean; 
    begin
      esPaisMasEmpleados:= ( cantEmpleados > max ); 
    end;

    function cumpleAntiguedad_y_sueldo (antiguedad : integer; sueldo : real): boolean;
    begin
      cumpleAntiguedad_y_sueldo:= ( (antiguedad > 10) and (sueldo<1500) );  
    end;
{ 
    ● el código del empleado que cobra el mejor sueldo en cada país
    para cada pais --> for i:= 1 to cantPaises
        recorro el vector vDatosEmpleados y calculo maximo MIENTRAS este en el mismo pais ( i (seria el codigo del pais) )
}


    
    procedure calcularEmpleadoMasSueldo(sueldo : real; codigoEmpleado : integer; var eMax : empleado_sueldoMax)
    var 

    begin
        if ( sueldo > eMax.sueldo ) then 
            begin
                eMax.sueldo:= sueldo; 
                eMax.codigoEmpleado:= codigoEmpleado; 
            end;
    end; 
     

  
    procedure procesarVector (v : vDatosEmpleados; DimL :  integer; var empleadosCumple : integer; var paisMax : integer;); 
    var 
        max,pos,cantEmpleados,paisActual: integer; 
        eMax : empleado_sueldoMax; 

    begin
        pos:= 1; 
        max:= -1;
        empleadosCumple:= 0;
        while ( pos < DimL) do 
            begin
                paisActual:= v[pos].codigoPais; 
                cantEmpleados:= 0; 
                eMax.sueldo:=0 ;
                eMax.codigoEmpleado:=0; 
                while ( (pos < DimL) and (v[pos].codigoPais = paisActual)) do 
                    begin

                        {si cumple antiguedad>10 y sueldo<1500 incremento en empleadosCumple}
                            if (cumpleAntiguedad_y_sueldo(v[pos].sueldo,v[pos].antiguedad)) then 
                                empleadosCumple:= empleadosCumple + 1;

                         {contamos la cantidad de empleados por pais}
                            cantEmpleados:= cantEmpleados + 1;

                          {actualizarMax por pais}
                            calcularEmpleadoMasSueldo(v[pos].sueldo,v[pos].codigoEmpleado,eMax);

                            pos:= pos + 1; {para seguir avanzando en el vector}
                    end;
                            {cuando estoy aca es porque se proceso un pais distinto al actual}
                                {calculo pais con mas empleados (podria ser un procedure tambien)}
                                if (esPaisMasEmpleados(cantEmpleados,max)) then 
                                    begin
                                        max:= cantEmpleados; 
                                        paisMax:= paisActual; 
                                    end;
                writeln ('El empleado con mayor sueldo del pais: ',paisActual, ' es el empleado con codigo: ',eMax.codigoEmpleado); 
            end;
    end;

    { programa principal }
    var 
        v : vDatosEmpleados; 
        DimL,empleadosCumple,paisMax : integer;
    begin
        cargarVector (v,DimL); //se dispone la carga y se encuentra ordenado por codigo de pais
        procesarVector(v,DimL,empleadosCumple,paisMax); 
        writeln ('El pais con mas cantidad de empleados es el pais: ',paisMax); 
        writeln ('La cantidad de empleados con antiguedad>10 y sueldo <1500 son: ',empleadosCumple); 
    end.