.text
.globl main

main:
    li x10, 10 #g
    li x11, 9 #h
    li x12, 8 #i
    li x13, 7 #j
    jal x1, leaf
    addi x11, x10, 0
    li x10, 1
    ecall
    j exit
leaf:
    addi sp, sp, -12
    add x5, x10, x11
    add x6, x12, x13
    sub x20, x5, x6
    sw x5, 8(sp)
    sw x6, 4(sp)
    sw x20, 0(sp)
    addi x10, x20, 0
    lw x20, 8(sp)
    lw x6, 4(sp)
    lw x5, 0(sp)
    addi sp, sp, 12
    jalr x0, 0(x1)
exit:


