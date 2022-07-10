#Assignment1:
.eqv SEVENSEG_LEFT 0xFFFF0011 # Dia chi cua den led 7 doan trai.
# Bit 0 = doan a;
# Bit 1 = doan b; ...
# Bit 7 = dau .
.eqv SEVENSEG_RIGHT 0xFFFF0010 # Dia chi cua den led 7 doan phai
.text
main:
li $a0, 0x6f # set value for segments
jal SHOW_7SEG_LEFT # show
nop
li $a0, 0x6D # set value for segments
jal SHOW_7SEG_RIGHT # show
nop
exit: li $v0, 10
syscall
endmain:
#---------------------------------------------------------------
# Function SHOW_7SEG_LEFT : turn on/off the 7seg
# param[in] $a0 value to shown
# remark $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_LEFT: li $t0, SEVENSEG_LEFT # assign port's address
sb $a0, 0($t0) # assign new value
nop
jr $ra
nop
#---------------------------------------------------------------
# Function SHOW_7SEG_RIGHT : turn on/off the 7seg
# param[in] $a0 value to shown
# remark $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_RIGHT: li $t0, SEVENSEG_RIGHT # assign port's address
sb $a0, 0($t0) # assign new value
nop
jr $ra

#9 : các bit sáng là a, b, c, d, g, f ứng với các bit 0, 1, 2, 3, 5, 6 có giá trị bằng 1
#01101111 = 6F
#5 : các bit sáng là a, c, d, g, f  ứng với các bit 0, 2, 3, 5, 6 có giá trị bằng 1
#01101101 = 6D
