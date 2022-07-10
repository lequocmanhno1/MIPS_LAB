.data
	string:		.space	100
	end_string:	.space	100						#FIX
	check:		.asciiz	"ffffffffffffffffffffffffff"
	Message:	.asciiz "Chuong trinh dem so ki tu cua mot xau"
	InputMess:	.asciiz	"Xau cho la: "
	OutputMess1:	.asciiz	"Ket qua: \n differentSymbolsNaive(s)= "
	OutputMess2:	.asciiz "Cac ki tu xuat hien la: "
.text
main:
		li	$v0, 55		
		la	$a0, Message
		li	$a1, 1
		syscall	
		# Hien thong bao Chuong trinh
		
		li	$v0, 54
		la	$a0, InputMess  
		la	$a1, string
		la	$a2, 100
		syscall
		# Hien thong bao nhap vao xau ky tu
		
		
		la	$a0, string
		la	$a1, check
		la	$a2, end_string

		li	$t7, 0x2C # ','
		li	$t8, 0x20 #space
		li	$t9, 0x74 							
		jal	count	

		li	$v0, 56			
		la	$a0, OutputMess1	
		add	$a1, $zero, $s1
		syscall				
		# Thong bao so ky tu
		
		li	$t6, 0x2E 	# '.'		
		li	$t5, 0xa	# new_line \n	
		subi	$a2, $a2, 2		
		sb	$t6, 0($a2)		
		sb	$t5, 1($a2)		
		li	$v0, 59			
		la	$a0, OutputMess2	
		la	$a1, end_string		
		syscall				
		# Thong bao chi tiet cac ky tu
		
		li	$v0, 10			
		syscall				
end_main:

count:
		add	$s0, $zero, $zero
		add	$s1, $zero, $zero
loop:
		add	$t1, $s0, $a0
		lb	$t2, 0($t1)
		beq	$t2, 10, end_loop 
check_char:
		sub	$t3, $t2, 0x61		
		add	$t1, $a1, $t3		
		lb	$t3, 0($t1)		
		bne	$t3, 0x66, no_increase	
		sb	$t9, 0($t1)
		addi	$s1, $s1, 1   # thanh ghi s1 dem so ky tu duoc dung
		sb	$t2, 0($a2)		
		sb	$t7, 1($a2)	# them dau '<blankspace>' sau moi ki tu	
		sb	$t8, 2($a2)	# them dau ',' 	
		addi	$a2, $a2, 3		
no_increase:
		addi	$s0, $s0, 1   # thanh ghi s0 dem so ky tu cua chuoi
		j	loop	      # quay lai vong loop
end_loop:
		jr	$ra
end_count:	
