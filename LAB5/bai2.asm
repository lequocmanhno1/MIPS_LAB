#Assignment 2
.data
part1: .asciiz "The sum of "
part2: .asciiz " and "
part3: .asciiz " is "
.text
li $s0 10
li $s1 20

add $s2 $s1 $s0

#1
la $a0 part1
li $v0 4
syscall
#
addi $a0 $s0 0
li $v0 1
syscall
#3
la $a0 part2
li $v0 4
syscall
#4
addi $a0 $s1 0
li $v0 1 
syscall
#5
la $a0 part3
li $v0 4
syscall
#6
addi $a0 $s2 0
li $v0 1
syscall



