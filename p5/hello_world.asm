# Hello World example

	.data
str:	.asciiz "Hello World!"

	.text
main:	la $a0, str		# $t0 = endereço de str
	addi $v0, $0, 4 	# $v0 = $0 + 4
	syscall			# Run system call at $v0
	
	addi $v0, $0, 10
	syscall