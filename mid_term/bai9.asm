.data
Message: .asciiz "So hoc sinh trong lop: "
Message2: .asciiz "Ten hoc sinh:"
Message3: .asciiz "Diem toan:"
Message4: .asciiz "Danh sach hoc sinh khong dat mon Toan:"
Message5: .asciiz "Tat ca hoc sinh deu qua mon Toan"
Enter: .asciiz "\n"
Space: .asciiz " "
Name:  .space 4000 
Mark: .word 100
.text
#########-----Main:
main:
 jal Readn  #Doc vao so hoc sinh
 jal ReadNameAndMark #Nhap ten va diem toan cac hoc sinh
 jal PrintList# In ra danh sach nhung hoc sinh khong dat mon Toan
 li $v0,10 #Thoat chuong trinh
 syscall

##########----Ham doc so hoc sinh
Readn: 
 li $v0, 51 #Nhap vao so nguyen n (showInputInt)
 la $a0, Message
syscall 
 beq $a1,-1,Readn# Neu khong phai la so nguyen => yeu cau nhap lai
 beq $a1,-3,Readn # Neu khong nhap gi => yeu cau nhap lai
 bgt $a0,100,Readn # neu n>100 yeu cau nhap lai
 addi $s0,$a0,0 # s0=n
 jr $ra
 #############
 #############----Doc ten va diem Toan cua sinh vien
ReadNameAndMark:
 la $t0,Name #t0 la dia chi Name[0]
 addi $s2,$t0,0 # store dia chi Name[0] vao s2
 la $t1,Mark # t1 la dia chi Mark[0]
 addi $s3,$t1,0 #store dia chi Mark[0] vao s3
doReadNa: beq $s0,$s1,EndReadNa # s0==s1 <=> s1==n => endread
				# 
 li $v0, 54 # showInputString 
 la $a0, Message2
 addi $a1, $s2,0  # Copy dia chi cua Mang Name vao $a1
 la $a2, 40 # Ten sinh vien toi da 40 chu cai
 syscall 
 beq $a1,-4,doReadNa
 beq $a1,-3,doReadNa
 beq $a1,-2,doReadNa
 # cac truong hop ten nhap vao qua dai, xau rong, cancel deu goi lai doReadNa
 addi $s4,$s2,0 # Store dia chi Name[0] vao s4 to check character
CheckString:
 lb $t2,Enter# t2='\n'
 lb $t3,Space # t3=' ' (t3=space)
 lb $t6,0($s4) #t6=Charname[i] (s4=i)
 beq $t6,$t2,EndCheck # if charname[i]='\n'=> end check,gap ki tu endline thi dung
 beq $t6,$t3,Doadd# if charname[i] =space =>  doAdd
doCheck: # check tung ki tu xem co hop le hay khong
	 # a-z, A-Z
 slti $s5,$t6,91  # if t6<91 =>s5=1 ( charname[i]<='Z')
 addi $s7,$zero,64 # s7 =64
 slt $s6,$s7,$t6 #if t6>s7 <=> t6>64 => s6=1 (charname[i] >='A')
 and $t4,$s5,$s6 #t4 = s5 and s6 => t4=1 <=> (charname[i]>='A' and charname[i]<='Z')
 slti $s5,$t6,123# if t6<123 => s5=1 <=> charname[i] <='z'
 addi $s7,$zero,96 # s7=96
 slt $s6,$s7,$t6#if t6>s7   <=> t6>96 =>s6=1 <=> charname[i]>='a'
 and $t5,$s5,$s6#t5=s5 and s6 => t5=1 <=> (charname[i]>='a' and  charname[i] <='z')
 or $t4,$t4,$t5# t4=t4 or t5 <=> t4=1 <=>(charname[i]>='A' and charname[i]<='Z') or (charname[i]>='a' and  charname[i] <='z')
 bne $t4,1,doReadNa #t4 != 1 => doagain
Doadd:  addi $s4,$s4,1 #s4+=1
	j CheckString
EndCheck:
  addi $s4,$zero,0#reset s4
  addi $s5,$zero,0#reset s5
  addi $s6,$zero,0#reset s6
  addi $s7,$zero,0#reset s7
  addi $t4,$zero,0#reset t4
  addi $t5,$zero,0#reset t5
  addi $t6,$zero,0#reset t6
doReadMa:
 li $v0, 51 # Input diem toan
 la $a0, Message3
 syscall
 bgt $a0,10,doReadMa # mark >10 => goi lai doReadMa
 blt $a0,0,doReadMa #mark<= 0 => goi lai doReadMa
 beq $a1,-1,doReadMa#input khong phai la so nguyen => goi lai doReadMa
 beq $a1,-2,doReadMa#
 beq $a1,-3,doReadMa#input rong => goi lai doReadMa
 sw $a0,0($s3) #store input vao Mark[j]
 addi $s3,$s3,4# j+=1	$s3 luu dia chi +4 byte => +1 frame
 addi $s1,$s1,1# i+=1	$s1 la gia tri bien dem cho den n
 addi $s2,$s2,40 # Dia chi StringName tiep theo 
 j doReadNa 
 EndReadNa:
  addi $s1,$zero,0#reset s1
  addi $s2,$zero,0#reset s2
  addi $s3,$zero,0#reset s3
  jr $ra
 
 #################
 ################# - In ra danh sach hoc sinh khong dat mon Toan
 #t0-array of name
 #t1-array of mark
 #s0-n
PrintList:
addi $s4,$s4,3 # neu sinh vien dat diem 3 (gia tri s4 = 3) tro xuong , sinh vien khong dat mon Toan
addi $s2,$t0,0 #s2 la dia chi cua Name[0]
addi $s3,$t1,0 # s3 la dia chi cua Mark[0]
li $v0,4
la $a0,Message4
syscall
li $v0,4
la $a0,Enter
syscall
doSearch: beq $s1,$s0,EndPrint #s1==n =>endPrint
         lw $s5,0($s3) # s5=Mark[i]
         ble $s5,$s4,doPrint #if s5<=s4 (diem 3) 
         		     # <=> Mark[i] <= s4 => in ra ten hoc sinh
         addi $s1,$s1,1 #s1+=1 (bien dem)
         addi $s3,$s3,4 #s3+=4 (s3 +4 byte integer)
         addi $s2,$s2,40 #s2+=40 -- the next string name (ten toi da 40 ki tu)
         j doSearch
doPrint:
         li $v0,4		
         addi $a0,$s2,0		# Luu dia chi ten vao a0
         syscall
         addi $t9,$t9,1	 	# Dem so hoc sinh khong dat mon toan
         addi $s1,$s1,1		# 	tang bien dem len 1
         addi $s3,$s3,4		#	dia chi mang diem (4 byte = 1 integer)
         addi $s2,$s2,40	#	dia chi mang ten  (40 ky tu)
         j doSearch      
EndPrint:
addi $s1,$zero,0#reset s1
addi $s2,$zero,0#reset s2
addi $s3,$zero,0#reset s3
addi $s4,$zero,0#reset s4
addi $s5,$zero,0#reset s5
bne $t9, 0, havesbfail 
li $v0,4		
la $a0, Message5
syscall
havesbfail:	
jr $ra
