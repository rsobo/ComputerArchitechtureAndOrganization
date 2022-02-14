#program to calculate sum of numbers 
.data
num : .asciiz "\nEnter the number of your choice:\n"
sum : .asciiz "\nThe sum is:\n"
error : .asciiz "\nError: number less than 0"
.text
la $a0,num
li $v0,4
syscall
li $v0,5
syscall
move $s0,$v0 ##s0 has the number
blez $v0, eoop

move $s1, $0 # i = 0, counter
move $s2, $0 #initialize sum=0
#loop to calculate sum until number
loop:
add $s2,$s2,$s1 #sum = sum + i
addi $s1,$s1,1 # i=i+1
bgt $s1,$s0,end #while i!=num
j loop
eoop:
la $a0, error
li $v0, 4 
syscall
j exit
end:
la $a0,sum 
li $v0,4
syscall
li $v0,1
move $a0,$s2
syscall
exit:
li $v0,10
syscall
