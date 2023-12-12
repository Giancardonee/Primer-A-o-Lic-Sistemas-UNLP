#Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos son mayores que X.
#El resultado debe almacenarse en una dirección etiquetada CANT. El programa debe generar además otro arreglo llamado RES
#cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero correspondiente en el arreglo TABLA es mayor que X,
#mientras que un ‘0’ indicará que es menor o igual.

#EN ESTE EJEMPLO X = 7
    .data
    LONG: .word 10
    num:  .word 7
    CANT: .word 0
    TABLA:.word 0,1,2,3,4,5,6,7,8,9,10
    RES:  .word 0,0,0,0,0,0,0,0,0,0,0
    .code
    daddi r1,r1,0
    ld r2,LONG (r0)
    ld r7,num(r0)
    ld r10,CANT(r0)
    daddi r4, r0, 1
    loop:       ld r3, TABLA(r1) # me traigo el valor de TABLA
                daddi r2,r2, -1  # dec long
    comparar:   slt r5, r7,r3    # r5 = 1 si es menor , r5 = 0 si r3 es mayor
                bnez r5, ES_MAYOR
                daddi r6,r0, 0
                sd r6,RES(r1)
                daddi r1,r1,8 #avanzo a sig posicion
   volver:      bnez r2 loop

                 halt


    ES_MAYOR: daddi r10, r10, 1 # inc cant de mayores
              #r4 vale 1
              sd r4,RES(r1)
              daddi r1, r1,8
              j volver






