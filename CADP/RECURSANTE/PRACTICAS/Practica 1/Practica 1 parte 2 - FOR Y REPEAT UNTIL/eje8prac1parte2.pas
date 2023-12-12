{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.}

program ocho; 
var
i,max,diaMax,cantVentasDia: integer; 
monto,montoDia, montoMes: real; 
begin
max:= -1; 
diaMax:= -1 ; 
montoMes:= 0; 
    for i:= 1 to 3 do 
        begin
           montoDia:= 0; 
           cantVentasDia:= 0 ;
             write('Ingrese el monto del dia ',i, ': '); 
               readln (monto); 
                 while ( monto <> 0 ) do
                        begin 
                        cantVentasDia:= cantVentasDia + 1 ; 
                        montoDia:= montoDia + monto; 
                           
							   if ( cantVentasDia > max )then 
									begin
									  max:= cantVentasDia; 
									  diaMax:= i ; 
									end; 
                      
                     write('Ingrese el monto del dia ',i, ': '); 
                         readln (monto); 
                        end;  // fin del while        
   writeln; // salto de linea          
                montoMes:=montoMes + montoDia; 
                writeln ('---> La cantidad de ventas del dia ',i, ' son: ',cantVentasDia);              
   writeln; // salto de linea          
        end; // fin del for
      writeln (' - - - - - - - - - - - - - - - - - - - - - - - - - - - -') ; 
    writeln('---> El monto total de todo el mes es de: ',montoMes:1:2); 
    writeln('El dia que se realizaron la mayor cantidad de ventas fue el dia: ',diaMax, ' con un total de: ',max, ' ventas');  
end. 
