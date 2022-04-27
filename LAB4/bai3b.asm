.data
x: .word 0x12
.text
lw $s1,x 					# $s1=x
# get gia tri cua s1
andi $s0, $s1, 0xfffffff 	# lay gia tri $s0 = $s1