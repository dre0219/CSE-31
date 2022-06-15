	.data
	
n: 	.word 20
str1:	.asciiz "Less than "
str2:	.asciiz "Less than or equal to "
str3:	.asciiz "Greater than "
str4:	.asciiz "Greater than or equal to "
newLine: .asciiz "\n"

prompt:	.asciiz "Enter an integer:"

	.text
main:

	#print n 
	#li $v0, 1
	#move $a0, $t0
	#syscall 
	
	#print prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	#recieve input
	li $v0, 5
	syscall
	
	#move input to t1
	move $t1, $v0
	
	#load n
	lw $t0, n($zero)
	
	
	#if less than or greater than
	#slt $s0, $t0, $t1 #if(n < input) $s0 = 1 
	#if $t0 != 0 then greaterThan than
	#bne $s0, $zero, ifGreaterThan
	#if $t0 == 0 then lessThan
	#beq $s0, $zero, ifLessThan
	 
	#Greater than or Equal
	beq $t0, $t1, ifGorEq
	slt $s0, $t0, $t1
	bne $s0, $zero, ifLessThan 
	beq $s0, $zero, ifGorEq
	
	#Less than or Equal
	#beq $t0, $t1, ifLorEq
	#slt $s0, $t0, $t1
	#beq $s0, $zero, ifLorEq
	#bne $s0, $zero, ifGreaterThan
	

#str1:	.asciiz "Less than\n"
#str2:	.asciiz "Less than or equal to\n"
#str3:	.asciiz "Greater than\n"
#str4:	.asciiz "Greater than or equal to\n"

	ifLessThan:
		#print str1
		li $v0, 4
		la $a0, str1
		syscall
		
		#print n
		li $v0, 1
		la $a0, ($t0)
		syscall
		
		#newLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#end
		li $v0, 10
		syscall
	
	ifGreaterThan:
		#print str1
		li $v0, 4
		la $a0, str3
		syscall
		
		#print n
		li $v0, 1
		la $a0, ($t0)
		syscall
		
		#newLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#end
		li $v0, 10
		syscall
	
	ifLorEq:
		li $v0, 4
		la $a0, str2
		syscall
		
		#print n
		li $v0, 1
		la $a0, ($t0)
		syscall
		
		#newLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#end
		li $v0, 10
		syscall
	
	ifGorEq:
		li $v0, 4
		la $a0, str4
		syscall
		
		#print n
		li $v0, 1
		la $a0, ($t0)
		syscall
		
		#newLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#end
		li $v0, 10
		syscall
		
	

		
