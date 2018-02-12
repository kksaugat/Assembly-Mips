
.data

TwoD: .asciiz "\n\nEuclidean distance for 2D\n"
x1: .asciiz"Please enter the x1 value: "
x2: .asciiz"Please enter the x2 value: "
y1: .asciiz"Please enter the y1 value: "
y2: .asciiz"Please enter the y2 value: "
newdistance: .asciiz"The euclidean distance for the above values is: "
.text

main:
distance2D:
li $v0, 4
la $a0, TwoD
syscall

li $v0,4
la $a0, x1
syscall

li $v0,5    #user to input the x1 number and save it in $f2
syscall
move $s0, $v0

li $v0,4
la $a0, x2
syscall

li $v0,5   #user to input the x2 number and save it in $f4
syscall
move $s1, $v0


li $v0,4
la $a0, y1
syscall

li $v0,5  #user to input the y1 number and save it in $f3
syscall
move $s2, $v0


li $v0,4
la $a0, y2
syscall

li $v0,5   #user to input the y2 number and save it in $f1
syscall
move $s3, $v0

li $v0,4
la $a0, newdistance
syscall


sub $t0,$s0,$s2  #subtraction x1 and y1
sub $t1,$s1,$s3  # subtracting x2 and y2
mul $t0,$t0,$t0  #squaring the result of subtraction of x1 and y1
mul $t1,$t1,$t1 #squaring the result of subtraction of x2 and y2
add $t2, $t0, $t1   # adding both results



move $a0,$t2
li $v0,1
syscall
j main

 

