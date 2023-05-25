	.data
result:	.asciiz	"O conteúdo do array é: \n"
dash:	.asciiz " - "
	.align	2
list:	.word	4, 3, -2, 1, 27, 45
	.text
	
	la	$t0, list	# int list[] = {...}
	addi	$t1, $t0, 24
	
	# print_str(...)
	li	$v0, 4
	la	$a0, result
	syscall
	
	# for
test:	bge	$t0, $t1, exit

	# print_int10(list[i])
	li	$v0, 1
	
	lw	$a0, 0($t0)
	syscall
	
	# print_str(" - ")
	li	$v0, 4
	la	$a0, dash
	syscall
	
add:	addi	$t0, $t0, 4
	j test
	
exit:	li $v0, 10
	syscall
