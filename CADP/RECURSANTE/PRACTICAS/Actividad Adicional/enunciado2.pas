 { Enunciado 2
Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 0. La información se lee ordenada por código de país.//corte de control por pais
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país} 



{ 
La información se lee ordenada por código de país.//corte de control por pais

} 
program enunciado2;
const
    cantEmpleados = 2000;
    cantPaises = 25;
type
    rangoCod = 0..2000; 
    rangoPaises = 1..25; 

    {almaceno los datos de los empleados}
    empleado = record 
        codEmpleado : rangoCod;
        codPais : rangoPaises; 
        antiguedad : integer;
        sueldo : real; 
    end; 

    info_empleadoMax = record 
        codigoEmpleado : integer;
        sueldo : real; 
    end; 

    { modulos }
    {La lectura finaliza al ingresar el código de empleado 0} 
    procedure LeerEmpleado (var e : empleado); 
    begin
        write ('ingrese el codigo de empleado: '); readln (e.codEmpleado);
            if (e.codEmpleado <>0) then 
                begin
                    write ('ingrese el codigo de pais: '); readln (e.codPais);
                    write ('ingrese la antiguedad: '); readln (e.antiguedad);
                    write ('ingrese el sueldo beuto en dolares: '); readln (e.sueldo);  
                    writeln; //salto de linea
                end;
    end;
    
    { ● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
        alcance los 1500 dólares ----> funcion cumple_antiguedad_salario }
    
    function cumple_antiguedad_salario (salario : real ; antiguedad: integer): boolean ; 
    begin
      cumple_antiguedad_salario:= ( (salario < 1500) and (antiguedad >10));  { devuelve True si se cumplen ambas condiciones }
    end;

    {Deberia ser un procedure, porque tengo que actualizar el Max, y el paisMax}
    procedure calcularPaisMasEmpleados (paisActual,empleados_pActual: integer; var max, paisMax: integer); 
    begin
        if ( empleados_pActual > max ) then 
            begin
              max:= empleados_pActual; 
              paisMax:=paisActual; 
            end;
    end;

    procedure empleadoSueldoMax (e: empleado; var eMax : info_empleadoMax); 
    begin
      if ( e.sueldo > eMax.sueldo ) then 
        begin
            eMax.sueldo:= e.sueldo; 
            eMax.codigoEmpleado:= e.codEmpleado; 
        end;
    end;


    procedure procesar (var empleadosCumple : integer; var paisMaxEmpleados : Integer); 
    var 
        e : empleado; 
        eMax : info_empleadoMax; 
        paisActual : integer;
        empleadosPais,Max: integer; 
    begin
        empleadosCumple:= 0 ;
        LeerEmpleado(e); 
        Max:= -1;  {maximo para sacar el pais con mas empleados}
       
            while ( e.codEmpleado <> 0 ) do 
                begin
                    empleadosPais:=0; 
                    paisActual:= e.codPais; 
                    eMax.sueldo:= -1; 
                    eMax.codigoEmpleado:= 0; 
                        while ( (e.codEmpleado <> 0 ) and (e.codPais = paisActual)) do 
                            begin
                                {cuento empleado por pais}
                                empleadosPais:= empleadosPais + 1; 

                                { incremento si el empleado cumple con las condiciones (antiguedad>10, sueldo<1500)}
                                if (cumple_antiguedad_salario(e.sueldo,e.antiguedad)) then
                                    empleadosCumple:=empleadosCumple + 1;

                                empleadoSueldoMax(e,eMax);  
                                LeerEmpleado(e);
                            end;
                        calcularPaisMasEmpleados (paisActual,empleadosPais,max,PaisMaxEmpleados);
								if (e.codEmpleado <> 0) then 
									 writeln ('Se leyo un empleado con pais distinto a ',paisActual) ; { cuando entre aca es porque se cambio el pais del empleado}
							writeln ('El empleado con mayor sueldo del pais ',paisActual, ' tiene codigo: ',eMax.codigoEmpleado); 
							writeln;
                end;
    end;

    { programa principal }
    var 
        empleadosCumple,paisMaxEmpleados: integer;
    begin
        procesar(empleadosCumple,paisMaxEmpleados);
        writeln; 
        writeln ('La cantidad de empleados con ( antiguedad> 10 y sueldo<1500 ) son:  ',empleadosCumple); 
        writeln; 
        writeln ('El pais con mas empleados es: ',paisMaxEmpleados);
    end.
