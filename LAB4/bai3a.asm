.data
x: .word 0x12
.text
lw $s1,x 					# $s1=x
# lay gia tri tuyet doi
xori $s0, $s1, 0xfffffff 	# lay phan bu mot cua s1
addi $s0,$s0,1 				# Them 1 => t1 + 1 = s1 gia tri tuyet doi
