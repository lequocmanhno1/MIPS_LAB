.data
A: .word 2,12,0,-1,-12,19
.text
la $a1,A
addi $s1,$zero,0 # i=0
addi $s2,$zero,7 # n=7
sll $s1,$s1, 2
add $s1, $s1, $a1 #dia chi cua A[0]
sll $s2,$s2, 2
add $s2, $s2, $a1 #dia chi cua A[n-1]
loop1:
slt $t0,$s1,$s2 #$t0=1 if i<n
beq $t0,$0,done1 #$t0=0 thi thoat loop1
addi $s3,$s2,-4 #j=n-1
loop2:
slt $t0,$s1,$s3 #$t0=1 if i<j
beq $t0,$0,done3 #$t0=0 thi thoat loop2
lw $t1,0($s3) #$t1=A[j]
lw $t2,-4($s3) #$t2=A[j-1]
slt $t0,$t1,$t2 #$t0=1 if A[j]<A[j-1]
beq $t0,$0,done2 #$t0=0 thi ko swap
sw $t1,-4($s3) #A[j-1]=A[j]
sw $t2,0($s3) #A[j]=A[j-1]
done2:
addi $s3,$s3,-4 #j=j-1
j loop2
done3:
addi $s1,$s1,4 #i=i+1
j loop1
done1: