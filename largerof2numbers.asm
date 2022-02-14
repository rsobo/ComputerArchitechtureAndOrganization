#demo program to print largest of 2 numbers
.data
str1: .asciiz "Enter number 1:\n"
str2: .asciiz "Enter number 2:\n"
str3: .asciiz "\nThe smallest number is:\n"
.text
la $a0,str1
li $v0,4
syscall
#accept number 1
li $v0,5
syscall
move $s0,$v0 #save #1 into register s0

la $a0,str2
li $v0,4
syscall
#accept number 2
li $v0,5
syscall
move $s1,$v0 #save #2 into register s1

#print the result
la $a0,str3
li $v0,4
syscall
#compare the two numbers
ble $s0,$s1,label
#false condition
move $a0,$s1 #print #2 since it is larger
li $v0,1
syscall

j exit

label:
move $a0,$s0 #print #1 since it is larger
li $v0,1
syscall

exit:
li $v0,10
syscall
