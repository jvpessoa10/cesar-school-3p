.data
	
	palavra: .asciiz "pal-vra"
	size: .word 7

.text

main:
	la $t0,palavra
	
	move $a0 , $t0
	jal Print
	
	
	
	lw $t1, size
	
	add $s0 , $zero, $t0
	add $s1, $t1 , $t0
	sub $s1, $s1 , 1
	
	
	 
	L1:
		beq $s0, $s1,ExitAndChangeMiddle
		bgt $s0,$s1, End 
		
		
		lb $t2, 0($s0)
		lb $t3, 0($s1)
		

		
		move $a0 , $t2
		jal switchCase
		sb $v0,0($s1)
		
		move $a0 , $t3
		jal switchCase
		sb $v0,0($s0)
		
		beq $v1,1, ExitError
		
		_exit2:
		addi $s0,$s0,1
		subi $s1,$s1,1
		j L1
		
	ExitAndChangeMiddle:
	lb $a0 , 0($s0)
	jal switchCase
	beq $v1,1, ExitError
	
	sb $v0,0($s0)
	j End
	



checkChar:
		ble $a0, 64, Error
	 	bge $a0, 124, Error
	 	
		sle $t4, $a0 ,96
		beq $t4, $zero , Continue 	
		bge $a0, 91, Error
		
		Error:
		li $v1, 1
		
		Continue:
		jr $ra
		
	
Print:
	li $v0,4
	syscall	
	addi $a0, $0, 0xA 
        addi $v0, $0, 0xB
	syscall 
	jr $ra 
	
	
switchCase:
	
	addi $sp , $sp, -8
	
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	jal checkChar
	
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	
	beq $v1, 1, Exit
	
	
	
	li $s2, 97
	bge $a0 ,$s2,toUpper  
	
	toLower:
		addi $v0, $a0, 32
		j Exit
	toUpper:
		subi $v0, $a0, 32
		
	
	Exit:
	jr $ra
	


	
	
End:

	move $a0, $t0
	jal Print

ExitError:


	
	
	
	
