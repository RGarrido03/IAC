	.data
str:	.asciiz	"Eu quero chorar"
	.text

main:	la	$a0, str
	jal	strlen
	
	# print_int10()
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	# exit()
	li	$v0, 10
	syscall


# strlen(char *str)
strlen:	li	$v0, 0	# n = 0
	li	$t0, 0	# i = 0
	
test:	addu	$t1, $a0, $t0	# t1 = &str[i] = str + i * 1
	addi	$t0, $t0, 1	# i++
	lb	$t2, 0($t1)	# t2 = str[i]

	beq	$t2, '\0', done
	
	addi	$v0, $v0, 1
	j test
	
done:	jr	$ra