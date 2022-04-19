.data
n: .word 6
A: .word 4, 6, 2, 0, -8, -9

.text

la $s2, A		# $s0 = A[0]'s address
lw $s3, n		# $s3 = n
addi $s1, $zero, 0 # i = 0
addi $s4, $zero, 0 # max = 0

loop: 
slt $t2, $s1, $s3 # $t2 = i < n? 1 : 0
beq $t2, $zero, endloop 
add $t1,$s1,$s1  # $t1=2*$s1
add $t1,$t1,$t1  # $t1=4*$s1 
add $t1,$t1,$s2  # $t1 store the address of A[i]
lw $t0,0($t1)    # load value of A[i] in $t0
addi $s1,$s1,1   # i=i+1
slt $t2, $t0, $zero # $t2 = $t0 < 0? 1 : 0
beq $t2, $zero, sosanh  
sub $t0, $zero, $t0
sosanh:
slt $t3, $s4, $t0 # $t3 = max < A[i]? 1 : 0
beq $t3, $zero, maxkdoi 
addi $s4, $t0, 0  # max = A[i]
maxkdoi:
j loop #goto loop
endloop:
