	.data 
prompt:	.asciiz "Introduza um número: "
strpar:	.asciiz "O número é par\n"
strimp:	.asciiz "O número é impar\n"
	.text
	.globl main

main:	# print_str(prompt)
	la $a0, prompt
	li $v0, 4
	syscall
	
	# $t0 = read_int()
	li $v0, 5
	syscall		# $v0 = input
	move $t0, $v0
	
	andi $t1, $t0, 1	# $t1 = $t0 & 1
	bne $t1, 0, else
	
	la $a0, strpar
	j print

else:	la $a0, strimp

print:	# print_str(prompt)
	li $v0, 4
	syscall
	
exit:	li $v0, 10
	syscall