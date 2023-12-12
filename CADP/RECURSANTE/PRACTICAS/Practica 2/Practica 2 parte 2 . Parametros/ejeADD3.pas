{3. Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par. }

program ejeADD3; 
type 
 rangoCodigo = 1..1200; 
 const
  cantProductos = 200;  

function codigoPar (codigo:rangoCodigo): boolean; 
begin
 codigoPar:= ( (codigo MOD 2 ) = 0) ; 
end; 

function mayor16Pesos_codPar (precio:real; codigo:rangoCodigo):boolean; 
begin
   if (codigoPar(codigo) and (precio > 16)) then 
     mayor16Pesos_codPar:= True
    else 
      mayor16Pesos_codPar:= False; 
end;

procedure LeerDatosProductos (var codigo:rangoCodigo; var precio:real; i:integer); 
begin
 write('Ingrese codigo del producto ' ,i, ' : '); 
  readln(codigo); 
 write('Ingrese precio del producto '  ,i, ' : '); 
   readln(precio); 
   
   writeln; // salto de linea para que quede mas fachero
end; 

procedure productos_2_baratos (codigo:rangoCodigo; precio: real; var precioMin1,precioMin2: real; var codMin1,codMin2:rangoCodigo); 
begin
 if (precio < precioMin1) then 
   begin
     precioMin2:= precioMin1; 
     precioMin1:= precio;
     codMin2:= codMin1; 
     codMin1:= codigo; 
   end
 else if ( precio < precioMin2 ) then 
   begin
     precioMin2:= precio; 
     codMin2:= codigo; 
   end; 
end; 

var
i,cant_prodMayor16_CodPar: integer; 
codigo,codMin1,codMin2: rangoCodigo; 
precio,precioMin1,precioMin2: real; 
begin
cant_prodMayor16_CodPar:= 0 ; 
codMin1:= 1 ; 
codMin2:= 1 ; 
precioMin1:= 32000; 
precioMin2:= 32000;
 for i:= 1 to cantProductos do 
   begin
         LeerDatosProductos(codigo,precio,i); 
         productos_2_baratos(codigo,precio,precioMin1,precioMin2,codMin1,codMin2); 
         if (mayor16Pesos_codPar(precio,codigo) ) then 
           cant_prodMayor16_CodPar:= cant_prodMayor16_CodPar + 1 ;
   end; 
   writeln ('Los codigos de los productos mas baratos son: '); 
    writeln ('   ( 1 ) codigo: ',codMin1, ' con un total de: $',precioMin1:2:2); 
    writeln ('   ( 2 ) codigo: ',codMin2, ' con un total de: $',precioMin2:2:2); 
    writeln ('---> La cantidad de productos con costo mayor a 16 pesos y codigo par son: ',cant_prodMayor16_CodPar);   
end.

