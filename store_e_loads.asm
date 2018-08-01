.globl main
main:
addi $t0, $zero, 0xffffffff
addi $t1, $zero,0
sb   $t0,0($t1)
sh   $t0,4($t1)