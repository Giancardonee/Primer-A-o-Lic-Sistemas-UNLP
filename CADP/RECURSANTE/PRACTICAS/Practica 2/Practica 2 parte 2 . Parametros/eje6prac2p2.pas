{6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio}
program seis; 
const 
 cant_productos = 5;  // Lo ideal seria poner 100. Pero para ver si el codigo es correcto usamos 5 (despues cambiamos)
 
 procedure LeerDatos (var precio: real; var codigo: integer; var tipo: string); 
  begin
 
   write ('Ingrese el codigo del producto: '); 
    readln(codigo); 
   write('Ingrese el precio: '); 
    readln(precio);  
    write('Ingrese el tipo de producto (Pantalon, remera, camisa, medias,campera): ') ; 
     readln(tipo); 
 
  end; 

procedure pantalonCaro(precio: real; tipo: string; codigo : integer; var maxPrecioPantalon: real; var codPantalonMax: integer); 
 begin
   if (tipo = 'pantalon') and (precio > maxPrecioPantalon) then 
     begin
         maxPrecioPantalon:= precio; 
         codPantalonMax:= codigo; 
     end; 
 end;

procedure prod2_MasBaratos (codigo: integer; precio: real; var min1,min2: real; var codMin1,codMin2: integer); 
 begin
    if (precio < min1) then 
      begin
       min2:= min1; 
       min1:= precio; 
       codMin2:= codMin1; 
       codMin1:= codigo; 
      end
     else if (precio < min2) then 
      begin
        min2:= precio; 
        codMin2:= codigo; 
      end;  
 end; 

function calcularPromedio (sumaPrecios: real): real; 
 begin
   calcularPromedio:= (sumaPrecios/cant_productos); 
 end; 
 
 
 // programa principal 
 
 var
 min1,min2,maxPrecioPantalon,precio,promedio,sumaPrecios: real; 
 codigo,codMin1,codMin2,codPantalon,i : integer; 
 tipo_producto: string; 
 begin
 min1:= 29999; 
 min2:= 29999; 
 maxPrecioPantalon:= -1; 
 sumaPrecios:= 0; 
 codMin1:= 0; 
 codMin2:= 0; 
 codPantalon:= 0 ; 
   for i:= 1 to cant_productos do 
     begin
        LeerDatos(precio,codigo,tipo_producto); 
        sumaPrecios:= sumaPrecios + precio; 
        PantalonCaro(precio,tipo_producto,codigo,maxPrecioPantalon,codPantalon); 
        prod2_MasBaratos(codigo,precio,min1,min2,codMin1,codMin2); 
       writeln; 
     end; 
   
   promedio:= (calcularPromedio(sumaPrecios)); 
   writeln ('El precio promedio es de: $',promedio:2:2); 
   writeln ('El codigo del pantalon mas caro es: ',codPantalon); 
   writeln ('El codigo de los dos productos mas baratos son: '); 
    writeln (' ( 1 ) ',codMin1); 
    writeln (' ( 2 ) ',codMin2); 

 end. 
 
