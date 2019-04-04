.data
	string1: .asciiz  "aaab"
	strSize: .word 4
	
.text 
	
	la $a0,string1
	lw $a1, strSize 
	
	jal checkStr
	j end
	
	
checkStr:
	addi $s0, $zero, 1
	
	move $s1,$zero
	subi $s2, $a1, 1
	
	L1:
		bge  $s1,$s2,Exit
		
		add $s3, $a0,$s1
		add $s4, $a0,$s2
		
						
		lb $t0,0($s3)
		lb $t1 ,0($s4)
		
		beq $t0, $t1, Exit2
		move $s0, $zero
		j Exit 
		
		Exit2:
		addi $s1, $s1,1
		subi $s2,$s2,1
		j L1
		
	Exit:
	move $v0, $s0	
	jr $ra 
	
	
end:
	
	
	