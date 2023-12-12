.data
A:   .double 3.0
B:   .double 4.0
C:   .double 7.0
D:   .double 11.0
RES1:  .double 0.0
RES2:  .double 0.0
.code
l.d f0, A ($zero)
l.d f1, B ($zero)
l.d f2, C ($zero)
l.d f3, D ($zero)

add.d f4, f0,f1
mul.d f5, f2,f3
l.d f5, RES1($zero)
l.d f4, RES2($zero)

halt
