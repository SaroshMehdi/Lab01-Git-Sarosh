.text
.globl main

main:
    li x10, 0x100
    li x11, 0x200
    li t2, 'B'
    sb t2, 0(x11)
    li t2, 'y'
    sb t2, 1(x11)
    li t2,0
    sb t2, 2(x11)
    li x19, 0

    jal x1, strcpy
    li x10,4
    ecall
    j end

    strcpy:
    addi sp,sp,-8
    sw x19, 0(sp)
    loop:
    add t0, x11, x19
    lb t1, 0(t0)
    add t2, x10, x19
    sb t1, 0(t2)
    beq t1, x0, exit
    addi x19, x19, 1
    j loop

    exit:
    lw x19, 0(sp)
    addi sp, sp, 8
    jalr x0, 0(x1)

    end:
    j end