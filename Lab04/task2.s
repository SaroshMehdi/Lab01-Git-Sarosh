 .text
 .globl main

 main: 
    addi sp, x0, 500
    addi x10, x0, 5
    jal x1, func
    beq x0, x0, exit

func:
    addi sp, sp, -8
    sw x1, 0(sp)
    sw x10, 4(sp)
    addi x5, x10, -1
    bge x5, x0, ntri
    addi x10, x10, 0
    addi sp, sp, 8
    jalr x0, 0(x1)

ntri:
    addi x10, x10, -1
    jal x1, func 
    addi x6, x10, 0
    lw x1, 0(sp)
    lw x10, 4(sp)
    addi sp, sp, 8
    add x10, x10, x6
    jalr x0, 0(x1)

exit:
