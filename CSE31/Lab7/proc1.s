        .data
m: 		.word 10
n: 		.word 5

		.text
MAIN:
		la $t0, m			# Load address of m
		lw $a0, 0($t0)		# a0 = m
		la $t0, n			# Load address of n
		lw $a1, 0($t0)		# a1 = n
		#addi $ra,$zero, 0x00400028	# Replace 0 with a correct return address 
		
		jal SUM
		#j SUM
		
		li $v0, 1
		addi $a0, $v0, 0 # Print out result
		move $a0, $s0		 
		syscall	
		
		jal END
		#j END
		
SUM:	add $s0, $a0, $a1
		jr $ra #not a function if using j, for proper convention 

		
END:
	li $v0, 10
	syscall
	
