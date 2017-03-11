########################################################
#
#			Prog.s
#
########################################################
	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$s0, $0, 34	# s0 = n
	addi	$v0, $0, 5
	syscall
	add	$s1, $0, $v0	# s1 = x

	slt	$t5, $s1, $s0
	beq	$t5, $0, part2

part1:	add	$a0, $0, $s1
	add	$a1, $0, $s0
	jal	compute
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall
	j	done

part2:	add	$a0, $0, $s1
	jal	gar
	add     $a0, $0, $v0
	addi    $v0, $0, 1
	syscall
	j       done

done:	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra

#------------------------------compute
compute:
mult  $a0, $a1
mflo  $t5
sub   $v0, $a0, $t5
jr    $ra
#------------------------------gar
gar:
beq   $a0, 1, true

addi  $sp, $sp, -4
sw    $ra, 0($sp)
addi  $sp, $sp, -4

li    $t5, 2
div   $a0, $t5
mflo  $a0
jal   gar
addi  $v0, $v0, 1

addi  $sp, $sp, 4
lw    $ra, 0($sp)
addi  $sp, $sp, 4
jr    $ra

true:
li    $v0, 0
jr    $ra

########################################################
