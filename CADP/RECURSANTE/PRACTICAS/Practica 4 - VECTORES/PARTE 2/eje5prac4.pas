

program cinco; 
const 
    cantClientes = 5; 
      maxCiudades = 2400;
type 
    rangoCat = 'A'..'F'; 
    rangoCodCiudad = 1..2400; 

    fecha = record 
        mes:integer;
        anho:integer; 
    end; 

    cliente = record 
        fechaFirma : fecha;
        Categoria: rangoCat;              
        codCiudad: rangoCodCiudad; //vClientesCiudad 
        montoMensual: real ;
    end; 
{ necesito 3 vectores: 1) Almacenar datos de clientes, 2)ContadorCategorias, 3) vCiudades }
 vClientes = array [1..cantClientes] of cliente; { sabemos que debemos procesar 500 clientes (se dispone la informacion) }
 vContadorCategorias = array ['A'..'F'] of integer; // Debo inicializar contador en 0 
 vClientesCiudad = array [1..2400] of integer;  // Debo inicializar cada posicion en 0 tambien.
 v10CiudadesTop = array [1..10] of integer;
//----------------------------------------------------------------------------------------------------


{inicializo los vectores contadores}
//----------------------------------------------------------------------------------------------------
procedure InicializarVectores (var vCategorias : vContadorCategorias; var vCiudad : vClientesCiudad ); 
var 
i : char; 
i2 : integer; 
begin
    // Inicializo Vector de categorias 
    for i:= 'A' to 'F' do 
        vCategorias[i]:= 0; 

    //Inicializo vector de clientes por ciudad
    for i2:= 1 to 2400 do 
        vCiudad[i2]:= 0;
end;
//----------------------------------------------------------------------------------------------------


{procedimientos para Leer datos de clientes y cargar el vector con los datos. }
//----------------------------------------------------------------------------------------------------
procedure LeerFecha (var f : fecha);
begin
    write ('Ingrese el anho: '); readln (f.anho); 
    write ('Ingrese el mes: '); readln (f.mes); 
end;

procedure LeerCliente (var  c : cliente); 
var 
 f : fecha; 
begin 
    LeerFecha(f);
    c.fechaFirma:= f ; 
    write ('Ingrese la categoria ( A hasta F ): '); readln (c.Categoria);
    write ('Ingrese el codigo de ciudad: (entre 1 y 2400) '); readln (c.codCiudad); 
    write ('Ingrese el monto mensual: '); readln (c.montoMensual);
end;

procedure cargarVectorCliente (var vCliente: vClientes); 
var
i : integer; 
c : cliente;
begin

  for i:= 1 to cantClientes do 
    begin
        LeerCliente(c); 
        vCliente[i]:= c ; 
    end;
end;
//----------------------------------------------------------------------------------------------------


{ cargo vector con cantClientes por ciudad }
//----------------------------------------------------------------------------------------------------
procedure incrementarClienteCiudad (var vCiudad : vClientesCiudad; nroCiudad : integer); 
begin
    if ( (nroCiudad>= 1 ) and (nroCiudad<=2400) ) then 
        vCiudad[nroCiudad]:= vCiudad[nroCiudad] + 1;
end;

procedure cargarTop10Ciudades (var codigos_top_10 : v10CiudadesTop; var vCiudad : vClientesCiudad); 
var 
i,j,temp : integer; 
begin
  for i:= 1 to 10 do 
    begin
      temp:= 0; 
        for j:= i to maxCiudades do 
            begin
                if (vCiudad[j] > vCiudad[temp]) then 
                    temp:= j 
            end;
        codigos_top_10[i]:= temp; 
        vCiudad[temp]:= -1; // marco la ciudad ya seleccionada para no volverla a procesar
    end;
end;


procedure imprimir10ciudadesMasClientes (codigos_top_10 : v10CiudadesTop); 
var 
i : integer; 
vCiudad: vClientesCiudad; 
begin
cargarTop10Ciudades(codigos_top_10,vCiudad);
writeln ('Los codigos de las 10 ciudades con mayor cantidad de clientes son: ');
  for i:= 1 to 10 do 
        begin
            writeln (i, ' Ciudad con codigo: ',codigos_top_10[i]); 
        end; 
end;

//----------------------------------------------------------------------------------------------------



{ cargo vector con cantidad de clientes para cada categoria }
//----------------------------------------------------------------------------------------------------
procedure incrementarCategoria (var vCategoria : vContadorCategorias; categoria: char); 
begin
        case categoria of  
                'A': vCategoria['A']:= vCategoria['A'] + 1 ; 
                'B': vCategoria['B']:= vCategoria['B'] + 1 ; 
                'C': vCategoria['C']:= vCategoria['C'] + 1 ; 
                'D': vCategoria['D']:= vCategoria['D'] + 1 ; 
                'E': vCategoria['E']:= vCategoria['E'] + 1 ; 
                'F': vCategoria['F']:= vCategoria['F'] + 1 ; 
            end; 

            {otra opcion creo que seria:
                
                vCategoria[categoria]:= vCategoria[categoria] + 1; 
            
             }
end;

procedure informarClientesPorCategoria (vCategoria : vContadorCategorias); 
var 
cat : Char; 
begin
     for cat:= 'A' to 'F' do 
        writeln ('En la categoria ',cat, ' se encuentran ',vCategoria[cat], ' clientes.'); 
end;
//----------------------------------------------------------------------------------------------------


//d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.
//----------------------------------------------------------------------------------------------------
function superaMontoPromedio (salarioCliente,montoPromedio : real): boolean; 
begin
  superaMontoPromedio:= (salarioCliente > montoPromedio); 
end;

{ Estos dos procesos los hago para calcular la cantidad de clientes que superan el salario promedio }
                    { lo invoco en el modulo procesarVector }
                    
procedure ClientesSuperanMontoPromedio (var cant : integer; montoPromedio : real; vCliente: vClientes);  
var 
i : integer;
begin
    for i:= 1 to cantClientes do 
        if (superaMontoPromedio(vCliente[i].montoMensual,montoPromedio)) then
            cant:= cant + 1;
end;
//----------------------------------------------------------------------------------------------------


{ calculo el año con mas contratos }
{a. año en que se firmó la mayor cantidad de contratos}
//----------------------------------------------------------------------------------------------------
 procedure calcularAnhoMasContratos(var max : integer; var anhoMax : integer; cantContratos:integer;anho:integer); 
    begin
        if (cantContratos > max) then 
            begin
                max:= cantContratos; 
                anhoMax:= anho;
            end;
    end;
//----------------------------------------------------------------------------------------------------

{informo los vectores vCategorias y código de las 10 ciudades con mayor cantidad de clientes}
//----------------------------------------------------------------------------------------------------
procedure informarVectores (vCategoria : vContadorCategorias; vCiudad : v10CiudadesTop); 
begin
    informarClientesPorCategoria (vCategoria); 
    imprimir10ciudadesMasClientes(vCiudad);
end;

//----------------------------------------------------------------------------------------------------
procedure procesarVector (var vCategoria: vContadorCategorias; var vCiudad : vClientesCiudad; vCliente: vClientes); 
var 
max,anhoMax, contratosAnho, anhoActual,mesActual: integer; 
clientesSuperan_MontoPromedio,contratosMes: integer;
montoPromedio: real; 
i : integer; 
begin 
i:= 1; 
max:= -1; 
anhoMax:= 0000;
montoPromedio:= 0; 
clientesSuperan_MontoPromedio:= 0; 
contratosAnho:= 0;
contratosMes:= 0;
anhoActual:= vCliente[i].fechaFirma.anho;
mesActual:= vCliente[i].fechaFirma.mes; 
while (i <= cantClientes) do 
                begin 
                                {si el anio es el mismo al anhoActual}
                                if (vCliente[i].fechaFirma.anho = anhoActual) then
                                begin
                                        //incrementoContratosAnio
                                        contratosAnho:= contratosAnho + 1 ;  

                                        {si el mes es el mismo al mesActual}
                                        if (vCliente[i].fechaFirma.mes = mesActual) then 
                                            //IncrementoContratosMes
                                            contratosMes:= contratosMes + 1
                                        {sino el mes es diferente}
                                        else 
                                            begin 
                                                //informo los contratos del mes
                                                writeln ('Los contratos del mes ',mesActual, ' son: ',contratosMes);
                                                //inicializoContratosMes:= 0
                                                contratosMes:= 0;
                                                //actualizoMesActual
                                                mesActual:=vCliente[i].fechaFirma.mes; 
                                                
                                            end;
                                    end
                                {sino el anio es diferente}
                                else 
                                    begin
                                    //calculo anho con mas contratos. 
                                    calcularAnhoMasContratos(max,anhoMax,contratosAnho,anhoActual); 
                                    //informoCantidadContratosAnho
                                    writeln ('Los contratos del anho ',anhoActual, ' son: ',contratosAnho); 
                                    //inicializoContratosAnho:= 0; 
                                    contratosAnho:= 0;
                                    //actualizo AnhoActual
                                    anhoActual:= vCliente[i].fechaFirma.anho; 
                                    end;

                            { esto lo haria siempre por cada persona }
                            incrementarCategoria(vCategoria,vCliente[i].categoria); 
                            incrementarClienteCiudad(vCiudad,vCliente[i].codCiudad);
                            montoPromedio:= montoPromedio + vCliente[i].montoMensual;
                            i:= i + 1 ; {avanzo a la siguiente posicion del vector}
                    end;

        {deberia terminar de procesar TODO}
        montoPromedio:= (montoPromedio / cantClientes); 
        ClientesSuperanMontoPromedio(clientesSuperan_MontoPromedio,montoPromedio,vCliente);

        // Informo. {podria hacer otro modulo... }
        writeln; //salto de linea
        writeln ('El anho que se firmaron mas contratos es el anho: ',anhoMax, ' com una cantidad de: ',max, ' contratos.'); 
        writeln ('La cantidad de clientes que superan el monto mensual promedio son: ',clientesSuperan_MontoPromedio); 
        informarVectores(vCategoria,vCiudad); 
    end; 







{programa principal}
var 
vCliente : vClientes; 
vCiudad :  vClientesCiudad; 
vCategoria : vContadorCategorias; 
begin
InicializarVectores(vCategoria,vCiudad);
cargarVectorCliente(vCliente); 
procesarVector(vCategoria,vCiudad,vCliente);
end.
    



