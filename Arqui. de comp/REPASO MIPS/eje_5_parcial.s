.data
tabla1:   .double 12.0,15.5,31.2,56.4,44.3,78.1
min:      .double 20.0
max:      .double 6
cant:     .word 0
res:      .word 0.0

.text
LD $t0, cant($zero)
l.d f1, min ($zero)
l.d f2, max ($zero) #___________
daddi $t3, $zero, 0
daddi $t4, $zero, 0
daddi $t5, $zero, 0

loop: l.d f2, tabla1 $t5)
     c.lt.d f3, f1
     bc1t fuera
     c.lt.d f2, f3
     bc1t fuera

     daddi $t3, $t3,1
     s.d f3, tabla2 ($t5)
     daddi $t5, $t5,8 # ________

fuera: daddi $t4, $t4, 8
       daddi $t0, $t0, -1
       bnez  $t0, loop
       sd $t3, res($zero)

       halt
