# A[i] != 0 thì l?p, == 0 thì d?ng
.data
sum: .word 0
n: .word 5
step: .word 1
A: .word 3, -16, 9, 0, 11

.text
# load variable

la $s2, A		     # $s0 = A[0]'s address
lw $s3, n		     # $s3 = n
lw $s4, step		    # $s4 = step = 1
addi $s5, $zero, 0      #sum = 0 
addi $s1, $zero, 0      #i = 0
loop: 
add $t1, $s1, $s1    # $t1=2*$s1
add $t1, $t1, $t1    # $t1=4*$s1 
add $t1, $t1, $s2    # $t1 store the address of A[i]
lw $t0, 0($t1)        # $t0 = A[i]
beq $t0, $zero, endloop 
beq $s1, $s3, endloop  
add $s5, $s5,$t0  #sum=sum+A[i]
add $s1, $s1, $s4  #i=i+step
j loop                  #goto loop
endloop:
sw $s5, sum	# $s5 = sum
