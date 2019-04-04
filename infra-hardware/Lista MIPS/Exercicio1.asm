.data 
	lista: .word 10,40,23,5 # inicializa um espaco de memoria de 32 bytes 
	size: .word 4 # tamanho do array 

	
.text

main:
	
	la $s0, lista
	lw $s1, size 
	
	move $t0, $s1 #$t0 = indice L1 = tamanho do array
	
 	L1:
		beq $t0,0, end
				
		move $t1,$zero # #t1 = indice L2 = 0
		subi $t5 $s1, 1
		L2:
			
			beq $t1 , $t5, Exit
			
			sll $t2 , $t1,2 #indice para acessar itens do array (Deve-se ser multiplicado por 4) 	
			
			
			add $t2 , $t2, $s0 
			lw $s2, 0($t2) #carrega valor de array[$t2 + endereço do array]
			
			addi $t3, $t2,4 #carrega valor de array[$t2 + endereço do array + 1]
			lw $s3 ,0($t3)
			
			sle  $t4,$s3,$s2
			beq  $t4,$zero,Exit2
			
			#faz o swap 
			sw $s2,0($t3)
			sw $s3, 0($t2)
			
			Exit2:
			addi $t1, $t1, 1
			j L2
			
		Exit:
		subi  $t0, $t0,1
		j L1 
	 
end:
			
		

		 
	
	
