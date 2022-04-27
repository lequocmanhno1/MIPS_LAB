.data
x: .word 0x7fffffff
y: .word 0x12
.text
lw $s1, x 				# $s1 = x
lw $s2, y 				# $s2 = y
start:
li $t0,1 				# Overflow is default status
addu $s3,$s1,$s2 # s3 = s1 + s2
xor $t1,$s1,$s2 		# Test if $s1 and $s2 have the same sign
bltz $t1, Notoverflow 	# If not, NOTOVERFLOW
xor $t2,$s3,$s2 		# Test if $s3 and $s2 have the same sign
bltz $t2,Exit 			# If not, exit
Notoverflow:
li $t0,0 				# the result is no overflow
Exit: