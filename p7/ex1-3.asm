	.data 
prompt:	.asciiz	"Introduza um número: "
result:	.asciiz	"O fatorial do número é: "
	.text
	
main:	# print_str(prompt)
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	# $t0 = read_int()
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	# $t1 = 1
	li	$t1, 1
	
	# $t2 = $t1
	move	$t2, $t0
	
test:	ble	$t2, $0, done

	mul	$t1, $t1, $t2

	# $t2--
	addi	$t2, $t2, -1
	j	test

done:	# print_str(result)
	la	$a0, result
	li	$v0, 4
	syscall
	
	# print_int10 ($t1)
	li	$v0, 1
	move	$a0, $t1
	syscall 

	# exit()
	li	$v0, 10
	syscall