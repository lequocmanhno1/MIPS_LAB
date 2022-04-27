.data
x: .word 0x12
y: .word 0x3
z:
.text
lw $s1,x 			# $s1=x
lw $s2,y 			# $s2=y
# So sanh 2 so s1 <= s2 jump to label
slt $t3,$s2,$s1 	# so sanh t3 = s2<s1 ? 1:0
beqz $t3, label
label: