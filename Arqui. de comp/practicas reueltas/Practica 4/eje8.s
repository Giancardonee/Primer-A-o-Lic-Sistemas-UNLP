#el siguiente programa multiplica dos numeros a traves
#de sumas repetitivas.

#Delay_Slot y Forwarding HABILITADO
#r1 = num1 || r2 = num2 || r4 = res

#CPI = 1.167 |||| 0 ATASCOS :)

.data
num1: .word 3
num2: .word 5
res:  .word 0
.code
ld r1, num1(r0)
ld r2, num2(r0)
daddi r4, r4, 0
loop: daddi r2, r2, -1 # dec r2
      dadd r4, r4,r1 # sumo res + num1
      bnez r2, loop
      sd r4, res(r0)
halt

