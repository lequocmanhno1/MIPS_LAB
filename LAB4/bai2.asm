.text
li $s0,0x12345678
#Extract MSB cua $s0
andi $t0,$s0,0xff000000 #$t0=0x12000000
#Clear LSB cua $s0
andi $t1,$s0,0xffffff00 #$t1 = 0x12345600
#Set LSB cua $s0 thanh 1
andi $t2,$s0,0xffffff00 #$t1 = 0x12345600
xori $t2,$t2,0x000000ff #$t2 = 0x123456ff
#Clear $s0 = 0
andi $s0,$s0,0x00000000 #Ss0= 0x00000000