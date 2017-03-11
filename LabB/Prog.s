########################################################
#
#			Prog.s
#
########################################################
	.text
main:
addi	$v0, $0, 5	# read int service
syscall
add   $t0, $0, $v0  # t0=x
slti  $t5, $t0, 5
beq   $t5, 1, true
beq   $t0, 5, true

li    $t1, 0  # t1=y=0
li    $t7, 0  # t7=i=0
loop:
slt   $t5, $t7, $t0
beq   $t5, 0, endloop
li    $t5, 5
mult  $t0, $t5
mflo  $t5
add   $t1, $t1, $t5
addi  $t7, $t7, 1
j loop

endloop:
add   $a0, $0, $t1
addi  $v0, $0, 1
syscall
jr $ra

true:
addi  $a0, $t0, -3
addi  $v0, $0, 1
syscall
jr	$ra
########################################################
