#Laboratory Exercise 2, Assignment 1
.text
	addi $s0, $zero, 0x3007 # $s0 = 0 + 0x3007 ; I-type
	add  $s0,$zero,$s0    # $s0 = 0 + 0      ; R-type
	addi $s0, $zero, 0x2110003d
