# sum >= 0
.data
sum: .word 0
n: .word 5
step: .word 1
A: .word 6, 7, -3, -20, 22   

.text
# load variable

la $s2, A		  # $s0 = A[0]'s address
lw $s3, n		  # $s3 = n
lw $s4, step		  # $s4 = step = 1
addi $s5, $zero, 0    #sum = 0 
addi $s1, $zero, 0    #i = 0
loop: 
bltz $s5, endloop
beq $s1, $s3, endloop
add $t1, $s1, $s1      #$t1=2*$s1
add $t1, $t1, $t1       #$t1=4*$s1 
add $t1, $t1, $s2       #$t1 store the address of A[i]
lw $t0, 0($t1)            #$t0 = A[i] 
add $s5, $s5, $t0       #sum=sum+A[i]
add $s1, $s1, $s4      #i=i+step
j loop         #goto loop
endloop:
sw $s5, sum	# $s5 = sum
