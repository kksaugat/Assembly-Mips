.data
firstnum: .asciiz"\n\nPlease input the first num: "
secondnum: .asciiz"Input the second num: "
operation: .asciiz"Input the operation: "
result: .asciiz"The result is: "
wrong_operation: .asciiz "Cant perform any action."
.text
main:

start:
li $v0, 4       #To print the first input message
la $a0, firstnum
syscall

li $v0, 5
syscall
move $t0, $v0  #saving the first  number to t0

li $v0, 4
la $a0, secondnum  #Printing second input message
syscall


li $v0, 5
syscall
move $t1, $v0  #saving the second number to t1

li $v0, 4
la $a0, operation  # printing the operation message
syscall


li $v0, 5
syscall
move $t2, $v0

li $v0, 4
la $a0, result  #printing the result message
syscall


beq $t2,1 ,addition #if user enters 1 do addition
beq $t2,2, subtraction   #if user enters 2  do subtraction
beq $t2,3, multiplication  # if user enters 3 do multiplication
beq $t2,4, division  #if user enters 4 do division
bgt $t2,4,  exit #if user enters more than  4 do nothing

addition: add $a0, $t0, $t1
li $v0, 1
syscall
j start


subtraction: sub $a0, $t0, $t1
li $v0, 1
syscall
j start


 multiplication: mul $a0, $t0, $t1
li $v0, 1
syscall
j start

division: div $a0, $t0, $t1
li $v0, 1
syscall
j start   # jump back  to start to do the operation again

exit:
li $v0, 4
la $a0, wrong_operation
syscall
j start
