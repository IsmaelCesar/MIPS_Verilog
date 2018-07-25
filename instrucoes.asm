.globl main
main:
addi $t0, $zero, 1 
addi $t1, $zero, 1
addi $s0, $zero, -5
and  $t2, $t0,$t1
or   $t3, $zero,$t0
xor  $t4, $t0,$t1
andi  $t5, $t0,1
ori   $t6, $zero,1
xori  $t4, $t0, 1
slti  $t0, $t1, 3
addu  $t1, $t1,$s0
addiu $t1, $t1,-7
sltiu  $t0, $s0,-6
