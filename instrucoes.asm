.globl main
main:
addi $t0, $zero, 1 
addi $t1, $zero, 2 

jal other

sub $t0, $t0,$t2

other:
addi $t2, $zero, 3 
addi $t3, $zero, 4 
jr $ra 
