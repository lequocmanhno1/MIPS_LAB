.data
x: .word 0x12
.text
lw $s1,x 					# $s1=x
# lay not cua s1
xori $s0, $s1, 0xfffffff 	# Dao nguoc bit