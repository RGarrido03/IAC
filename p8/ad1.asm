	.data
result:	.asciiz	"O conteúdo do array é:\n"
dash:	.asciiz " - "
	.align	2
list:	.word	4, 3, 2, 1, 27, 45
	.text
	
	la	$t0, list	# int list[] = {...}
	li	$t1, 0		# int i = 0
	
	# print_str(...)
	li	$v0, 4
	la	$a0, result
	syscall
	
	# for
test:	bge	$t1, 6, exit

	# print_int10(list[i])
	li	$v0, 1
	lw	$a0, 0($t0)
	syscall
	
	# print_str(" - ")
	li	$v0, 4
	la	$a0, dash
	syscall
	
add:	addi	$t1, $t1, 1	# i++
	addi	$t0, $t0, 4
	j test
	
exit:	li $v0, 10
	syscall
