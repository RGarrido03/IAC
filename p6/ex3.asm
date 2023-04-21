	.data
prompt:	.asciiz "Introduza dois números: "
result: .asciiz "\nA soma dos números é: "

	.text
	.globl main

main:	# Print prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Read int a
	li $v0, 5
	syscall
	move $t0, $v0	# Move return value to $t0
	
	# Read int b
	li $v0, 5
	syscall
	move $t1, $v0	# Move return value to $t1
	
	# a + b
	add $t2, $t0, $t1
	
	# Print result string
	li $v0, 4
	la $a0, result
	syscall
	
	# Print result (int is stored in $t2)
	li $v0, 1
	move $a0, $t2
	syscall 