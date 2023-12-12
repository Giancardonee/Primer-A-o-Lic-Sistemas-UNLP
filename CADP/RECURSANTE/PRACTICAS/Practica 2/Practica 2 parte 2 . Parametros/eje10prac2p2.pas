{10. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program diez; 
const 
 signoPesos = '$'; 
 hashtag = '#'; 
function esVocal (c:char): boolean; 
 begin
 esVocal := (c = 'A') or (c = 'E') or (c = 'I') or (c = 'O') or (c = 'U') 
or (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u');  
 end;  

function esAlfabetico_sinVocales (c: char): boolean; 
begin
 esAlfabetico_sinVocales:= ( (( c >= 'A' ) and (c <= 'Z') and (not esVocal(c)))  or  ((c >= 'a') and (c <= 'z') and (not esVocal(c)) )) ;  
end; 
 
 function secuenciaVocales:boolean; 
 var
 c: char; 
 ok: boolean; 
 begin
 ok:= True; 
 write('Ingrese un caracter: '); 
 readln(c); 
  while ( (esVocal (c)) and (c <> signoPesos) ) do 
    begin
       write('Ingrese un caracter: ');
        readln(c); 
          if (not esVocal(c)) and ( c <> signoPesos )then 
            ok:= False; 
    end;   
 
 secuenciaVocales:= ok; 
 end; 
 
 function secuenciaAlfabetica_sinVocales: boolean; 
 var
 c: char; 
 ok: boolean; 
 begin
 ok:= True; 
  write ('Ingrese un caracter: '); 
   readln(c); 
     while ( (esAlfabetico_sinVocales(c))  and (c <> hashtag) ) do 
        begin
             write ('Ingrese un caracter: '); 
              readln(c); 
                 if (not esAlfabetico_sinVocales(c)) and (c <> hashtag)then 
                    ok:= False; 
        end;  
    secuenciaAlfabetica_sinVocales:= ok ;  
 end; 
 
 
 var 
 cumpleA,cumpleB: boolean ; 
 begin
cumpleA:= secuenciaVocales(); 
 if ( cumpleA ) then 
   begin
      cumpleB:= secuenciaAlfabetica_sinVocales();   
          if (cumpleB) then 
            writeln ('Se cumplieron ambos patrones ( A y B )')
         else
             writeln ('NO se cumplio el patron B ( se ingreso un caracter alfabetico que es Vocal )'); 
          
   end 
else 
   writeln ('ERROR en el patron A ( un caracter ingresado no era vocal )') ; 
 
 end.
