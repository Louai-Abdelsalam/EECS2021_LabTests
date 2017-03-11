	.text
main:	#-------------------
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$v0, $0, 5
	syscall
	add	$a0, $0, $v0	# f = a0
	
	addi    $v0, $0, 5
	syscall
	sll	$v0, $v0, 24
	srl	$a1, $v0, 24	# b = a1
	jal	Prog3

	add	$a0, $v0, $0
	jal	compute

	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall

done:	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra

Prog3:	add	$t0, $0, $a0	# f = t0
	add	$t1, $0, $a1	# b = t1

	addi	$a0, $0, 8
	addi	$v0, $0, 9
	syscall

	sw	$t0, 0($v0)
	sw	$t1, 4($v0)

	jr 	$ra
		

compute:
	sw	$t0, 0($a0)
	sw	$t1, 4($a0)
	mult	$t0, $t1
	mflo	$v0
	jr	$ra
	
