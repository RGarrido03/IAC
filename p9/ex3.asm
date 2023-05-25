	.data
src:	.asciiz	"quero chorar"
dst:	.space	50
	.text
	
main:	la	$a0, dst
	la	$a1, src
	
	jal	strcat
	
	# exit()
	li	$v0, 10
	syscall


# strcat(char *dst, char *src)
strcat:	move	$v0, $a0	# char *aux = dst
	move	$t0, $a0
	
	...			# while

	...			# sp
	move 	$a0, $t0
	jal	strcopy
	...			# restore sp

	jr	$ra


# strcopy(char *dst, char *src)
strcopy:
	li	$t0, 0		# i = 0
	move	$v0, $a0	# $v0 = *dst
	
strcopytest:
	addu	$t1, $a1, $t0	# $t1 = &src[i] = src + i * 1
	addu	$t3, $a0, $t0	# $t3 = &dst[i] = dst + i * 1
	
	addi	$t0, $t0, 1	# i++
	lb	$t2, 0($t1)	# t2 = str[i]
	sb	$t2, ($t3)	# dst = src[i]

	beq	$t2, '\0', strcopydone
	
	addi	$v0, $v0, 1
	j strcopytest
	
strcopydone:
	jr	$ra