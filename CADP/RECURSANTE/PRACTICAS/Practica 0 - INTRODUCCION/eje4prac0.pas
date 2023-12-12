{4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro).
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2).}

program cuatro; 
Const
Pi = 3.1415; 
var
Diametro,radio,area,perimetro: real; 
begin
write ('Ingrese un diametro: '); 
readln(Diametro); 

// a 
radio:= (Diametro / 2); 

// b 
{se puede elevar de otras formas (usando un for)}
area:= (Pi *(radio *radio)); 

// c 
perimetro:= (Diametro * Pi); 


writeln('---> El radio del circulo es: ',radio:1:2); 
writeln('---> El area del circulo es: ',area:1:2); 
writeln('---> El perimetro del circulo es: ',perimetro:1:2); 

end.
