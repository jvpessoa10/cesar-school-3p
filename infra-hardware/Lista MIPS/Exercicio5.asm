.data
	array: 	.byte 10
		.byte 5
		.byte 45
		.byte 21
		.byte 34
		.byte 40
		.byte 30
		.byte 20
		
	tamanho: .word 8 
.text 
	la $s0, array
	lw $s1, tamanho	
	
	subi $s3, $s1,1 #index para percorrer
	
	L1:
		blt $s3,$zero, Exit  
			
		add $t1, $s3, $s0 #index + endereço do array
		lb $t0, 0($t1)
	
		add $s4, $s4, $t0 
		subi $s3, $s3, 1	
		j L1
	Exit:
	li $v0,1
	move $a0, $s4
	syscall
	
	
	