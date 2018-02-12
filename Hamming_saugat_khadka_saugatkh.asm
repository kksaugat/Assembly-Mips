


.data

input1: .asciiz "\n\nPlease enter the first string:\n"
input2: .asciiz "\nPlease enter the second string:\n"
answer: .asciiz "\nThe hamming distance is:"

string1: .space 3   #3 bytes to hold string of length two plus a terminating charcter
string2: .space 3

.text
main:
li $v0, 4              #To print the first string message
la $a0, input1
syscall

li $v0, 8             #Ready to print a string
la $a0, string1
li $a1,3
move $s0, $a0   #saving the string into $s0 register
syscall


li $v0, 4           # To print the second string message
la $a0, input2
syscall

li $v0, 8          #Ready to print another string
la $a0, string2
li $a1,3
move $s1, $a0   # Saving the string into $s1 register
syscall





li $t1,0  #counter = 0

while:


lb $s4, 0($s0)  #loading the first character of string1 to $s4
lb $s5, 0($s1)   #loading the second character of string1 to $s5

beq $s4, $zero exit     # if string 1 hits the terminating character exit

beq $s4,$s5, loop_continue   #branch to loop_continue if the first characters are same
addi $t1, $t1, 1     # increases the counter if the charcaters are different
addi $s0,$s0,1   # next charcater of string1
addi $s1, $s1,1   #next character of string2
j while    #jumps back to the while

loop_continue:   # if the first characters are same
addi $s0,$s0,1  # second character of string1
addi $s1,$s1,1   #second charcater of string2
j while   #jumb back to the while


exit:   #if it hits the null character end the loop


li $v0,4   # ready to print the answer message
la $a0, answer
syscall


move $a0,$t1  #save the value of counter to $a0
li $v0,1   #print the value
syscall
j main   # go back to the main again to start the program again

li $v0,10  #end of program
syscall
