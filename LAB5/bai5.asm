.data
input: .space 21
message: .asciiz "Nhap xau: "
message2: .asciiz "Xau nguoc la: "
.text

la $a0 message
li $v0 4
syscall

li $t0 20 # Maximum 20 characters
addi $t0 $t0 -1
li $s0 0 # Init i==0
la $s1 input

  
input_string:
  li $v0 12
  syscall
  beq $v0 10 end_input # if character is equal to '\n'
  nop
  add $s2 $s1 $s0
  sb $v0 0($s2) # Store value optained to input
  beq $s0 $t0 end_input
  nop # If number of characters is 20 -> exit (When memory index 19 we will end loop)
  addi $s0 $s0 1 # i = i + 1
  j input_string
  nop
end_input:

li $a0 10
li $v0 11
syscall

la $a0 message2
li $v0 4
syscall


la $s1 input
print_reverse:
  add $s2 $s1 $s0
  lb $s3 0($s2)
  add $a0 $zero $s3
  li $v0 11
  syscall
  add $s0 $s0 -1
  beq $s0 -1 end_print
  nop
  j print_reverse
  nop
end_print:








