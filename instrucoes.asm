.globl main
main:
addi $t0, $zero, 1
addi $t1, $zero, 2
addi $t2, $zero, 3
addi $t3, $zero, 4
addi $t4, $zero,0x10010000
add  $t0,$t1,$t0
sub  $t1,$t2,$t0
slt  $t5,$t1,$t0
sw   $t5, 4($t4)
break
