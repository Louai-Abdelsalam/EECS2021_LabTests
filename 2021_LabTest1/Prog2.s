	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$v0, $0, 5
	syscall
	add	$a0, $0, $v0
	jal	calc
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall

done:	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra

calc:	add	$t0, $0, $a0	# n = t0
	slti	$t7, $t0, 10
	beq	$t7, 0, else
	add 	$v0, $0, $t0
	jr 	$ra

else:	addi	$sp, $sp, -8
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)

	addi	$t1, $0, 2	# 2 = t1
	div	$a0, $t1
	mflo	$a0
	jal 	calc
	lw	$a0, 0($sp)
	add	$v0, $a0, $v0
	
	lw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jr 	$ra
