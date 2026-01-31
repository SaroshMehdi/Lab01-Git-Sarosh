 .text
 .globl main

main:
    li x6, 0x100
    li x2, 5
    li x3, 6
    li x4, 7
    li x7, 8
    jal x1, swap
    j exit

swap:
    sw x2, 0(x6)
    sw x3, 4(x6)
    sw x4, 8(x6)
    sw x7, 12(x6)

    lw x10, 4(x6)
    lw x11, 8(x6)
    sw x11, 4(x6)
    sw x10, 8(x6)
    jalr x0, 0(x1)
exit:
