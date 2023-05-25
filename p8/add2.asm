	.data
prompt:	.asciiz	"Insira 6 números:\n"
dash:	.asciiz " - "
	.align	2
list:	.space	24
	.text
	
	la	$t0, list	# int list[] = {...}
	li	$t1, 0		# int i = 0
	
	# print_str(prompt)
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	# for
test:	bge	$t1, 6, b

	# read_int()
	li	$v0, 5
	syscall
	
	# store word
	sb	$t0, 0($v0)
	
	la	$t0, list
	sll	$t0, $t1, 2

add:	addi	$t1, $t1, 1	# i++
	j test



# b)
b:	la	$t0, list
	addi	$t1, $t0, 24
	
prtest:	bge	$t0, $t1, exit

	# print_int10(list[i])
	li	$v0, 1
	lw	$a0, 0($t0)
	syscall
	
	# print_str(" - ")
	li	$v0, 4
	la	$a0, dash
	syscall
	
pradd:	addi	$t0, $t0, 4
	j prtest



# exit()
exit:	li	$v0, 10
	syscall