 # SUBRUTINAS MIPS

 LO PRIMERO QUE TENEMOS QUE HACER SI SABEMOS QUE TENEMOS QUE USAR MAS DE UNA SUBRUTINA ES, GUARDAR ESPACIO PARA USAR LA PILA

 daddi $sp, $sp, 0x400 ; reservo espacio para usar la pila


SUBRUTINA_1:    daddi $sp, $sp, -8  ;ESTO ES LO MISMO QUE HACER UN PUSH
                sd $ra,0 ($sp);ESTO ES LO MISMO QUE HACER UN PUSH

                JAL SUBRUTINA_2
        #SALVAMOS EL ESTADO DEL $RA (DIRECCION DE RETORNO )
            #CUANDO RETORNAMOS DE SUBRUTINA_2, RETORNAMOS ACA
            #Y HACEMOS EL POP PARA OBTENER LA DIRECCION DE RETORNO
                ld $ra,0 ($sp)   ;ESTO ES LO MISMO QUE HACER UN POP
                daddi $sp, sp, 8 ;ESTO ES LO MISMO QUE HACER UN POP
                jr $ra ; retorno correctamente al programa
