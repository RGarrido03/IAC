	.data
prompt:	.asciiz	"Introduza um número\n"
preres:	.asciiz	"O fatorial do número "
result:	.asciiz " é: "
	.text
	
main:	# print_str(prompt)
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	# n = read_int()
	li	$v0, 5
	syscall
	move	$s0, $v0
	
	# factorial(n)
	move	$a0, $s0	
	jal	factor
	move	$s1, $v0
	
	# print_str(preres)
	li	$v0, 4
	la	$a0, preres
	syscall
	
	# print_int10(n)
	li	$v0, 1
	move	$a0, $s0
	syscall
	
	# print_str(result)
	li	$v0, 4
	la	$a0, result
	syscall
	
	# print_int10(f)
	li	$v0, 1
	move	$a0, $s1
	syscall

	# exit()
	li	$v0, 10
	syscall

# factorial()
factor:	li	$v0, 1		# res = 1
	move	$t1, $a0	# i = num
	
test:	ble	$t1, 0, done

	mul	$v0, $v0, $t1
	subi	$t1, $t1, 1
	
	j	test

done:	jr	$ra