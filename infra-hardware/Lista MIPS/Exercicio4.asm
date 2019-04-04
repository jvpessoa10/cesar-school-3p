.data

	n: .word 0
	s: .word 0
	
	COMB: .word 0
	
.text

main:
	lw $s0, n  # n
	lw $s1, s #s
	
	
	beq $s0, $s1 ,Equal
	
	bgt $s1, $s0 , SGreater
	
	bltz $s0, LessZero
	bltz $s1, LessZero
	
	beqz $s0, EqualZero
	beqz $s1, EqualZero	
	
	
	
	j Normal
	
	SGreater:
		li $v1, 1
		j End 
	LessZero:
		li $v1, 2
		j End 
	Equal:
		li $v1, 3
		j End 
	EqualZero:
		li $v1, 4
		j End 
	
	Normal:
	move $a0, $s0
	jal fat
	move $s2, $v0  #n!
	
	move $a0, $s1
	jal fat
	move $s3, $v0  #s!
	
	sub $a0, $s0, $s1
	jal fat 
	move $s4, $v0 # (n-s)!
	
	mul $t0, $s4,$s3
	
	div $t1, $s2, $t0
	
	sw $t1 , COMB
	j End
	
fat: 
	beqz $a0,Exit
	
	addi $sp, $sp, -8
	sw $ra , 4($sp)
	sw $a0, 0($sp)
	
	subi $a0, $a0, 1
	jal fat
	
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 8
	
	mul $v0 , $a0, $v0
	
	jr $ra 
	Exit: 
		li $v0 ,1 
		jr $ra 

End:
