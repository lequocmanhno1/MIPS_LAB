# i + j > m + n
.data
ii: .word 4
jj: .word 4
m: .word 4
n: .word 3
x: .word 5
y: .word 6
z: .word 7


.text
lw $s0, ii	# $s0 = i
lw $s1, jj	# $s1 = j
lw $s5, m 	# $s5 = m
lw $s6, n	# $s6 = n
lw $s2, x	# $s2 = x
lw $s3, y 	# $s3 = y
lw $s4, z	# $s4 = z

start:
add $t1, $s0, $s1      # St1 = i + j
add $t2, $s5, $s6      # $t2 = m + n
slt $t0, $t2, $t1	# if(i + j > m + n) $t0 = 1
			# else $t0 = 0
beqz $t0, else		# if($t0 != 0) skip to else
addi $s2, $s2, 1	# x++
addi $s4, $zero, 1	# z = 1
j endif			# jump to endif (skip else)
else:
addi $s3, $s3, -1	# y--
add $s4, $s4, $s4	# z *=2
endif:
