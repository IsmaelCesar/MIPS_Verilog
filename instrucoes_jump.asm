.globl main
main:
addi $t0, $zero, 1 
addi $t1, $zero, 2
jal teste

sub $t4, $t0,$t1

teste:
addi $t2, $zero,3
addi $t2, $zero,4
jr $ra