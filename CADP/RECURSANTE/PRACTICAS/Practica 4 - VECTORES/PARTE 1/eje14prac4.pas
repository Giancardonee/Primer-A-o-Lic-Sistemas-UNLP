{ El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO                  ROL DEL DESARROLLADOR                 VALOR/HORA (USD)
1                       Analista Funcional                        35,20
2                       Programador                               27,45
3                       Administrador de bases de datos           31,03
4                       Arquitecto de software                    44,28
5                       dministrador de redes y seguridad         39,87


Realizar un programa que procese la información de los desarrolladores que participaron en 
los 1000 proyectos de software más activos durante el año 2017. De cada participante se conoce 
su país de residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó,
 el rol que cumplió en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. 
 La lectura finaliza al ingresar el código de proyecto -1, que no debe procesarse.
  Al finalizar la lectura, el programa debe informar:
  a) El monto total invertido en desarrolladores con residencia en Argentina.
  b) La cantidad total de horas trabajadas por Administradores de bases de datos.
  c) El código del proyecto con menor monto invertido.
  d) La cantidad de Arquitectos de software de cada proyecto.}

  program catorce; 
  const 
    dimFproyectos = 1000;
    PrecioHora_cod1 = 35.20;
    PrecioHora_cod2 = 27.45;
    PrecioHora_cod3 = 31.03;
    PrecioHora_cod4 = 44.28;
    PrecioHora_cod5 = 39.87;
  type 
    rangoCodigoProyecto = 1.1000;
    rangoCodigoRol = 1..5; 
    str20 = string[20];
    rParticipante = record 
        paisResidencia : str20;
        codProyecto : rangoCodigoProyecto;
        nombreProyecto : str20;
        Rol : rangoCodigoRol; 
        cantHoras : real; {pongo real por si alguno trabaja 3.5 hs por ejemplo}
    end; 
    vParticipantes = array [rangoCodigoProyecto] of rParticipante;

procedure cargarVector (var v : vParticipantes; var dimL : integer);
var
codigoProyecto : rangoCodigoRol; 
begin
    DimL:=0;
    write ('Ingrese el codigo del proyecto: '); readln (codigoProyecto); 
    while ((codigoProyecto <> -1) and (DimL <= dimFproyectos)) do 
        begin
            DimL:= DimL + 1;
            v[DimL].codProyecto:= codigoProyecto; 
            write('Ingrese el pais de residencia: '); readln(v[DimL].paisResidencia); 
            write('Ingrese el nombre del proyecto: '); readln (v[DimL].nombreProyecto); 
            write('Ingrese el rol que cumplio en el proyecto (1 al 5): '); readln(v[DimL].Rol);
            write('Ingrese la cantidad de horas trabajadas: '); readln (v[DimL].cantHoras);    
        end; 
end;

{ a) El monto total invertido en desarrolladores con residencia en Argentina.}
{funcion que devuelva True si el desarrollador es de residencia Argentina}
{ se le pasa como parametro vParticipantes[i].paisResidencia}
function esResidenciaArgentina (residencia : str20): boolean; 
begin
  esResidenciaArgentina:= (residencia = 'Argentina'); 
end;



{b) La cantidad total de horas trabajadas por Administradores de bases de datos.}
function esAdministradorBaseDeDatos (codigo : integer): boolean ; 
begin
  esAdministradorBaseDeDatos:= (codigo = 3);
end;
{c) El código del proyecto con menor monto invertido.}
function MontoInvertido (codigo : rangoCodigoRol; hsTrabajadas : real): real; 
var
resultado : real; 
begin
  case codigo of 
    1 : resultado:= (hsTrabajadas * PrecioHora_cod1);
    2 : resultado:= (hsTrabajadas * PrecioHora_cod2); 
    3 : resultado:= (hsTrabajadas * PrecioHora_cod3);
    4 : resultado:= (hsTrabajadas * PrecioHora_cod4);
    5 : resultado:= (hsTrabajadas * PrecioHora_cod5); 
    end; 
  MontoInvertido:= resultado;   
end;

procedure codProyectoMenorMontoInvertido (codigo: rangoCodigoProyecto; hsTrabajadas : real; var min1 : real; var CodMin:rangoCodigoProyecto );
var
monto : real ; 
begin
    monto:= MontoInvertido(codigo,hsTrabajadas);
    if (monto < min) then 
        begin
           min:= monto; 
           CodMin:= codigo;
        end; 
end;


  c) El código del proyecto con menor monto invertido.
  d) La cantidad de Arquitectos de software de cada proyecto.}

