.data

posSign: .asciiz "+"
negSign: .asciiz "-"

	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$v0, $0, 5
	syscall
	add	$a0, $0, $v0
	jal	sign
	add	$a0, $0, $v0
	addi	$v0, $0, 4
	syscall

done:	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra

sign:	add	$t0, $0, $a0
	addi	$t1, $0, -1
	slt	$t7, $t1, $t0
	beq	$t7, 0, else
	la	$v0, posSign
	jr	$ra	

else:	la	$v0, negSign
	jr	$ra
