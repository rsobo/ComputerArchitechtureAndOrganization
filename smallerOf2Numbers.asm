#prints smallest of 2 numbers
.data
str1: .asciiz "Enter number 1:\n"
str2: .asciiz "Enter number 2:\n"
str3: .asciiz "\nThe smallest number is:\n"
.text
la $a0,str1
li $v0,4
syscall
#get num 1
li $v0,5
syscall
move $s0,$v0 #save num 1 into reg s0

la $a0,str2
li $v0,4
syscall
#get num 2
li $v0,5
syscall
move $s1,$v0 #save num 2 into reg s1

#print output
la $a0,str3
li $v0,4
syscall
#compare the nums
ble $s0,$s1,toop
#false condition
move $a0,$s1 #print num 2 since it is smaller
li $v0,1
syscall

j exit

#true condition
toop:
move $a0,$s0 #print num 1 since it is smaller
li $v0,1
syscall

exit:
li $v0,10
syscall
