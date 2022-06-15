.data
prompt: .asciiz "Please enter an integer: "

.text

main:
	#print prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	#read input
	li $v0, 5
	syscall
	
	move $a0, $v0 #move input into argument
	jal recursion
	move $s1, $v0 #move result to $s1
	
	#print result
	li $v0, 1
	move $a0, $s1
	syscall
	
	j end
	
recursion:
	#push to stack for $ra, $a0, $s 2, 3, 4 (for m, m + 1, m + 2)
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	
	#if argument = 10 then branch
	beq $a0, 10, num_equal_ten
	
	#else if arugment = 11 then branch
	beq $a0, 11, num_equal_eleven
	
	#else
	move $s2, $a0 #store m (argument) into $s2 
	add $a0, $a0, 1 # $a0 = (m + 1)
	jal recursion
	move $s3, $v0 #store return into $s3
	lw $a0, 4($sp) #restore $a0
	add $a0, $a0, 2 # $a0 = (m + 2)
	jal recursion
	move $s4, $v0 #store return into $s4
	
	add $v0, $s3, $s4 # v0 = recursion(m + 1) + recursion(m + 2)
	add $v0, $v0, $s2 # v0 = (recursion(m+1) + recursion(m+2)) + m
	
	j end_recur #end recursion
	
	
	
num_equal_ten:
	addi $v0, $zero, 2 #return = 2
	#li $v0, 2
	
	j end_recur
	
num_equal_eleven:
	addi $v0, $zero, 1 #return = 1
	#li $v0, 1
	
	j end_recur

end_recur:
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 20
	
	jr $ra

end:
	li $v0, 10
	syscall
	
