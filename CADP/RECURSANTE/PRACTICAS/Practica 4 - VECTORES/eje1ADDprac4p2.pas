{1. La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux
 en La Plata. Para ello, debe realizar un programa que lea y almacene información
 sobre las computadoras con este sistema operativo (a lo sumo 10.000). 
 De cada computadora se conoce:
  código de computadora
  la versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), 
  la cantidad de paquetes instalados
  y la cantidad de cuentas de usuario que poseen. 
  
  La información debe almacenarse ordenada por código de computadora de manera ascendente. 
  La lectura finaliza al ingresar el código de computadora -1, que no debe procesarse. 
  Una vez almacenados todos los datos, se pide:

a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04
b. Informar el promedio de cuentas de usuario por computadora.
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500. }

    program eje1ADD; 
    const 
        DimF = 10000;
    type 
        compu = record 
            codComputadora : integer; 
            version : real; 
            paquetesInstalados : integer; 
            cantUsuarios: integer;
        end; 
        vCompus = array [1..DimF] of compu; 

    procedure leerCompu (var c:compu); 
    begin
        write ('Ingrese el codigo de computadora: '); readln(c.codComputadora); 
            if (c.codComputadora <> -1) then 
                begin
                    write ('Ingrese la version: ((18.04, 17.10, 17.04, etc.)): '); readln (c.version);
                    write ('Ingrese la cantidad de paquetes instalados: '); readln (c.paquetesInstalados); 
                    write ('Ingrese la cantidad de usuarios: '); readln (c.cantUsuarios);  
                    writeln; 
                end;
    end;        

    {La información debe almacenarse ordenada por código de computadora de manera ascendente.}
    {preguntar si tengo que usar corte de control o si tengo que asumir que se ingresa ordenada}
    procedure cargarVectorCompu (var v : vCompus; var DimL : integer); 
    var 
    c : compu;
    begin
      DimL:= 0; 
      leerCompu(c); 
      while ( (c.codComputadora <> -1) and (DimL<= DimF)) do 
        begin
            DimL:= DimL + 1; 
            v[DimL]:= c;
            leerCompu(c); 
        end;
    end;


 {d. Eliminar la información de las computadoras con código entre 0 y 500. }
    {si (codComputadora => 0) y (codComputadora <=500) elimino }
{primero hago el procedimiento eliminar, ya que no tiene sentido procesar toda la informacion
para despues borrar toda la info que este entre 0 y 500} 
  procedure EliminarCodComputadora0_500 (var v : vCompus; var DimL : Integer); 
  var 
     pos,i : integer; 
  begin
    pos:= 1; 
      while (pos<= DimL) do 
        begin
            if ( (v[pos].codComputadora>= 0) and (v[pos].codComputadora<=500) ) then {si codComputadora >=0 y <=500}
             begin
               for i:= pos to (diml-1) do    {elimino posicion}
                    v[i]:= v[i+1];       {corro todo una pos menos}
                  DimL:= DimL -1; {(tengo un elemento menos que borre, entonces decremento DimL)}
             end
             else 
              pos:= pos + 1;  
{si codComputadora NO esta entre 0 y 500. Incremento pos para poder seguir recorriendo el vector}  
        end;
       

  end;
  procedure calcularMax(cantPaquetes:integer; versionActual: real;var paquetesMax :integer; var versionMasPaquetes : real); 
  begin
    if (cantPaquetes > paquetesMax) then 
        begin
          paquetesMax:= cantPaquetes; 
          versionMasPaquetes:= versionActual; 
        end;
  end;

  {a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.}
     {tengo que usar dos variables para almacenar las versiones 18.04 y 16.04}  

  {b. Informar el promedio de cuentas de usuario por computadora.}
    {sumo el total de las cuentas de cada usuario y saco promedio con dimL} 

{c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.}
  {  procedimiento calculomax (parametros: cantPaquetes,versionActual || var: paquetesMax,versionMasPaquetes )  } 
    procedure procesarVector (var v : vCompus; var DimL : integer); 
    var 
    v1804,v1604 : real; 
    i,SumaCuentasUsuario,cant,paquetesMax : integer; 
    versionMasPaquetes,promedioCuentasUsuario : real; 
    begin
     {inicializo todas las variables que uso en este procedimiento}
     v1804:= 18.04;  v1604:= 16.04; 
     cant:= 0; promedioCuentasUsuario:= 0; SumaCuentasUsuario:= 0;
     versionMasPaquetes:= -1; paquetesMax:= -1;         
     
    {antes de procesar vector, borro todas las pos con codComputadora entre 0 y 500}
    EliminarCodComputadora0_500(v,DimL); 

      for i:= 1 to DimL do  
        begin

            if ( (v[i].version = v1804) or (v[i].version = v1604) ) then 
              cant:= cant + 1; 

            SumaCuentasUsuario:= SumaCuentasUsuario + v[i].cantUsuarios; 

            calcularMax(v[i].paquetesInstalados,v[i].version,paquetesMax,versionMasPaquetes);

        end;
        promedioCuentasUsuario:= (SumaCuentasUsuario / DimL); 
      writeln('La cantidad de versiones 18.04 o 16.04 leidas son: ',cant); 
      writeln('El promedio de cuentas por usuario es: ',promedioCuentasUsuario:2:2); 
     
     {en este tengo dudas si hacer un vContador, o si debo sacar versiones que voy leyendo
     creo que tengo que hacer un vContador. Pero no se cuantas versiones se van a leer.}
      writeln ('La version con mayor cantiad de paquetes instalados es: ',versionMasPaquetes:2:2);
    end;
    
    
     { no necesario pero lo pongo pasa saber si elimine las pos bien}
	procedure informarV (v: vCompus; DimL : integer); 
	var
		i : integer; 
	begin 
			for i:= 1 to DimL do 
				begin
						writeln; 
						writeln(v[i].codComputadora); 
						writeln(v[i].version:2:2); 
						writeln(v[i].paquetesInstalados); 
						writeln (v[i].cantUsuarios); 					
				end;
	end; 

    { programa principal }

    var
    v : vCompus; 
    DimL : integer; 
    begin
      cargarVectorCompu(v,DimL); 
      procesarVector(v,DimL);       
	  informarV (v,DimL);	 
    end.
