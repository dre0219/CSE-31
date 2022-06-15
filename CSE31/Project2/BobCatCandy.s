.data 


str1: .asciiz "Welcome to BobCat Candy, home to the famous BobCat Bars! \n"

str2: .asciiz "Please enter the price of a BobCat Bar: "

str3: .asciiz "Please enter the number of wrappers needed to exchange for a new bar: "

str4: .asciiz "How, how much do you have? "

str5: .asciiz "Good! Let me run the number... \n"



str6: .asciiz "You first buy "

str7: .asciiz " bars. \n"

str8: .asciiz "With $" 

str9: .asciiz ", you will receive a maximum of "

str10: .asciiz " BobCat bars! \n"



str11: .asciiz "You first buy "

str12: .asciiz "Then, you will get another. "


# skip a line 
str13: .asciiz "\n"



.text

		#This is the main program.
		#It first asks user to enter the price of each BobCat Bar.
		#It then asks user to enter the number of bar wrappers needed to exchange for a new bar.
		#It then asks user to enter how much money he/she has.
		#It then calls maxBars function to perform calculation of the maximum BobCat Bars the user will receive based on the information entered. 
		#It then prints out a statement about the maximum BobCat Bars the user will receive.


main:

		addi $sp, $sp -4  # Feel free to change the increment if you need for space.
		sw $ra, 0($sp)
		
		# Implement your main here
		
		li $s0, 0	# price of a BobCat Bar
		li $s1, 0	# number of wrappers
		li $s2, 0	# how much do you have
		
		
		#str1
		li $v0, 4
		la $a0, str1
		syscall
		
	
		#str2	 
		li $v0, 4
		la $a0, str2
		syscall
		
		li $v0, 4
		la $a0, str13
		syscall
		
		
		addi $v0, $0, 5
		syscall
		
		addi $sp, $sp -4
		sw $v0, 0($sp)
		lw $s0, 0($sp)
		add $v0, $s0, $zero # stores price of bar in $t0
		
		#str3
		li $v0, 4
		la $a0, str3
		syscall
		
		# new line 
		li $v0, 4
		la $a0, str13
		syscall
		
		addi $v0, $0, 5
		syscall
		addi $sp, $sp -4
		sw $v0, 0($sp)
		lw $s1, 0($sp)
		add $v0, $s1, $zero # stores wrapper in $t1
		
		#str4
		li $v0, 4
		la $a0, str4
		syscall
		
		# new line 
		li $v0, 4
		la $a0, str13
		syscall
		
		
		addi $v0, $0, 5
		syscall
		addi $sp, $sp -4
		sw $v0, 0($sp)
		lw $s2, 0($sp)
		add $v0, $s2, $zero #stores total money in $t2
		
		#str5
		li $v0, 4
		la $a0, str5
		syscall
		jal maxBars # Call maxBars to calculate the maximum number of BobCat Bars

		# Print out final statement here

		j end # Jump to end of program




maxBars:
		
                li $s3, 0	#total
		li $s4, 0       #remain
		li $s5, 0	#newremain
		li $s6, 0	#counter
		div $s2, $s0    #total = (totalmoney/bar);
		mflo $s3	#stores total = totalmoney/bar
		jal secondcase	
		jr $ra
		
		# End of maxBars
		
		
firstcase: 
		bne $s1, 0, end #if(wrapper == 0)
		
		
secondcase:
		#ble $s1, 0, end
		#ble $s3, 0,maxBars
		
		#str6
		div $s2, $s0
		mflo $s3
		beq $s3, $0, end
		li $v0, 4
		la $a0, str6
		syscall
		# total = (totalmoney/bar);
		
		#str6
		li $v0, 1
		move $a0, $s3
		syscall
		li $v0, 4
		la $a0, str7
		syscall
		add $s6, $s6, $s3	# counter = counter + total;
		jal jump
		
		#str12
jump:
		beq $s3, $0, end
		div $s3, $s1
		mflo $s4
		beq $s4, $0, end
		li $v0, 4
		la $a0, str12
		syscall
		li $v0, 1
		move $a0, $s4
		move $s3, $s4
		syscall
		
		#bars line
		li $v0, 4
		la $a0, str7
		syscall
		add $s6, $s6, $s4
		jal jump           # counter = counter + newremain;


newBars:
		
		jr $ra
		

end: 
                la $t1, ($s2)    #loads in total money
		la $t2, ($s6)    #loads in counter
		#strl8

		
		# Terminating the program
		
		li $v0, 4
		la $a0, str8
		syscall
		li $v0, 1
		move $a0, $s2
		syscall
		li $v0, 4
		la $a0, str9
		syscall
		li $v0, 1
		move $a0, $s6
		syscall
		li $v0, 4
		la $a0, str10
		syscall
		lw $ra, 0($sp)
		addi $sp, $sp 4
		li $v0, 10 
		syscall

				
