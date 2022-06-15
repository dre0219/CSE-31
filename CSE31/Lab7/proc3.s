.data
x:		.word 5
y:		.word 10
m:		.word 0		
n:		.word 0
p:		.word 0
q:		.word 0
a:		.word 0
b:		.word 0

		.text

		
MAIN:	la $t0, x
		lw $s0, 0($t0)	# s0 = x
		la $t0, y
		lw $s1, 0($t0) 	# s1 = y
		
		# call sum
		add $a0, $zero, $s0
		add $a1, $zero, $s1
		
		jal SUM
		
		add $t0, $s1, $s0
		add $s1, $t0, $v0
		addi $a0, $s1, 0 
		
		#print
		li $v0, 1		 
		syscall	
		j END

		
SUM:	


	addi $sp, $sp, -4   

	sw $ra, 8($sp)		 	 
 	addi $a0, $s1, 1	# $s1 = q
 	addi $a1, $s0, 1        # $s0 = p
 	
 	
 	jal SUB
 	add $t0, $zero, $v0	
 	
 	addi $a0, $s0, -1	# $a0 = m
 	addi $a1, $s1, -1       # $a1 = n
 	
 	jal SUB
 	
 	add $t1, $zero, $v0
 	
 	
 	
 			
 	lw $ra, 8($sp)		
 	addi $sp, $sp, 4
 		

	add $v0, $t0, $t1	
	jr $ra
	
			
		
SUB:		
		sub $v0, $a1, $a0  # $a0 = a, $a1 = b
		jr $ra

		
END: 		li $v0, 10
		syscall
