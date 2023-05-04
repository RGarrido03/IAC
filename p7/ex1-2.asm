	.data 
prompt:	.asciiz "Introduza um número: "
	.text
	
main:	# $t1 = 0
	li	$t1, 0
	
	# print_str(prompt)
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	# $t0 = read_int()
	li	$v0, 5
	syscall
	move	$t0, $v0
	
teste:	# i < a
	bge	$t1, $t0, exit
	
	# exec
	li	$a0, '-'
	li	$v0, 11
	syscall 

	# incremento
	addi	$t1, $t1, 1
	j	teste

exit:	li	$v0, 10
	syscall
