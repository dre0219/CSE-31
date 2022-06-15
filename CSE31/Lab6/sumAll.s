    .data
prompt:    .asciiz "Enter an integer (0 to stop)\n"
newLine: .asciiz "\n"

    .text
main:
    while:
        
        #prompt
        li $v0, 4
        la $a0, prompt
        syscall
        
        #input
        li $v0, 5
        syscall
        
        move $t0, $v0
        beq $t0, $zero, exit
        
        slt $s0, $t0, $zero
        
        #if less than zero
        beq $s0, $zero, pos_num
        
        #if greater than zero
        bne $s0, $zero, neg_num
        
    exit:
        #print pos_nums
        li $v0, 1
        move $a0, $s1
        syscall
        
        #print newLine
        li $v0, 4
        la $a0, newLine
        syscall
        
        #print neg_nums
        li $v0, 1
        move $a0, $s2
        syscall
       	
       	#end
        li $v0, 10
        syscall
        
    pos_num:
    	#add pos numbers to s1
        add $s1, $s1, $t0
        j while
    
    neg_num:
    	#add neg numbers to s2
        add $s2, $s2, $t0
        j while
    


