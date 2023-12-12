{Se leen datos de empleados de una empresa multinacional.
 De cada empleado se conoce: 
su código de empleado (entre 1 y 2000)
 el código de país donde trabaja (entre 1 y 25)
 la antigüedad en años 
 el sueldo bruto en dólares. 
 
 La lectura finaliza al ingresar el código de empleado 1, el cual debe procesarse.

Realizar un programa que procese la información de los empleados, e 
informe:
● el país con mayor cantidad de empleados // vContador empleados por pais.

● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares // almaceno en una variable

● los códigos de los empleados que cobran el mejor sueldo en cada país} // vContador, saco empleado maxSueldo por cada pais


program enunciado1; 
const 
    cantPaises = 25;

type 
    rangoCodEmpleado = 1..2000; 
    rangoCodPais =1..25; 

    empleado = record 
        codEmpleado : rangoCodEmpleado; 
        codPais : rangoCodPais; 
        antiguedad : integer;
        sueldoBruto : real;
    end;  
    
    {este registro sirve para poder sacar el empleado max de cada pais}
    masCobran = record 
        sueldo : real;
        codEmpleado : rangoCodEmpleado;
    end;


    vEmpleadosPorPais = array [rangoCodPais] of integer;

    vCodEmpleadosMaxSueldoPais = array [rangoCodPais] of masCobran; 

    procedure LeerEmpleado (var e: empleado); 
    begin
      write ('Ingrese el codigo de empleado (entre 1 y 2000): '); readln (e.codEmpleado); 
      write('Ingrese el codigo del pais donde trabaja (entre 1 y 25): '); readln (e.codPais);
      write('Ingrese la antiguedad en anios: '); readln (e.antiguedad);
      write('Ingrese el sueldo bruto en dolares: '); readln (e.sueldoBruto); 
      writeln; //salto de linea 
    end;

    function esAntiguo (antiguedadEmpleado : integer):boolean;
    begin
      esAntiguo:= (antiguedadEmpleado >10); 
    end;

    function sueldoMenor1500 (sueldoEmpleado : real): Boolean;
    begin
      sueldoMenor1500:= (sueldoEmpleado < 1500); 
    end;

    {tengo que inicializar los vectores contadores: }
    //--------------------------------------------------------------------------------
    procedure iniVectorEmpleadosPais (var v : vEmpleadosPorPais); 
    var 
        i : integer; 
    begin
        for i:= 1 to cantPaises do 
            v[i]:=0;
    end;

    procedure iniVectorcodEmpleadosMaxSueldoPais(var v : vCodEmpleadosMaxSueldoPais); 
    var 
        i : integer;
    begin
        for i:= 1 to cantPaises do 
            v[i].codEmpleado:= 0; {aca me tira error porque el rango de codEmpleado va entre  1 y 2.000}
            v[i].sueldo:= 0;
    end;
    //--------------------------------------------------------------------------------

    function paisMasEmpleados (v : vEmpleadosPorPais): integer;
    var 
        i  : integer;
        EmpleadosMax : integer;
        codPaisMasEmpleados: integer;
    begin
        EmpleadosMax:=-1; 
        codPaisMasEmpleados:= -1; 
        for i:= 1 to cantPaises do 
            begin
                if (v[i] > EmpleadosMax) then 
					begin 
						EmpleadosMax:= v[i];
						codPaisMasEmpleados:=i;
                    end; 
            end;
            paisMasEmpleados:= codPaisMasEmpleados; 
    end;




    //● los códigos de los empleados que cobran el mejor sueldo en cada país} // vContador, saco empleado maxSueldo por cada pais
    procedure Calcular_e_maxSueldo_porPais ( e : empleado ; var v : vCodEmpleadosMaxSueldoPais); 
    begin
        if ( e.sueldoBruto > v[e.codPais].sueldo) then 
            begin
              v[e.codPais].sueldo:= e.sueldoBruto; 
              v[e.codPais].codEmpleado:= e.codEmpleado; 
            end;      
    end;



    procedure procesar (var vEpais : vEmpleadosPorPais; var vEmpleadoMax : vCodEmpleadosMaxSueldoPais);
    var 
        e : empleado; 
        e_antiguo_sueldoMenor1500 : integer; 
    begin
        e_antiguo_sueldoMenor1500:= 0; 
      repeat
        LeerEmpleado(e); 

        {incremento pais del empleado}
        vEpais[e.codPais]:= vEpais[e.codPais] + 1; 

        {calculo la cantidad de empleados de más de 10 años de antigüedad 
        cuyo sueldo bruto no alcance los 1500 dólares}
        if ( ( esAntiguo(e.antiguedad)) and (sueldoMenor1500(e.sueldoBruto)) ) then 
            e_antiguo_sueldoMenor1500:=e_antiguo_sueldoMenor1500 + 1; 


        {procedimiento para calcular el empleado maximo de cada pais. (no recorro en este proceso)}
        Calcular_e_maxSueldo_porPais(e,vEmpleadoMax);

      until (e.codEmpleado = 1);
        writeln ('El pais con mas empleados es: ',paisMasEmpleados(vEpais)); //inciso a
        writeln ('La cant ant de empleados (antiguedad>10) y (sueldoBruto <1500) son: ',e_antiguo_sueldoMenor1500); //inciso b
    end;

    procedure informar_e_MasSueldo_PorPais (v : vCodEmpleadosMaxSueldoPais); 
    var 
        i : integer; 
    begin
        for i:= 1 to cantPaises do 
              writeln('El empleado con mas sueldo del pais ',i, ' tiene codigo de empleado: [ ',v[i].codEmpleado, ' ]'); 
    end;

    { programa principal }
    var 
        vE_PorPais : vEmpleadosPorPais; 
        vCod_e_MasSueldo : vCodEmpleadosMaxSueldoPais; 
    begin
      {inicializo los dos vectores}
      iniVectorEmpleadosPais(vE_PorPais);
      iniVectorcodEmpleadosMaxSueldoPais(vCod_e_MasSueldo);

      {proceso empleados}
      procesar(vE_PorPais,vCod_e_MasSueldo);

      {informar cod Empleado mas salario x pais}
      informar_e_MasSueldo_PorPais(vCod_e_MasSueldo);
    end.