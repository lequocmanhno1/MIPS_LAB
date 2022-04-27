.text
 li $s0,12 			# So bi nhan s0 = 12
 li $s1,16 			# so nhan s1 = 16
 li $t0,0 			# bien dem
 li $t1,1
dich:
 srl $s1,$s1,1 		# dich phai 1 bit
 addi $t0, $t0,1 	# tang bien dem them 1
 bne $s1,$t1 ,dich 	# so sanh so nhan sau khi dich phai voi 1
 sllv $s0,$s0,$t0 	# dich trai so bi nhan voi so bit la luy thua 2 cua so