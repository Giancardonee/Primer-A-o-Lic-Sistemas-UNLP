{ 
5. La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).

Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:

a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes

}

{
    a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
        cant Contratos por mes --> Almaceno en un vector 
        cant Contratos por año --> Uso una variable para almacenar
        //Obviamente debo reiniciar esto cada vez que se lea un año distinto. 
}

{
    b. Cantidad de clientes para cada categoría de monotributo
        Facil. tengo vClientesCategoria, lo inicializo en 0. Mientras proceso los clientes
        voy incrementando el cliente por categoria. 

}

{
  c. Código de las 10 ciudades con mayor cantidad de clientes
        tengo que tener un vector (vCiudades con registro con campos codCiudad y cantClientes)
    
    usando un for de 1 hasta 2400 (cantCiudades)
        Debo inicializar vCiudades.cantClientes:= 0;  //para poder ir incrementando y contando clientes.
        debo inicializar vCiudades.codCiudad:= i; //Asi tengo en cada posicion un codigo de ciudad

        Mientras proceso, incremento el cliente, segun el codCiudad

}

{
    d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes
        necesito sumar el montoMensual de todos los clientes, dos opciones: 

            si lo hago en el proceso cargarVector, recorro solamente una vez el vector
              voy sumando los montos a medida que voy cargando. 
                y luego en el procedure procesar, a medida que voy leyendo, uso en una variable contadora (cuento los clientes con monto mayor al promedio)
                    al final del procedure procesar informo, 

            si lo hago fuera del proceso cargarVector, primero debo recorrer el vector (en el modulo procesar)
                 y ahi sacar el montoMensualPromedio.
                  Luego debo recorrer (en una funcion) todo el vector vClientes y devolver la cant de
                    clientes con sueldo mayor al promedio.  
}

program eje5prac4p2; 
const 
    cantClientes = 4; // DimF = 500 
    cantCiudades = 2400; 
    cantMeses = 12; 
type 
    rangoCategoria = 'A'..'F'; 
    rangoCodCiudad = 1..2400; 

    fecha = record
        anio : integer; 
        mes : integer; 
    end; 

    cliente = record
        fechaFirma : fecha; 
        categoria : rangoCategoria; 
        codCiudad :rangoCodCiudad; 
        montoMensual : real; 
    end; 

    aux = record 
        cantClientes : integer; 
        codCiudad : rangoCodCiudad; 
    end; 

    //vMeses = array [1..12] of integer; {cuento la cantidad de contratos por mes}
    vClientes  = array [1..cantClientes] of cliente;
    vCiudades  = array [rangoCodCiudad] of aux; {guardo la cant de clientes y codCiudad}
    vCategoria = array [rangoCategoria] of integer; 
    vTop10 = array [1..10] of integer; {solamente debo guardar el cod de Ciudad (de las ciudades c mas clientes)}

    {modulos}

    { modulos para cargar el vector: }
    //--------------------------------------------------------------------------------
    procedure LeerFecha (var f : fecha); 
    begin 
        write ('Ingrese el el anio de firma de contrato: '); readln (f.anio); 
        write ('Ingrese el mes de firma del contrado: '); readln (f.mes); 
    end;         
    procedure LeerDatos (var c : cliente); 
    var 
    f: fecha; 
    begin
      LeerFecha(f); 
      write ('Ingrese la categoria (entre A y F):'); readln (c.categoria); 
      write ('Ingrese el codigo de ciudad (entre 1 y 2400): '); readln (c.codCiudad); 
      write ('Ingrese el monto mensual: '); readln(c.montoMensual);
		writeln; 
    end;
    {los datos se deben almacenar de forma ordenada, por año y por mes}
    procedure cargarVector (var v : vClientes);
    var 
      i : integer; 
      c : cliente; 
      anioActual,mesActual :  integer;
    begin
        i:= 1;
        LeerDatos(c); 
        v[i]:= c;   
        while ( i<cantClientes ) do 
          begin
            anioActual:= v[i].fechaFirma.anio; 
              while ((v[i].fechaFirma.anio = anioActual) and (i < cantClientes )) do 
                begin
                    mesActual:= v[i].fechaFirma.mes; 
                      while ( (v[i].fechaFirma.anio = anioActual) and (v[i].fechaFirma.mes = mesActual) and (i < cantClientes) ) do
                        begin
                            i:= i + 1;
                            LeerDatos(c);
                            v[i]:=c;
                        end;
                end;  
          end;
    end;



{  procedure cargarVector(var v : vClientes); 
    var 
    i : integer; 
    c : cliente;  
    begin
        for i:= 1 to cantClientes do
            begin
                LeerDatos(c);
                v[i]:= c; 
            end;
    end; }    
    //--------------------------------------------------------------------------------
    
    //--------------------------------------------------------------------------------
    { modulos para inicializar vectores contadores }
    {procedure ini_vMeses (var v : vMeses); 
    var 
    i : Integer; 
    begin
        for i:= 1 to 12 do 
            v[i]:= 0; 
    end;}
    procedure ini_vCategorias (var v : vCategoria); 
    var 
     i : char; 
    begin
        for i:= 'A' to 'F' do 
            v[i]:= 0; 
    end;
    procedure ini_vCiudades (var v : vCiudades); 
    var 
        i : integer;
    begin
      for i:= 1 to cantCiudades do 
        begin
          v[i].codCiudad:= i; 
          v[i].cantClientes:= 0 ; 
        end;
    end;
    //--------------------------------------------------------------------------------

    //--------------------------------------------------------------------------------
    { modulo para ordenar vector por cantClientes de mayor a menor } 
    procedure ordenarClientesMayorMenor (var v : vCiudades); 
    var 
    i,j,p : integer; 
    auxiliar : aux; 
    begin
      for i:= 1 to (cantCiudades - 1) do 
        begin
        p:= i ; 
            for j:= (i+1) to cantCiudades do
            begin  
                if (v[j].cantClientes > v[i].cantClientes) then 
                    p:= j;
            end;        
        auxiliar:= v[p]; 
        v[p]:= v[i]; 
        v[i]:= auxiliar; 
        end;
    end;    
    //--------------------------------------------------------------------------------
    { modulo para cargar el vector top10 ciudades mas Clientes}
    procedure cargarTop10 (vCiu : vCiudades; var vTop : vTop10); 
    var 
    i : integer; 
    begin
      for i:= 1 to 10 do 
        begin
            vTop[i]:= vCiu[i].codCiudad;  
        end;        
    end;
    //--------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------
    { modulo para calcular año mas contratos }
    procedure calcularMasContratos (anioActual,contratosAnio: integer; var anioMax,contratosMax: integer); 
    begin
      if (contratosAnio > contratosMax) then 
        begin
          contratosMax:= contratosAnio; 
          anioMax:= anioActual; 
        end;
    end;
    //--------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------
    { funciones para calcular promedio y calcular cant clientes superan monto mensual promedio}
    function calcularPromedioMonto (sumaMontosTotal: real): real; 
    begin
      calcularPromedioMonto:= (sumaMontosTotal / cantClientes)
    end;
    function clientesSuperanMontoPromedio (v : vClientes; montoPromedio : real): integer; 
    var 
       i,cant: integer; 
    begin
        cant:= 0 ; 
        for i:= 1 to cantClientes do 
            if (v[i].montoMensual > montoPromedio) then 
                cant:= cant + 1; 

        clientesSuperanMontoPromedio:= cant;  
    end;    
    //--------------------------------------------------------------------------------
    { modulos para informar }
  {  procedure informarContratosPorMes ( v : vMeses); 
    var 
        i : integer; 
    begin
      for i:= 1 to cantMeses do 
        writeln ('En el mes ',i, ' se firmaron ',v[i], ' contratos.')
    end;}

    procedure informarClientesCategoria ( v : vCategoria); 
     var 
        i : char; 
     begin
        for i:= 'A' to 'F' do 
            writeln ('La cantidad de clientes de la categoria ',i, ' son: ',v[i]); 
     end;
    procedure informar_vTop (vTop : vTop10); 
    var 
        i : Integer; 
    begin
      writeln ('Los codigos de las 10 ciudades con mas clientes son: '); 
      for i := 1 to 10 do 
        writeln (i,' posicion con codigo de ciudad: ',vTop[i]);
    end;    


    //--------------------------------------------------------------------------------
    procedure procesarPrimeraVez (var vCli : vClientes ;  {var vTop : vTop10} var montoPromedio :real ) ; 
    var 
     vTop : vTop10; 
     vCat : vCategoria;
     //vCli : vClientes; 
     //vMes : vMeses; 
     vCiu : vCiudades; 
     sumaMonto : real; 
     anioActual,contratosAnio,AnioMasContratos,contratosMax: integer; 
     mesActual,contratosMes : integer;
     pos : integer; 
     begin
		    pos:= 1; 
        sumaMonto:= 0; montoPromedio:= 0; 
        AnioMasContratos:= 0; contratosMax:= -1;  contratosMes:= 0 ; 
        ini_vCategorias(vCat);  
        ini_vCiudades(vCiu); 
        while (pos < cantClientes) do 
            begin
            contratosAnio:= 0; 
      //      ini_vMeses(vMes); 
            anioActual:= vCli[pos].fechaFirma.anio;    
                while ( vCli[pos].fechaFirma.anio = anioActual ) do
                    begin
                      mesActual:= vCli[pos].fechaFirma.mes; 
                      contratosMes:= 0; 
                        while ((vCli[pos].fechaFirma.anio = anioActual) and (vCli[pos].fechaFirma.mes = mesActual)) do 
                            begin 
                      {incremento categoria}
                      vCat[vCli[pos].categoria]:=vCat[vCli[pos].categoria] + 1; 
                      {incremento cliente por ciudad}
                       vCiu[vCli[pos].codCiudad].cantClientes:= vCiu[vCli[pos].codCiudad].cantClientes + 1; 
                       {incremento contratos por anio}
                       contratosAnio:= contratosAnio + 1;
                       {incremento contratos por mes}
                       contratosMes:= contratosMes +1;   
                       {sumo el monto del cliente}
                       sumaMonto:= sumaMonto + vCli[pos].montoMensual;
                       {incremento pos}
                       pos:= pos + 1;  
                            end; 
                        writeln ('En el mes actual ',mesActual, ' se firmaron ',contratosMes, ' contratos.'); 
                    end;
                    {cuando salgo del while es porque procese un pais distinto}
                    {informo datos del pais anterior (paisActual)}
                    writeln ('En el anio ',anioActual, ' se firmaron ',contratosAnio, ' contratos.'); 
                    {calculo max anio contratos }
                    calcularMasContratos(anioActual,contratosAnio,AnioMasContratos,contratosMax);     
            end;
                    {informo anio con mas contratos}
                    writeln ('El anio con mas contratos es: ',AnioMasContratos); 
                    {informo cant clientes por categoria}           
                    informarClientesCategoria(vCat); 
                    {ordeno vector vCiu por cantClientes de mayor a menor}
                    ordenarClientesMayorMenor(vCiu); 
                    {cargo, e informo vTop10 (ciudades con mas cant de clientes)}
                    cargarTop10(vCiu,vTop); 
                    informar_vTop(vTop);     

                    montoPromedio:= calcularPromedioMonto (sumaMonto);
     end;

    procedure procesarSegundaVez (vCli : vClientes; montoPromedio : real); 
    begin
     writeln ('Los clientes que superan el monto promedio son: ',clientesSuperanMontoPromedio(vCli,montoPromedio));  
    end;

    { programa principal }
    var 
    vCli : vClientes; 
    promedioMonto : real; 
    begin
      cargarVector(vCli); 
      procesarPrimeraVez(vCli,promedioMonto);
      procesarSegundaVez(vCli,promedioMonto)
    end.
