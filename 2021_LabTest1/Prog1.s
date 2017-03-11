	.text
main:	addi 	$v0, $0, 5
	syscall

	add 	$t0, $0, $v0	# n = t0
	sll 	$t1, $t0, 2	# n << 2 = t1
	ori 	$t0, $t1, 3	# n = (n << 2) | 3
	add	$t5, $0, $0	# count = t5
	add	$t6, $0, $0	# i = t6 = 0

loop:	slt	$t7, $t6, $t0
	beq	$t7, 0, out
	mult	$t6, $t6
	mflo	$t1		# i * i = t1 (t1 changed)
	add	$t5, $t5, $t1
	addi	$t6, $t6, 1	# i++
	j loop	

out:	add	$a0, $0, $t5
	addi	$v0, $0, 1
	syscall

	jr	$ra
