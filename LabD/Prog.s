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
	add	$a0, $0, $s1
	jal	Prog
	add	$s2, $v0, $0	# s2 = ref

	slt	$t5, $s1, $s0
	beq	$t5, $0, part2

part1:	add	$a0, $s2, $0
	jal	getScale
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall
	j	done

part2:	add	$a0, $s0, $0
	jal	Prog
	add	$a0, $0, $s2
	add	$a1, $0, $v0
	jal	toRatio
	add     $a0, $0, $v0
	addi    $v0, $0, 1
	syscall
	j       done

done:	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra

Prog:	#--------------------
add   $v0, $0, $a0
jr    $ra

getScale: #-----------------
li    $t5, 5
div   $a0, $t5
mflo  $v0
sll   $v0, $v0, 3
jr    $ra

toRatio: #-----------------
li    $t5, 33
mult  $a0, $t5
mflo  $t5
div   $t5, $a1
mflo  $v0
jr    $ra
